% invoke:
%    solve(4,S).  to get each solution to the 4-queens problem by using ; to bktrk
%
% or use:
%    findall(S,solve(4,S),L)  where L is the list of all solutions
%
% or use:
%    findall(S,solve(4,S),L), length(L,N).  Where N is the length of the list

solve(N,Solution) :-
    N1 is N + 1,
    make_cols_and_template(1,N1,Cols,Solution),
    solution(Cols,Solution).

make_cols_and_template(N,N,[],[])  :-  !.   %%%% note the cut
make_cols_and_template(M,N,C,S) :-
    M1 is M + 1,
    C = [M   | TC],
    S = [M/_ | TS],
    make_cols_and_template(M1,N,TC,TS).

solution( _, [] )  :-  !.
solution( Cols, [X/Y | Others] )  :-   % First queen at X/Y, other queens at Others
    solution( Cols, Others),
    member( Y, Cols ),
    noattack( X/Y, Others ).           % First queen does not attack others

noattack( _, [] )  :-  !.                     % Nothing to attack
noattack( X/Y, [X1/Y1 | Others] )  :-
    Y =\= Y1,                          % Different Y-coordinates
    Y1-Y =\= X1-X,                     % Different diagonals
    Y1-Y =\= X-X1,
    noattack( X/Y, Others ).
