sat_with_print([H|T]) :-
  write("Hello World").


sat([]).


elim_pos_clauses([]).
elim_pos_clauses([], 1).
elim_pos_clauses([],1, 2).

elim_neg_literal([]).
elim_neg_literal([],1).
elim_neg_literal([],1,2).
