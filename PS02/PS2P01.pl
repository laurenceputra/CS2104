% Name: Laurence Putra
% Matric: U096833E
% Email: laurenceputra@gmail.com

%split into car and cdr, b4 processing it
count(E, Op, C) :- E =..ETok, interpret(ETok, Op, C), !.
%if null list, return 0
interpret([], Op, 0) :- !.
%if car is atomic, and is = to the operand, recurse down 1 more layer, then add 1 to it
interpret([Car|Cdr], Op, C) :- atomic(Car), Op = Car, !, interpret(Cdr, Op, NewC), C is NewC + 1.
%else if it's atomic, ignore it and continue
interpret([Car|Cdr], Op, C) :- atomic(Car), !, interpret(Cdr, Op, C).
%else split it again and continue recursing
interpret([Car|Cdr], Op, C) :- Car =..CarTok, interpret(CarTok, Op, NewCA), interpret(Cdr, Op, NewCB), C is NewCA + NewCB, !.
