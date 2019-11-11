father(joel,reuben).
father(reuben,ralph).
father(ralph,rory).
father(rory,mario).
father(rory,luigi).

% gf(joel,ralph).
% gf(reuben,rory).

gf(GF,GC) :-
    father(GF,X),
    father(X,GC).

% gp(GP,GC) :- gf(GP,GC).
% gp(GP,GC) :- gm(GP,GC).
