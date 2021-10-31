import 'package:antlr4/antlr4.dart';
import 'package:flutter_excel/antlr/table_lexer.dart';
import 'package:flutter_excel/antlr/table_parser.dart';
import 'package:flutter_excel/antlr/table_visitor.dart';
import 'package:flutter_excel/helpers/index_converters.dart';
import 'package:flutter_excel/models/exceptions/cell_parser_error.dart';
import 'package:flutter_excel/models/parsing/parsing_result.dart';
import 'package:flutter_excel/models/table/cell_name/cell_name.dart';
import 'package:flutter_excel/models/table_data.dart';
import 'package:flutter_excel/services/cell_parser/exception_error_listener.dart';

class CellParser {
  ParsingResult evaluate(String expression, TableData table) {
    final stream = InputStream.fromString(expression);

    final lexer = tableLexer(stream)
      ..removeErrorListeners()
      ..addErrorListener(ExceptionErrorListener());
    final tokens = CommonTokenStream(lexer);

    final parser = tableParser(tokens)
      ..removeErrorListeners()
      ..addErrorListener(ExceptionErrorListener());
    final tree = parser.expression();

    final referencedCells = <CellName>{};

    final result = _CellParserVisitor(table, referencedCells).visit(tree);

    return ParsingResult(
      value: result,
      referencedCells: referencedCells
    );
  }
}

class _CellParserVisitor extends tableVisitor<dynamic> {
  final TableData table;
  final Set<CellName> referencedCells;

  _CellParserVisitor(this.table, this.referencedCells) : super();

  @override
  dynamic visitBoolCell(BoolCellContext ctx) {
    return _visitCell(ctx.text);
  }

  @override
  dynamic visitNumCell(NumCellContext ctx) {
    return _visitCell(ctx.text);
  }

  dynamic _visitCell(String name) {
    final cellName = CellName.fromString(name);

    referencedCells.add(cellName);

    final cell = table.getCell(cellName);

    return cell.data.value;
  }

  @override
  dynamic visitCellExpression(Cell_expressionContext ctx) {
    return visit(ctx.getChild(0));
  }

  @override
  dynamic visitAddOrSubtract(AddOrSubtractContext ctx) {
    if (ctx.operator?.text == '-') {
      return visit(ctx.left) - visit(ctx.right);
    }

    return visit(ctx.left) + visit(ctx.right);
  }

  @override
  dynamic visitAnd(AndContext ctx) {
    return visit(ctx.left_bool) && visit(ctx.right_bool);
  }

  @override
  dynamic visitBoolEqual(BoolEqualContext ctx) {
    return visit(ctx.left_bool) == visit(ctx.right_bool);
  }

  @override
  dynamic visitBoolParenthesis(BoolParenthesisContext ctx) {
    return visit(ctx.inner);
  }

  @override
  dynamic visitBoolean(BooleanContext ctx) {
    if (ctx.text == 'true') {
      return true;
    }

    return false;
  }

  @override
  dynamic visitExpression(ExpressionContext ctx) {
    return visit(ctx.getChild(0));
  }

  @override
  dynamic visitMultiplyOrDivide(MultiplyOrDivideContext ctx) {
    if (ctx.operator?.text == '/') {
      var right = visit(ctx.right);

      if (right == 0) {
        throw CellParserError('Division by zero');
      }

      return visit(ctx.left) / right;
    }

    return visit(ctx.left) * visit(ctx.right);
  }

  @override
  dynamic visitNegative(NegativeContext ctx) {
    return -visit(ctx.val);
  }

  @override
  dynamic visitNot(NotContext ctx) {
    return !visit(ctx.val);
  }

  @override
  dynamic visitNumCompare(NumCompareContext ctx) {
    final left = visit(ctx.left_num);
    final right = visit(ctx.right_num);

    switch(ctx.operator?.text) {
      case '<':
        return left < right;
      case '>':
        return left > right;
      case '>=':
        return left >= right;
      case '<=':
        return left <= right;
      default:
        return left < right || left > right;
    }
  }

  @override
  dynamic visitNumEqual(NumEqualContext ctx) {
    return visit(ctx.left_num) == visit(ctx.right_num);
  }

  @override
  dynamic visitNumParenthesis(NumParenthesisContext ctx) {
    return visit(ctx.inner);
  }

  @override
  dynamic visitNumber(NumberContext ctx) {
    return double.parse(ctx.text);
  }

  @override
  dynamic visitOr(OrContext ctx) {
    return visit(ctx.left_bool) || visit(ctx.right_bool);
  }
}
