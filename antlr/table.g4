grammar table;

NUMBER: [0-9]+([.][0-9]+)?;
BOOLEAN: 'true' | 'false';
CELL: [A-Z]+[0-9]+;

ADD: '+';
SUB: '-';
MUL: '*';
DIV: '/';

EQUAL: '='|'==';
LESS: '<';
GREATER: '>';
NOTLESS: '>=';
NOTGREATER: '<=';
LESSORGREATER: '<>';

NOT: 'not';
OR: 'or';
AND: 'and';

WHITESPACE: [ \r\n\t]+ -> skip;

expression
    : num_expression
    | bool_expression
    | cell_expression
    ;

num_expression
    : NUMBER # Number
    | operator=SUB val=num_expression # Negative
    | '(' inner=num_expression ')' # NumParenthesis
    | left=num_expression operator=(MUL|DIV) right=num_expression # MultiplyOrDivide
    | left=num_expression operator=(ADD|SUB) right=num_expression # AddOrSubtract
    | cell=cell_expression # NumCell
    ;

bool_expression
    : BOOLEAN # Boolean
    | '(' inner=bool_expression ')' # BoolParenthesis
    | operator=NOT val=bool_expression # Not
    |
        left_num=num_expression
        operator=(LESS|GREATER|NOTLESS|NOTGREATER|LESSORGREATER)
        right_num=num_expression
        # NumCompare
    | left_num=num_expression operator=EQUAL right_num=num_expression # NumEqual
    | left_bool=bool_expression operator=EQUAL right_bool=bool_expression # BoolEqual
    | left_bool=bool_expression operator=AND right_bool=bool_expression # And
    | left_bool=bool_expression operator=OR right_bool=bool_expression # Or
    | cell=cell_expression # BoolCell
    ;

cell_expression
    : CELL
    ;
