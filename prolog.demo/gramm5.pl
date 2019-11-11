
% sample query:  move(Dist,[up,down,up,up],[]).

move(D) --> step(D).
move(D) --> step(D1), move(D2), { D is D1 + D2 } .

step(+1) --> [up].
step(-1) --> [down].
