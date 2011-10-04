% Name: Laurence Putra
% Matric: U096833E
% Email: laurenceputra@gmail.com

ma(Exp) :-
	Exp =.. [;, First, Remain],
	First =.. [=, Var, Exp1],
	montage(Exp1, Var),
	ma(Remain),
	!.

ma(Exp) :-
	Exp =.. [=, Var, Exp1],
	montage(Exp1, Var),
	!.

%base case
montage(Exp, Output) :-
	scale(Exp, 100, 100, Output),
	!.

%the other cases for montage

%rotate base case
montage(Exp, Output) :-
	Exp =.. [rotate, Arg],
	atom(Arg),
	rotate(Arg, Output),
	!.

%rotate with more stuff inside it
montage(Exp, Output) :-
	Exp =.. [rotate, Arg],
	atom_concat(Output, '1', OutputTemp),
	montage(Arg, OutputTemp),
	rotate(OutputTemp, Output),
	!.

%beside base case
montage(Exp, Output) :-
	Exp =.. [beside, Arg1, Arg2],
	atom(Arg1),
	atom(Arg2),
	beside(Arg1, Arg2, Output),
	!.

%beside with more stuff inside it
montage(Exp, Output) :-
	Exp =.. [beside, Arg1, Arg2],
	atom_concat(Output, '1', OutputTemp1),
	atom_concat(Output, '2', OutputTemp2),
	montage(Arg1, OutputTemp1),
	montage(Arg2, OutputTemp2),
	beside(OutputTemp1, OutputTemp2, Output),
	!.

%the standard printing out part
beside(Arg1, Arg2, Output) :-
	atom(Arg1),
	atom(Arg2),
	atom_concat(Output, '1', OutputTemp1),
	atom_concat(Output, '2', OutputTemp2),
	scale(Arg1, 50, 100, OutputTemp1),
	scale(Arg2, 50, 100, OutputTemp2),
	write('convert +append '),
	write(OutputTemp1),
	write('.jpg '),
	write(OutputTemp2),
	write('.jpg '),
	write(Output),
	writeln('.jpg'),
	!.

rotate(Arg, Output) :-
	atom(Arg),
	write('convert -rotate 90 '),
	write(Arg),
	write('.jpg '),
	write(Output),
	writeln('.jpg'),
	!.

scale(Arg, Width, Height, Output) :-
	atom(Arg),
	write('convert -scale '),
	write(Width),
	write('%%x'),
	write(Height),
	write('%% '),
	write(Arg),
	write('.jpg '),
	write(Output),
	writeln('.jpg'),
	!.