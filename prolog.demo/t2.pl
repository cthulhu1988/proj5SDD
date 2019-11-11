% count the a's in a list
%    this one can get a bit tricky if you permit backtracking
%    since it has no cuts, but it can be good for demos e.g.:
%        acnt([a,b,c,a,d,e,f,a],C).    % with NO bktrk
%        acnt(L,4).    % with NO bktrk
%        acnt(L,C).    % with bktrk, i.e. produce lots of L&C
acnt([],0).
acnt([a|T],Cnt) :-
    acnt(T,TCnt),
    Cnt is TCnt + 1.
acnt([_|T],Cnt) :-
    acnt(T,Cnt).

% If X is a man, then X is mortal.
mortal(X) :- man(X).
mortal(X) :- woman(X).

man(confucius).
man(tom).

woman(sally).
woman(martha).

% see supply.pl for ~db demos
