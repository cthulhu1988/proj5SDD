a.
p(1).

man(cletus).
man(plato).
man(socrates).

mortal(X) :- man(X).

g(a,b).
g(b,c).
g(c,d).
g(d,h).
g(a,e).
g(e,f).
g(f,i).
g(f,h).

path(X,X).
path(X,Y) :- g(X,Z), path(Z,Y).
path(X,Y) :- g(Y,Z), path(Z,X).

mem(X,[X|T]).
mem(X,[Y|T]) :- mem(X,T).

app([],L,L).
app([X|T1], L2, [X|T3] ) :-
    app(T1,L2,T3).
