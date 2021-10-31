import 'package:antlr4/antlr4.dart';
import 'package:flutter_excel/models/exceptions/cell_parser_error.dart';

class ExceptionErrorListener extends BaseErrorListener {

  @override
  void syntaxError(dynamic recognizer, Object offendingSymbol,
      int line, int charPositionInLine, String msg, RecognitionException e) {
    throw CellParserError(msg);
  }
}
