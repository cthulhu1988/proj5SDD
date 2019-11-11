
% sample query:   s(F,R,[select,all,from,table1],[]).
%   retrieves Field all from Relation table1

s(F,R) --> [select], field(F), [from], rel(R).
field(X) --> [X].
rel(X) --> [X].
