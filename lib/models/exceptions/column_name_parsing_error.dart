import 'package:flutter_excel/models/exceptions/cell_parser_error.dart';

class ColumnNameParsingError extends CellParserError {
  ColumnNameParsingError(String message) : super(message);
}
