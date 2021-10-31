// Generated from antlr/table.g4 by ANTLR 4.9
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'table_parser.dart';

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [tableParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class tableVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [tableParser.expression].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitExpression(ExpressionContext ctx);

  /// Visit a parse tree produced by the {@code MultiplyOrDivide}
  /// labeled alternative in {@link tableParser#num_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitMultiplyOrDivide(MultiplyOrDivideContext ctx);

  /// Visit a parse tree produced by the {@code Number}
  /// labeled alternative in {@link tableParser#num_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitNumber(NumberContext ctx);

  /// Visit a parse tree produced by the {@code Negative}
  /// labeled alternative in {@link tableParser#num_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitNegative(NegativeContext ctx);

  /// Visit a parse tree produced by the {@code NumCell}
  /// labeled alternative in {@link tableParser#num_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitNumCell(NumCellContext ctx);

  /// Visit a parse tree produced by the {@code AddOrSubtract}
  /// labeled alternative in {@link tableParser#num_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitAddOrSubtract(AddOrSubtractContext ctx);

  /// Visit a parse tree produced by the {@code NumParenthesis}
  /// labeled alternative in {@link tableParser#num_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitNumParenthesis(NumParenthesisContext ctx);

  /// Visit a parse tree produced by the {@code BoolCell}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitBoolCell(BoolCellContext ctx);

  /// Visit a parse tree produced by the {@code Not}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitNot(NotContext ctx);

  /// Visit a parse tree produced by the {@code Or}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitOr(OrContext ctx);

  /// Visit a parse tree produced by the {@code And}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitAnd(AndContext ctx);

  /// Visit a parse tree produced by the {@code NumCompare}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitNumCompare(NumCompareContext ctx);

  /// Visit a parse tree produced by the {@code NumEqual}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitNumEqual(NumEqualContext ctx);

  /// Visit a parse tree produced by the {@code Boolean}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitBoolean(BooleanContext ctx);

  /// Visit a parse tree produced by the {@code BoolEqual}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitBoolEqual(BoolEqualContext ctx);

  /// Visit a parse tree produced by the {@code BoolParenthesis}
  /// labeled alternative in {@link tableParser#bool_expression}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitBoolParenthesis(BoolParenthesisContext ctx);

  /// Visit a parse tree produced by [tableParser.cell_expression].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T visitCellExpression(Cell_expressionContext ctx);
}
