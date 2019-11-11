% arity = 1
accepts(L) :- 
    accepts(s1,L).

% arity = 2
accepts(S,[]) :-
    final(S).
accepts(S,[H|T]) :-
    transition(S,H,NewS),
    accepts(NewS,T).

transition(s1,a,s2).
transition(s1,b,s4).
transition(s2,a,s3).
transition(s2,b,s1).
transition(s3,a,s4).
transition(s3,b,s2).
transition(s4,a,s4).
transition(s4,b,s4).

final(s1).
