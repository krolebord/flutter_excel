
// Generated from antlr/table.g4 by ANTLR 4.9
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';
import 'dart:io';

import 'table_visitor.dart';
import 'table_base_visitor.dart';

const int RULE_expression = 0, RULE_num_expression = 1, RULE_bool_expression = 2, 
          RULE_cell_expression = 3;
class tableParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.9', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_NUMBER = 3, TOKEN_BOOLEAN = 4, 
                   TOKEN_CELL = 5, TOKEN_ADD = 6, TOKEN_SUB = 7, TOKEN_MUL = 8, 
                   TOKEN_DIV = 9, TOKEN_EQUAL = 10, TOKEN_LESS = 11, TOKEN_GREATER = 12, 
                   TOKEN_NOTLESS = 13, TOKEN_NOTGREATER = 14, TOKEN_LESSORGREATER = 15, 
                   TOKEN_NOT = 16, TOKEN_OR = 17, TOKEN_AND = 18, TOKEN_WHITESPACE = 19;

  @override
  final List<String> ruleNames = [
    'expression', 'num_expression', 'bool_expression', 'cell_expression'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'('", "')'", null, null, null, "'+'", "'-'", "'*'", "'/'", 
      null, "'<'", "'>'", "'>='", "'<='", "'<>'", "'not'", "'or'", "'and'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, "NUMBER", "BOOLEAN", "CELL", "ADD", "SUB", "MUL", 
      "DIV", "EQUAL", "LESS", "GREATER", "NOTLESS", "NOTGREATER", "LESSORGREATER", 
      "NOT", "OR", "AND", "WHITESPACE"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES as List<String>, _SYMBOLIC_NAMES as List<String>);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'table.g4';

  @override
  String get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  tableParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  ExpressionContext expression() {
    dynamic _localctx = ExpressionContext(context, state);
    enterRule(_localctx, 0, RULE_expression);
    try {
      state = 11;
      errorHandler.sync(this);
      switch (interpreter.adaptivePredict(tokenStream, 0, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 8;
        num_expression(0);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 9;
        bool_expression(0);
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 10;
        cell_expression();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Num_expressionContext num_expression([int _p = 0]) {
    final _parentctx = context;
    final _parentState = state;
    dynamic _localctx = Num_expressionContext(context, _parentState);
    var _prevctx = _localctx;
    var _startState = 2;
    enterRecursionRule(_localctx, 2, RULE_num_expression, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 22;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)) {
      case TOKEN_NUMBER:
        _localctx = NumberContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;

        state = 14;
        match(TOKEN_NUMBER);
        break;
      case TOKEN_SUB:
        _localctx = NegativeContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 15;
        _localctx.operator = match(TOKEN_SUB);
        state = 16;
        _localctx.val = num_expression(5);
        break;
      case TOKEN_T__0:
        _localctx = NumParenthesisContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 17;
        match(TOKEN_T__0);
        state = 18;
        _localctx.inner = num_expression(0);
        state = 19;
        match(TOKEN_T__1);
        break;
      case TOKEN_CELL:
        _localctx = NumCellContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 21;
        _localctx.cell = cell_expression();
        break;
      default:
        throw NoViableAltException(this);
      }
      context.stop = tokenStream.LT(-1);
      state = 32;
      errorHandler.sync(this);
      _alt = interpreter.adaptivePredict(tokenStream, 3, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 30;
          errorHandler.sync(this);
          switch (interpreter.adaptivePredict(tokenStream, 2, context)) {
          case 1:
            _localctx = MultiplyOrDivideContext(new Num_expressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_num_expression);
            state = 24;
            if (!(precpred(context, 3))) {
              throw FailedPredicateException(this, "precpred(context, 3)");
            }
            state = 25;
            _localctx.operator = tokenStream.LT(1);
            _la = tokenStream.LA(1);
            if (!(_la == TOKEN_MUL || _la == TOKEN_DIV)) {
              _localctx.operator = errorHandler.recoverInline(this);
            } else {
              if ( tokenStream.LA(1)==IntStream.EOF ) matchedEOF = true;
              errorHandler.reportMatch(this);
              consume();
            }
            state = 26;
            _localctx.right = num_expression(4);
            break;
          case 2:
            _localctx = AddOrSubtractContext(new Num_expressionContext(_parentctx, _parentState));
            _localctx.left = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_num_expression);
            state = 27;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 28;
            _localctx.operator = tokenStream.LT(1);
            _la = tokenStream.LA(1);
            if (!(_la == TOKEN_ADD || _la == TOKEN_SUB)) {
              _localctx.operator = errorHandler.recoverInline(this);
            } else {
              if ( tokenStream.LA(1)==IntStream.EOF ) matchedEOF = true;
              errorHandler.reportMatch(this);
              consume();
            }
            state = 29;
            _localctx.right = num_expression(3);
            break;
          } 
        }
        state = 34;
        errorHandler.sync(this);
        _alt = interpreter.adaptivePredict(tokenStream, 3, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return _localctx;
  }

  Bool_expressionContext bool_expression([int _p = 0]) {
    final _parentctx = context;
    final _parentState = state;
    dynamic _localctx = Bool_expressionContext(context, _parentState);
    var _prevctx = _localctx;
    var _startState = 4;
    enterRecursionRule(_localctx, 4, RULE_bool_expression, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 52;
      errorHandler.sync(this);
      switch (interpreter.adaptivePredict(tokenStream, 4, context)) {
      case 1:
        _localctx = BooleanContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;

        state = 36;
        match(TOKEN_BOOLEAN);
        break;
      case 2:
        _localctx = BoolParenthesisContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 37;
        match(TOKEN_T__0);
        state = 38;
        _localctx.inner = bool_expression(0);
        state = 39;
        match(TOKEN_T__1);
        break;
      case 3:
        _localctx = NotContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 41;
        _localctx.operator = match(TOKEN_NOT);
        state = 42;
        _localctx.val = bool_expression(7);
        break;
      case 4:
        _localctx = NumCompareContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 43;
        _localctx.left_num = num_expression(0);
        state = 44;
        _localctx.operator = tokenStream.LT(1);
        _la = tokenStream.LA(1);
        if (!((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_LESS) | (BigInt.one << TOKEN_GREATER) | (BigInt.one << TOKEN_NOTLESS) | (BigInt.one << TOKEN_NOTGREATER) | (BigInt.one << TOKEN_LESSORGREATER))) != BigInt.zero))) {
          _localctx.operator = errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)==IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 45;
        _localctx.right_num = num_expression(0);
        break;
      case 5:
        _localctx = NumEqualContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 47;
        _localctx.left_num = num_expression(0);
        state = 48;
        _localctx.operator = match(TOKEN_EQUAL);
        state = 49;
        _localctx.right_num = num_expression(0);
        break;
      case 6:
        _localctx = BoolCellContext(_localctx);
        context = _localctx;
        _prevctx = _localctx;
        state = 51;
        _localctx.cell = cell_expression();
        break;
      }
      context.stop = tokenStream.LT(-1);
      state = 65;
      errorHandler.sync(this);
      _alt = interpreter.adaptivePredict(tokenStream, 6, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 63;
          errorHandler.sync(this);
          switch (interpreter.adaptivePredict(tokenStream, 5, context)) {
          case 1:
            _localctx = BoolEqualContext(new Bool_expressionContext(_parentctx, _parentState));
            _localctx.left_bool = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_bool_expression);
            state = 54;
            if (!(precpred(context, 4))) {
              throw FailedPredicateException(this, "precpred(context, 4)");
            }
            state = 55;
            _localctx.operator = match(TOKEN_EQUAL);
            state = 56;
            _localctx.right_bool = bool_expression(5);
            break;
          case 2:
            _localctx = AndContext(new Bool_expressionContext(_parentctx, _parentState));
            _localctx.left_bool = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_bool_expression);
            state = 57;
            if (!(precpred(context, 3))) {
              throw FailedPredicateException(this, "precpred(context, 3)");
            }
            state = 58;
            _localctx.operator = match(TOKEN_AND);
            state = 59;
            _localctx.right_bool = bool_expression(4);
            break;
          case 3:
            _localctx = OrContext(new Bool_expressionContext(_parentctx, _parentState));
            _localctx.left_bool = _prevctx;
            pushNewRecursionContext(_localctx, _startState, RULE_bool_expression);
            state = 60;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 61;
            _localctx.operator = match(TOKEN_OR);
            state = 62;
            _localctx.right_bool = bool_expression(3);
            break;
          } 
        }
        state = 67;
        errorHandler.sync(this);
        _alt = interpreter.adaptivePredict(tokenStream, 6, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return _localctx;
  }

  Cell_expressionContext cell_expression() {
    dynamic _localctx = Cell_expressionContext(context, state);
    enterRule(_localctx, 6, RULE_cell_expression);
    try {
      enterOuterAlt(_localctx, 1);
      state = 68;
      match(TOKEN_CELL);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  @override
  bool sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
    switch (ruleIndex) {
    case 1:
      return _num_expression_sempred(_localctx as Num_expressionContext, predIndex);
    case 2:
      return _bool_expression_sempred(_localctx as Bool_expressionContext, predIndex);
    }
    return true;
  }
  bool _num_expression_sempred(Num_expressionContext _localctx, int predIndex) {
    switch (predIndex) {
      case 0: return precpred(context, 3);
      case 1: return precpred(context, 2);
    }
    return true;
  }
  bool _bool_expression_sempred(Bool_expressionContext _localctx, int predIndex) {
    switch (predIndex) {
      case 2: return precpred(context, 4);
      case 3: return precpred(context, 3);
      case 4: return precpred(context, 2);
    }
    return true;
  }

  static const String _serializedATN = '\u{3}\u{608B}\u{A72A}\u{8133}\u{B9ED}'
  	'\u{417C}\u{3BE7}\u{7786}\u{5964}\u{3}\u{15}\u{49}\u{4}\u{2}\u{9}\u{2}'
  	'\u{4}\u{3}\u{9}\u{3}\u{4}\u{4}\u{9}\u{4}\u{4}\u{5}\u{9}\u{5}\u{3}\u{2}'
  	'\u{3}\u{2}\u{3}\u{2}\u{5}\u{2}\u{E}\u{A}\u{2}\u{3}\u{3}\u{3}\u{3}\u{3}'
  	'\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{5}'
  	'\u{3}\u{19}\u{A}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}\u{3}'
  	'\u{3}\u{3}\u{7}\u{3}\u{21}\u{A}\u{3}\u{C}\u{3}\u{E}\u{3}\u{24}\u{B}\u{3}'
  	'\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}'
  	'\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}'
  	'\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{5}\u{4}\u{37}\u{A}\u{4}\u{3}\u{4}\u{3}'
  	'\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}\u{4}\u{3}'
  	'\u{4}\u{7}\u{4}\u{42}\u{A}\u{4}\u{C}\u{4}\u{E}\u{4}\u{45}\u{B}\u{4}\u{3}'
  	'\u{5}\u{3}\u{5}\u{3}\u{5}\u{2}\u{4}\u{4}\u{6}\u{6}\u{2}\u{4}\u{6}\u{8}'
  	'\u{2}\u{5}\u{3}\u{2}\u{A}\u{B}\u{3}\u{2}\u{8}\u{9}\u{3}\u{2}\u{D}\u{11}'
  	'\u{2}\u{53}\u{2}\u{D}\u{3}\u{2}\u{2}\u{2}\u{4}\u{18}\u{3}\u{2}\u{2}\u{2}'
  	'\u{6}\u{36}\u{3}\u{2}\u{2}\u{2}\u{8}\u{46}\u{3}\u{2}\u{2}\u{2}\u{A}\u{E}'
  	'\u{5}\u{4}\u{3}\u{2}\u{B}\u{E}\u{5}\u{6}\u{4}\u{2}\u{C}\u{E}\u{5}\u{8}'
  	'\u{5}\u{2}\u{D}\u{A}\u{3}\u{2}\u{2}\u{2}\u{D}\u{B}\u{3}\u{2}\u{2}\u{2}'
  	'\u{D}\u{C}\u{3}\u{2}\u{2}\u{2}\u{E}\u{3}\u{3}\u{2}\u{2}\u{2}\u{F}\u{10}'
  	'\u{8}\u{3}\u{1}\u{2}\u{10}\u{19}\u{7}\u{5}\u{2}\u{2}\u{11}\u{12}\u{7}'
  	'\u{9}\u{2}\u{2}\u{12}\u{19}\u{5}\u{4}\u{3}\u{7}\u{13}\u{14}\u{7}\u{3}'
  	'\u{2}\u{2}\u{14}\u{15}\u{5}\u{4}\u{3}\u{2}\u{15}\u{16}\u{7}\u{4}\u{2}'
  	'\u{2}\u{16}\u{19}\u{3}\u{2}\u{2}\u{2}\u{17}\u{19}\u{5}\u{8}\u{5}\u{2}'
  	'\u{18}\u{F}\u{3}\u{2}\u{2}\u{2}\u{18}\u{11}\u{3}\u{2}\u{2}\u{2}\u{18}'
  	'\u{13}\u{3}\u{2}\u{2}\u{2}\u{18}\u{17}\u{3}\u{2}\u{2}\u{2}\u{19}\u{22}'
  	'\u{3}\u{2}\u{2}\u{2}\u{1A}\u{1B}\u{C}\u{5}\u{2}\u{2}\u{1B}\u{1C}\u{9}'
  	'\u{2}\u{2}\u{2}\u{1C}\u{21}\u{5}\u{4}\u{3}\u{6}\u{1D}\u{1E}\u{C}\u{4}'
  	'\u{2}\u{2}\u{1E}\u{1F}\u{9}\u{3}\u{2}\u{2}\u{1F}\u{21}\u{5}\u{4}\u{3}'
  	'\u{5}\u{20}\u{1A}\u{3}\u{2}\u{2}\u{2}\u{20}\u{1D}\u{3}\u{2}\u{2}\u{2}'
  	'\u{21}\u{24}\u{3}\u{2}\u{2}\u{2}\u{22}\u{20}\u{3}\u{2}\u{2}\u{2}\u{22}'
  	'\u{23}\u{3}\u{2}\u{2}\u{2}\u{23}\u{5}\u{3}\u{2}\u{2}\u{2}\u{24}\u{22}'
  	'\u{3}\u{2}\u{2}\u{2}\u{25}\u{26}\u{8}\u{4}\u{1}\u{2}\u{26}\u{37}\u{7}'
  	'\u{6}\u{2}\u{2}\u{27}\u{28}\u{7}\u{3}\u{2}\u{2}\u{28}\u{29}\u{5}\u{6}'
  	'\u{4}\u{2}\u{29}\u{2A}\u{7}\u{4}\u{2}\u{2}\u{2A}\u{37}\u{3}\u{2}\u{2}'
  	'\u{2}\u{2B}\u{2C}\u{7}\u{12}\u{2}\u{2}\u{2C}\u{37}\u{5}\u{6}\u{4}\u{9}'
  	'\u{2D}\u{2E}\u{5}\u{4}\u{3}\u{2}\u{2E}\u{2F}\u{9}\u{4}\u{2}\u{2}\u{2F}'
  	'\u{30}\u{5}\u{4}\u{3}\u{2}\u{30}\u{37}\u{3}\u{2}\u{2}\u{2}\u{31}\u{32}'
  	'\u{5}\u{4}\u{3}\u{2}\u{32}\u{33}\u{7}\u{C}\u{2}\u{2}\u{33}\u{34}\u{5}'
  	'\u{4}\u{3}\u{2}\u{34}\u{37}\u{3}\u{2}\u{2}\u{2}\u{35}\u{37}\u{5}\u{8}'
  	'\u{5}\u{2}\u{36}\u{25}\u{3}\u{2}\u{2}\u{2}\u{36}\u{27}\u{3}\u{2}\u{2}'
  	'\u{2}\u{36}\u{2B}\u{3}\u{2}\u{2}\u{2}\u{36}\u{2D}\u{3}\u{2}\u{2}\u{2}'
  	'\u{36}\u{31}\u{3}\u{2}\u{2}\u{2}\u{36}\u{35}\u{3}\u{2}\u{2}\u{2}\u{37}'
  	'\u{43}\u{3}\u{2}\u{2}\u{2}\u{38}\u{39}\u{C}\u{6}\u{2}\u{2}\u{39}\u{3A}'
  	'\u{7}\u{C}\u{2}\u{2}\u{3A}\u{42}\u{5}\u{6}\u{4}\u{7}\u{3B}\u{3C}\u{C}'
  	'\u{5}\u{2}\u{2}\u{3C}\u{3D}\u{7}\u{14}\u{2}\u{2}\u{3D}\u{42}\u{5}\u{6}'
  	'\u{4}\u{6}\u{3E}\u{3F}\u{C}\u{4}\u{2}\u{2}\u{3F}\u{40}\u{7}\u{13}\u{2}'
  	'\u{2}\u{40}\u{42}\u{5}\u{6}\u{4}\u{5}\u{41}\u{38}\u{3}\u{2}\u{2}\u{2}'
  	'\u{41}\u{3B}\u{3}\u{2}\u{2}\u{2}\u{41}\u{3E}\u{3}\u{2}\u{2}\u{2}\u{42}'
  	'\u{45}\u{3}\u{2}\u{2}\u{2}\u{43}\u{41}\u{3}\u{2}\u{2}\u{2}\u{43}\u{44}'
  	'\u{3}\u{2}\u{2}\u{2}\u{44}\u{7}\u{3}\u{2}\u{2}\u{2}\u{45}\u{43}\u{3}'
  	'\u{2}\u{2}\u{2}\u{46}\u{47}\u{7}\u{7}\u{2}\u{2}\u{47}\u{9}\u{3}\u{2}'
  	'\u{2}\u{2}\u{9}\u{D}\u{18}\u{20}\u{22}\u{36}\u{41}\u{43}';
  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN.codeUnits);
}
class ExpressionContext extends ParserRuleContext {
  Num_expressionContext num_expression() => getRuleContext<Num_expressionContext>(0);
  Bool_expressionContext bool_expression() => getRuleContext<Bool_expressionContext>(0);
  Cell_expressionContext cell_expression() => getRuleContext<Cell_expressionContext>(0);
  ExpressionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_expression;
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitExpression(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class Num_expressionContext extends ParserRuleContext {
  Num_expressionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_num_expression;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class Bool_expressionContext extends ParserRuleContext {
  Bool_expressionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_bool_expression;
 
  @override
  void copyFrom(ParserRuleContext ctx) {
    super.copyFrom(ctx);
  }
}

class Cell_expressionContext extends ParserRuleContext {
  TerminalNode CELL() => getToken(tableParser.TOKEN_CELL, 0);
  Cell_expressionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_cell_expression;
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitCellExpression(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class MultiplyOrDivideContext extends Num_expressionContext {
  Num_expressionContext? left;
  Token? operator;
  Num_expressionContext? right;
  List<Num_expressionContext> num_expressions() => getRuleContexts<Num_expressionContext>();
  Num_expressionContext num_expression(int i) => getRuleContext<Num_expressionContext>(i);
  TerminalNode MUL() => getToken(tableParser.TOKEN_MUL, 0);
  TerminalNode DIV() => getToken(tableParser.TOKEN_DIV, 0);
  MultiplyOrDivideContext(Num_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitMultiplyOrDivide(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NumberContext extends Num_expressionContext {
  TerminalNode NUMBER() => getToken(tableParser.TOKEN_NUMBER, 0);
  NumberContext(Num_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitNumber(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NegativeContext extends Num_expressionContext {
  Token? operator;
  Num_expressionContext? val;
  TerminalNode SUB() => getToken(tableParser.TOKEN_SUB, 0);
  Num_expressionContext num_expression() => getRuleContext<Num_expressionContext>(0);
  NegativeContext(Num_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitNegative(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NumCellContext extends Num_expressionContext {
  Cell_expressionContext? cell;
  Cell_expressionContext cell_expression() => getRuleContext<Cell_expressionContext>(0);
  NumCellContext(Num_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitNumCell(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class AddOrSubtractContext extends Num_expressionContext {
  Num_expressionContext? left;
  Token? operator;
  Num_expressionContext? right;
  List<Num_expressionContext> num_expressions() => getRuleContexts<Num_expressionContext>();
  Num_expressionContext num_expression(int i) => getRuleContext<Num_expressionContext>(i);
  TerminalNode ADD() => getToken(tableParser.TOKEN_ADD, 0);
  TerminalNode SUB() => getToken(tableParser.TOKEN_SUB, 0);
  AddOrSubtractContext(Num_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitAddOrSubtract(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NumParenthesisContext extends Num_expressionContext {
  Num_expressionContext? inner;
  Num_expressionContext num_expression() => getRuleContext<Num_expressionContext>(0);
  NumParenthesisContext(Num_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitNumParenthesis(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}class BoolCellContext extends Bool_expressionContext {
  Cell_expressionContext? cell;
  Cell_expressionContext cell_expression() => getRuleContext<Cell_expressionContext>(0);
  BoolCellContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitBoolCell(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NotContext extends Bool_expressionContext {
  Token? operator;
  Bool_expressionContext? val;
  TerminalNode NOT() => getToken(tableParser.TOKEN_NOT, 0);
  Bool_expressionContext bool_expression() => getRuleContext<Bool_expressionContext>(0);
  NotContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitNot(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class OrContext extends Bool_expressionContext {
  Bool_expressionContext? left_bool;
  Token? operator;
  Bool_expressionContext? right_bool;
  List<Bool_expressionContext> bool_expressions() => getRuleContexts<Bool_expressionContext>();
  Bool_expressionContext bool_expression(int i) => getRuleContext<Bool_expressionContext>(i);
  TerminalNode OR() => getToken(tableParser.TOKEN_OR, 0);
  OrContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitOr(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class AndContext extends Bool_expressionContext {
  Bool_expressionContext? left_bool;
  Token? operator;
  Bool_expressionContext? right_bool;
  List<Bool_expressionContext> bool_expressions() => getRuleContexts<Bool_expressionContext>();
  Bool_expressionContext bool_expression(int i) => getRuleContext<Bool_expressionContext>(i);
  TerminalNode AND() => getToken(tableParser.TOKEN_AND, 0);
  AndContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitAnd(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NumCompareContext extends Bool_expressionContext {
  Num_expressionContext? left_num;
  Token? operator;
  Num_expressionContext? right_num;
  List<Num_expressionContext> num_expressions() => getRuleContexts<Num_expressionContext>();
  Num_expressionContext num_expression(int i) => getRuleContext<Num_expressionContext>(i);
  TerminalNode LESS() => getToken(tableParser.TOKEN_LESS, 0);
  TerminalNode GREATER() => getToken(tableParser.TOKEN_GREATER, 0);
  TerminalNode NOTLESS() => getToken(tableParser.TOKEN_NOTLESS, 0);
  TerminalNode NOTGREATER() => getToken(tableParser.TOKEN_NOTGREATER, 0);
  TerminalNode LESSORGREATER() => getToken(tableParser.TOKEN_LESSORGREATER, 0);
  NumCompareContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitNumCompare(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NumEqualContext extends Bool_expressionContext {
  Num_expressionContext? left_num;
  Token? operator;
  Num_expressionContext? right_num;
  List<Num_expressionContext> num_expressions() => getRuleContexts<Num_expressionContext>();
  Num_expressionContext num_expression(int i) => getRuleContext<Num_expressionContext>(i);
  TerminalNode EQUAL() => getToken(tableParser.TOKEN_EQUAL, 0);
  NumEqualContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitNumEqual(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BooleanContext extends Bool_expressionContext {
  TerminalNode BOOLEAN() => getToken(tableParser.TOKEN_BOOLEAN, 0);
  BooleanContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitBoolean(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BoolEqualContext extends Bool_expressionContext {
  Bool_expressionContext? left_bool;
  Token? operator;
  Bool_expressionContext? right_bool;
  List<Bool_expressionContext> bool_expressions() => getRuleContexts<Bool_expressionContext>();
  Bool_expressionContext bool_expression(int i) => getRuleContext<Bool_expressionContext>(i);
  TerminalNode EQUAL() => getToken(tableParser.TOKEN_EQUAL, 0);
  BoolEqualContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitBoolEqual(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class BoolParenthesisContext extends Bool_expressionContext {
  Bool_expressionContext? inner;
  Bool_expressionContext bool_expression() => getRuleContext<Bool_expressionContext>(0);
  BoolParenthesisContext(Bool_expressionContext ctx) { copyFrom(ctx); }
  @override
  T accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is tableVisitor<T>) {
     return visitor.visitBoolParenthesis(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}
