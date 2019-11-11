
% trace.
% then
%    f(a).  % fails
%    f(33). % fails
%    f(44). % succeeds


f(X) :- g(X), h(X).

g(X) :- i(X), j(X).
g(X) :- k(X), l(X).

i(33).
i(44).

j(55).

k(44).

l(44).

h(44).

