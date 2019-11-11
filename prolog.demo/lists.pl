% member is a built-in to gprolog
% mem(X,[H|_]) :- X == H.
mem(H,[H|_]).
mem(X,[_|T]) :-
    mem(X,T).

% append is a built-in to gprolog
app([],L,L).
app([H|T],L,[H|U]) :-
    app(T,L,U).

% reverse is a built-in to gprolog
rev([],[]).
rev([H|T],L) :-
    rev(T,R),
    app(R,[H],L).

% delete is a built-in to gprolog (delete(L,X,NewL))
del(H,[H|T],T).
del(X,[H|T],[H|Y]) :-
    del(X,T,Y).

intersect([H|T],L,[H|U]) :-
    member(H,L),
    intersect(T,L,U).
intersect([_|T],L,U) :-
    intersect(T,L,U).
intersect(_,_,[]).

union([],X,X).
union([X|T],Y,Z) :-
    member(X,Y),
    !,
    union(T,Y,Z).
union([X|T],Y,[X|Z]) :-
    union(T,Y,Z).


% length is a built-in to gprolog 
len([],0).
len([H|T],Len) :-
    len(T,LT),
    Len is LT + 1.


%% from swipl docs:
%% select(?Elem, ?List1, ?List2)
%%     Is true when List1, with Elem removed, results in List2.
%%     This implementation is determinsitic if the last element of List1 has been selected.

qs1 :- select(b,[a,b,c,d],[a,c,d]).

qs2 :- select(X,[a,b,c,d],[a,c,d]).

qs3 :- select(b,[a,b,c,d],X).
