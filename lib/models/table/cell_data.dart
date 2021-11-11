import 'package:flutter/foundation.dart';
import 'package:flutter_excel/models/exceptions/cell_parser_error.dart';
import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table/table_data.dart';
import 'package:flutter_excel/services/cell_parser/cell_parser.dart';

class CellData extends ChangeNotifier {
  final TableData table;
  CellName name;

  String text;

  dynamic _value;

  bool isTextExpression = false;

  CellData({
    required this.table,
    required this.name,
    this.text = ''
  }) {
    _value = text;
  }

  CellData.fromJson({
    required this.table,
    required this.name,
    required dynamic json
  }) :
    text = json['text'],
    isTextExpression = json['isText']
  {
    _value = text;
  }

  dynamic get value => _value;

  Map<String, dynamic> toJson() => {
    'name': name.text,
    'text': text,
    'isText': isTextExpression
  };

  void update() {
    if (text.isEmpty || isTextExpression) {
      table.references.stopListening(name);
      _value = text;

      notifyListeners();
      table.references.notifyListeners(name);
      return;
    }

    try {
      final result = CellParser.evaluate(text, table);

      _value = result.value;

      if(result.referencedCells.contains(name)) {
        throw CellParserError('Detected self reference');
      }

      table.references.stopListening(name);

      for(final reference in result.referencedCells) {
        table.references.addListener(name, reference);
      }

      if(table.references.containsCircularReference(name)) {
        throw CellParserError('Detected circular reference');
      }

      table.references.notifyListeners(name);
    }
    on CellParserError catch(error) {
      _value = '#ERROR ' + error.message;
    }
    catch(_) {
      _value = 'Invalid input';
    }

    notifyListeners();
  }
}
