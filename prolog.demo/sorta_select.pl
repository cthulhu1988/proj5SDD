
% lh(InList, ValToElim, ResultList) :-
%     InList == [H|T],
%     H == ValToElim,
%     lh(T,ValToElim,ResultList).

lh([ValToElim|T], ValToElim, ResultList) :-
    lh(T,ValToElim,ResultList).
lh([H|T], ValToElim, ResultList) :-
    H \== ValToElim,
    lh(T,ValToElim, IntermediateResultForTail),
    ResultList = [H | IntermediateResultForTail].
lh([],_,[]).
