% Name: Laurence Putra
% Matric: U096833E
% Email: laurenceputra@gmail.com

%base case
tile(0, Input, Output) :-
	scale(Input, 100, 100, Output),
	!.

%the other cases
tile(N, Input, Output) :-
	M is N - 1,
	atom_concat(Output, '1', OutputTemp),
	%does a recursion
	tile(M, Input, OutputTemp),
	arrange(OutputTemp, Input, Output),
	!.

%creates the existing layer
arrange(LayerBelow, CurrentLayer, Output) :-
	atom_concat(Output, 'a1', OutputTemp1),
	atom_concat(Output, 'a2', OutputTemp2),
	atom_concat(Output, 'a3', OutputTemp3),
	rotate(CurrentLayer, OutputTemp1),
	rotate(OutputTemp1, OutputTemp2),
	rotate(OutputTemp2, OutputTemp3),
	atom_concat(Output, 'a4', TopRow),
	atom_concat(Output, 'a5', BottomRow),
	atom_concat(Output, 'a6', OutputTemp6),
	atom_concat(Output, 'a7', OutputTemp7),
	beside(LayerBelow, OutputTemp1, TopRow),
	beside(OutputTemp3, OutputTemp2, BottomRow),
	rotate(TopRow, OutputTemp6),
	rotate(BottomRow, OutputTemp7),
	atom_concat(Output, 'a8', OutputTemp8),
	beside(OutputTemp7, OutputTemp6, OutputTemp8),
	rotate(OutputTemp8, OutputTemp8),
	rotate(OutputTemp8, OutputTemp8),
	rotate(OutputTemp8, Output),
	!.




beside(Arg1, Arg2, Output) :-
	atom(Arg1),
	atom(Arg2),
	atom_concat(Output, 'b1', OutputTemp1),
	atom_concat(Output, 'b2', OutputTemp2),
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
