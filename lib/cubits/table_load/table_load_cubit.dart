import 'dart:convert';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table/table_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'table_load_state.dart';
part 'table_load_cubit.freezed.dart';

class TableLoadCubit extends Cubit<TableLoadState> {
  final ColumnStyle defaultColumnStyle;
  final RowStyle defaultRowStyle;

  String? tablePath;
  TableData? table;

  TableLoadCubit({
    required this.defaultColumnStyle,
    required this.defaultRowStyle
  }) : super(const TableLoadState.notLoaded());

  Future<void> createNewTable(String name, BuildContext context) async {
    if(!await closeTable(context)) {
      return;
    }

    tablePath = null;
    table = TableData(
      name: name, defaultColumnStyle: defaultColumnStyle,
      defaultRowStyle: defaultRowStyle,
      initialRowsCount: 5,
      initialColumnsCount: 8
    );

    emit(TableLoadState.loaded(table!));
  }

  Future<void> saveTableAs() {
    tablePath = null;
    return saveTable();
  }

  Future<void> saveTable() async {
    final table = this.table;

    if(table == null) {
      return;
    }

    if (tablePath == null) {
      final typeGroups = [
        XTypeGroup(extensions: ['.💩'])
      ];
      final path = await getSavePath(suggestedName: table.name, acceptedTypeGroups: typeGroups);

      if(path == null) {
        return;
      }

      tablePath = path;
    }

    final name = table.name;

    final bytes = utf8.encode(json.encode(table.toJson()));
    final data = Uint8List.fromList(bytes);
    const mimeType = 'text/plain';

    final file = XFile.fromData(
      data,
      mimeType: mimeType,
      name: name,
      path: tablePath!
    );
    file.saveTo(tablePath!);
  }

  Future<void> openTable(BuildContext context) async {
    if (!await closeTable(context)) {
      return;
    }

    final typeGroups = [
      XTypeGroup(extensions: ['.💩', '.json'])
    ];
    final file = await openFile(acceptedTypeGroups: typeGroups);

    if(file == null) {
      return;
    }

    final content = await file.readAsString();

    final table = TableData.fromJson(
      json: json.decode(content),
      defaultColumnStyle: defaultColumnStyle,
      defaultRowStyle: defaultRowStyle
    );

    tablePath = file.path;
    this.table = table;

    emit(TableLoadState.loaded(table));
  }

  Future<bool> closeTable(BuildContext context) async {
    if(table == null) {
      tablePath = null;
      return true;
    }

    final result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Unsaved table'),
          content: const Text('Do you want to save or discard changes to this table?'),
          actions: [
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop(0);
              },
              child: const Text('Save'),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop(1);
              },
              child: const Text('Discard'),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop(2);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );

    if(result == null || result == 2) {
      return false;
    }

    if(result == 0) {
      await saveTable();
    }

    emit(const TableLoadState.notLoaded());

    tablePath = null;
    table = null;

    return true;
  }
}
