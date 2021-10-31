import 'package:flutter_excel/models/exceptions/cell_parser_error.dart';
import 'package:flutter_test/flutter_test.dart';

Matcher throwsParserError() => throwsA(isA<CellParserError>());
