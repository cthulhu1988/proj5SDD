mem(H,[H|_]).
mem(H,[_|T]) :- mem(H,T).

%% :- dynamic(f/2).

f(tom,bill).
f(tom,john).
f(tom,jim).
f(bill,alex).
f(bill,joseph).
f(jim,conner).
f(jim,able).
f(jim,bambi).

gf(X,Y) :- f(X,Z), f(Z,Y).

gs(C,A) :- gf(A,C).
