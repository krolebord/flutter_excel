import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excel/cubits/table_selection/table_selection_cubit.dart';
import 'package:flutter_excel/cubits/table_selection/table_selection_state_extensions.dart';
import 'package:flutter_excel/helpers/index_converters.dart';
import 'package:flutter_excel/hooks/use_custom_scroll_controller_hook.dart';
import 'package:flutter_excel/models/table/cell_data.dart';
import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table/column_data.dart';
import 'package:flutter_excel/models/table/row_data.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table/table_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:provider/provider.dart';

typedef CellBuilderFunction = Widget Function(
  BuildContext context,
  ColumnData column,
  RowData row,
  CellData cell
);

class TableView extends HookWidget {
  static const double _headerHeight = 48;
  static const double _sidebarWidth = 96;

  final TableData table;
  final CellBuilderFunction cellBuilder;

  const TableView({
    required this.table,
    required this.cellBuilder,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useListenable(table);

    final verticalGroup = useMemoized(() => LinkedScrollControllerGroup(), const [1]);
    final sidebarController = useCustomScrollController(() => verticalGroup.addAndGet());
    final bodyController = useCustomScrollController(() => verticalGroup.addAndGet());

    final horizontalGroup = useMemoized(() => LinkedScrollControllerGroup(), const [2]);
    final headerController = useCustomScrollController(() => horizontalGroup.addAndGet());

    final body = Column(
      children: [
        SizedBox(
          height: _headerHeight,
          child: Row(
            children: [
              _TableCell(
                width: _sidebarWidth,
                onTap: () {
                  context.read<TableSelectionCubit>().cancelSelection();
                },
                child: Container(),
              ),
              Expanded(
                child: _buildHeader(headerController),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: _sidebarWidth,
                child: _buildSidebar(sidebarController),
              ),
              Expanded(
                child: _TableBody(
                  table: table,
                  bodyController: bodyController,
                  controllerGroup: horizontalGroup,
                  cellBuilder: cellBuilder,
                )
              )
            ],
          ),
        )
      ],
    );

    return BlocBuilder<TableSelectionCubit, TableSelectionState>(
      builder: (context, state) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          physics: const ClampingScrollPhysics(),
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch
          }
        ),
        child: body,
      ),
    );
  }

  Widget _buildHeader(ScrollController controller) {
    final columns = table.getColumns();

    return Scrollbar(
      controller: controller,
      scrollbarOrientation: ScrollbarOrientation.top,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: columns.length + 1,
        itemBuilder: (context, index) {
          if(index >= columns.length) {
            return _TableCell(
              width: _sidebarWidth,
              onTap: () {
                table.addColumn();
              },
              child: const Tooltip(
                message: 'Add column',
                child: Icon(Icons.add),
              ),
            );
          }

          final column = columns[index];
          return BlocBuilder<TableSelectionCubit, TableSelectionState>(
            buildWhen: (previous, current) =>
              previous.isColumnSelected(column) || current.isColumnSelected(column),
            builder: (context, state) => HookBuilder(
              builder: (context) {
                useListenable(column);

                return _TableCell(
                  width: column.style.width,
                  onTap: () {
                    context.read<TableSelectionCubit>().selectColumn(column);
                  },
                  isSelected: state.isColumnSelected(column),
                  child: Center(
                    child: Text(columnNameFromInt(index+1)),
                  ),
                );
              }
            )
          );
        },
      ),
    );
  }

  Widget _buildSidebar(ScrollController controller) {
    final rows = table.getRows();

    return ListView.builder(
      controller: controller,
      itemCount: rows.length + 1,
      itemBuilder: (context, index) {
        if(index >= rows.length) {
          return _TableCell(
            height: _headerHeight,
            onTap: () {
              table.addRow();
            },
            child: const Tooltip(
              message: 'Add row',
              child: Icon(Icons.add),
            ),
          );
        }

        final row = rows[index];

        return BlocBuilder<TableSelectionCubit, TableSelectionState>(
          buildWhen: (previous, current) =>
          previous.isRowSelected(row) || current.isRowSelected(row),
          builder: (context, state) => HookBuilder(
            builder: (context) {
              useListenable(row);

              return _TableCell(
                height: row.style.height,
                onTap: () {
                  context.read<TableSelectionCubit>().selectRow(row);
                },
                isSelected: state.isRowSelected(row),
                child: Center(
                  child: Text((index + 1).toString()),
                ),
              );
            }
          )
        );
      },
    );
  }
}

class _TableBody extends HookWidget {
  final TableData table;
  final ScrollController bodyController;
  final LinkedScrollControllerGroup controllerGroup;
  final CellBuilderFunction cellBuilder;

  const _TableBody({
    required this.table,
    required this.bodyController,
    required this.controllerGroup,
    required this.cellBuilder,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      controller: bodyController,
      child: ListView.builder(
        controller: bodyController,
        itemCount: table.rowsCount,
        padding: const EdgeInsets.only(bottom: TableView._headerHeight),
        itemBuilder: (context, rowIndex) => HookBuilder(
          builder: (context) {
            final rowController = useCustomScrollController(() => controllerGroup.addAndGet());
            final row = useListenable(table.getRow(rowIndex+1));

            return SizedBox(
              height: row.style.height,
              child: ListView.builder(
                controller: rowController,
                itemCount: table.columnsCount,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: TableView._sidebarWidth),
                itemBuilder: (context, columnIndex) {
                  final cellName = CellName.fromIndex(column: columnIndex+1, row: rowIndex+1);

                  final column = table.getColumn(columnIndex+1);
                  final cell = table.getCell(cellName);

                  return BlocBuilder<TableSelectionCubit, TableSelectionState>(
                    buildWhen: (previous, current) =>
                      previous.isCellSelected(cell) || current.isCellSelected(cell),
                    builder: (context, state) => HookBuilder(
                      builder: (context) {
                        useListenable(column);
                        useListenable(cell);

                        return _TableCell(
                          height: row.style.height,
                          width: column.style.width,
                          onTap: () {
                            cell.update();
                            context.read<TableSelectionCubit>().selectCell(cell);
                          },
                          isSelected: state.isCellSelected(cell),
                          child: cellBuilder(context, column, row, cell)
                        );
                      }
                    )
                  );
                },
              ),
            );
          }
        )
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onTap;
  final bool isSelected;
  final Widget child;

  const _TableCell({
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.isSelected = false,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final decoration = isSelected
      ? BoxDecoration(
        border: Border.all(color: theme.indicatorColor)
      )
      : BoxDecoration(
        border: Border.all(color: Colors.white30)
      );

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        child: child
      )
    );
  }
}

