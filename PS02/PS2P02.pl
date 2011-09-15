% Name: Laurence Putra
% Matric: U096833E
% Email: laurenceputra@gmail.com

%The four ways to differentiate
derive(XA * XB, X, D) :- !, derive(XA, X, DA), derive(XB, X, DB), D = (DA * XB) + (DB * XA).
derive(XA / XB, X, D) :- !, derive(XA, X, DA), derive(XB, X, DB), D = ((DA * XB) - (DB * XA))/(DB * DB).
derive(XA + XB, X, D) :- !, derive(XA, X, DA), derive(XB, X, DB), D = DA + DB.
derive(XA - XB, X, D) :- !, derive(XA, X, DA), derive(XB, X, DB), D = DA - DB.

%The base cases
derive(X, X, 1) :- !.
derive(A, X, 0) :- !.
