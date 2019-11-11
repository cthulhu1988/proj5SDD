count_to_10(10) :- write(10), nl.

count_to_10(X) :-
  write(X), nl,
  Y is X + 1,
  count_to_10(Y).





warm_blooded(penguin).
warm_blooded(human).


produce_milk(penguin).
produce_milk(human).


have_feathers(penguin).
have_hair(human).

mammal(X) :- produce_milk(X), warm_blooded(X), have_hair(X).

write_to_file(File,Text) :-
  open(File,write, Stream),
  write(Stream, Text), nl,
  close(Stream).


read_file(File) :-
  open(File,read, Stream),
  get_char(Stream, Char1),
  process_stream(Char1, Stream),
  close(Stream).

process_stream(end_of_file, _) :- !.
process_stream(Char, Stream) :-
  write(Char),get_char(Stream, Char2),
  process_stream(Char2, Stream).



male(albert).
male(bob).
male(carl).
male(charlie).
male(dan).
male(edward).

female(diana).
female(alice).
female(betsy).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

related(X,Y) :- parent(X,Y).


related(X,Y) :-
  parent(X,Z),related(Z,Y).


fav_char :-
  write('what is your fav char: '), get(X), format("The ascii value is ~w ",[X]).


vertical(line(point(X,Y), point(X,Y2))).
horizontal(line(point(X,Y), point(X2, Y))).


customer(tom, smith, 20.55).


get_grandchild :- parent(X, Y), parent(Y,Z), format("~w ~s ~w", [Z, "is the grandchild of", X]).

brother(bob,bill).

grand_parent(X,Z) :- parent(X,Y), parent(Y,Z), format("~w ~s ~w",[X, "is the grandparent of", Z]).


stabs(tybalt, mercutio, sword).
hates(romeo,X) :- stabs(X, mercutio, sword).


what_grade(Other) :- Grade is Other - 5, format("go to grade ~w",[Grade]).

has(albert, olive).
owns(albert, pet(cat,olive)).
