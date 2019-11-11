foo(a, b, c).
foo(a, b, d).
foo(b, c, e).
foo(b, c, f).
foo(c, c, g).

%% This is the demo proposed by help(bagof).
%% I added the last query.
%% NOTE A^  causes A to NOT be instantiated after query

%% bagof(C, foo(A, B, C), Cs).
%%
%%    A = a, B = b, C = G308, Cs = [c, d] ;
%%    A = b, B = c, C = G308, Cs = [e, f] ;
%%    A = c, B = c, C = G308, Cs = [g] ;

%% bagof(C, A^foo(A, B, C), Cs).
%%
%%    A = G324, B = b, C = G326, Cs = [c, d] ;
%%    A = G324, B = c, C = G326, Cs = [e, f, g] ;

%% bagof(C, A^B^foo(A, B, C), Cs).
%%
%%    A = G180, B = G181, C = G182, Cs = [c, d, e, f, g] 
