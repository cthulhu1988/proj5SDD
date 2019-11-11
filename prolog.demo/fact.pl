
fact(0,1).
fact(A,B) :-  
    A > 0, 
    C is A-1,
    fact(C,D),
    B is A*D.


:- dynamic(fact_with_memo/2).

fact_with_memo(0,1).
fact_with_memo(A,B) :-  
    A > 0, 
    C is A-1,
    fact(C,D),
    B is A*D,
    asserta( fact_with_memo(A,B) ).
