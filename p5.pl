sat_with_print(Dimac) :-
    vars_dimac(Dimac,Vars),
    assign_free_vars(Vars,VarsValues),
    sat_with_print(VarsValues,Dimac,[]),
	 write(VarsValues).

sat_with_print(VarValues,Dimac0,Dimac1) :-
    \+ empty_clause(Dimac0),
    VarValues = [(Var,Value)|VarValues1],
    assign_unit_clauses(VarValues,Dimac0,IDimac1),
    boolean(Value),
    simpl((Var,Value),IDimac1,IDimac2),
    sat_with_print(VarValues1,IDimac2,Dimac1).

sat_with_print([],Dimac,Dimac).


vars_dimac(DIMAC,Unique) :-
    flatten(DIMAC,I1),
    to_positive(I1,I2),
    list_to_set(I2,Unique).


to_positive([Z|Zs],[N|Ns]) :-
    ((0 > Z) ->
        N is 0 - Z
    ;   N = Z),
    to_positive(Zs,Ns).
to_positive([],[]).

assign_free_vars([Head0|Tail0],[(Head0,_)|Tail1]) :-
    assign_free_vars(Tail0,Tail1).

assign_free_vars([],[]).


simpl((Var,'1'),[Line0|Lines0], Lines1) :-
    member(Var,Line0),
    simpl((Var,'1'),Lines0,Lines1).
simpl((Var,'0'),[Line0|Lines0], Lines1) :-
    NegVar is 0 - Var,
    member(NegVar,Line0),
    simpl((Var,'0'),Lines0,Lines1).
simpl((Var,Value),[Line0|Lines0], [Line1|Lines1]) :-
    NegVar is 0 - Var,
    \+ (member(Var,Line0), Value = '1'),
    \+ (member(NegVar,Line0), Value = '0'),
    simpl_line((Var,Value),Line0,Line1),
    simpl((Var,Value),Lines0,Lines1).
simpl((_,_),[],[]).


simpl_line((Var,'0'),Line0,Line1) :-
    member(Var,Line0),
    subtract(Line0,[Var],Line1).
simpl_line((Var,'1'),Line0,Line1) :-
    NegVar is 0 - Var,
    member(NegVar,Line0),
    subtract(Line0,[NegVar],Line1).
simpl_line((Var,_),Line0,Line0) :-
    NegVar is 0 - Var,
    \+ member(Var,Line0),
    \+ member(NegVar,Line0).

empty_clause(dimac0) :-
    element([],dimac0).

assign_unit_clauses(VarValues,Dimac0,Dimac1) :-
    get_unit_clauses(Dimac0,Units),
    (dif(Units,[]) ->
        remove_units(Units,VarValues,Dimac0,IDimac1),
        assign_unit_clauses(VarValues,IDimac1,Dimac1)
        ;Dimac0 = Dimac1
    ).
assign_unit_clauses(_,Dimac0,Dimac0) :-
    get_unit_clauses(Dimac0,[]).


get_unit_clauses([[Unit]|Lines],[Unit|Units]) :-
    get_unit_clauses(Lines,Units).
get_unit_clauses([Line|Lines],Units) :-
    dif(Line,[_]),
    get_unit_clauses(Lines,Units).
get_unit_clauses([],[]).


remove_units([Var|Vars],VarValues,Dimac0,Dimac1) :-
    (Var < 0 ->
            PosVar is 0 - (Var),
            VarValue = (PosVar,'0')
    ; VarValue = (Var,'1')
    ),
    member(VarValue,VarValues),
    simpl(VarValue,Dimac0,IDimac1),
    remove_units(Vars,VarValues,IDimac1,Dimac1).
remove_units([],_,Dimac0,Dimac0).





boolean('1').
boolean('0').
