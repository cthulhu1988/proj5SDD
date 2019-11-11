
%% strings need to be re-coded for swipl and new gprolog

demo1 :- eval_pieces(StartL,GeneL,StopL,["atg","gggggg","tag"],[]),
         gene_len_3x(GeneL),
         name(Start,StartL), print(Start), nl,
         name(Gene,GeneL), print(Gene), nl,
         name(Stop,StopL), print(Stop), nl.

demo2 :- DNA = "atgggggggtag",
         % get_3_pieces
         eval_pieces(StartL,GeneL,StopL,DNA,[]),
         gene_len_3x(GeneL),
         name(Start,StartL), print(Start), nl,
         name(Gene,GeneL), print(Gene), nl,
         name(Stop,StopL), print(Stop), nl.

eval_pieces(Start,Gene,Stop) --> start_codon(Start), gene(Gene), stop_codon(Stop).

start_codon("atg") --> ["atg"].
start_codon("atg") --> ["ctg"].

stop_codon("tag") --> ["tag"].

gene(G) --> [G].

gene_len_3x(G) :- length(G,Len), M is Len mod 3, M == 0.
