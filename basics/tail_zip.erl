%% zip function using tail recursion

-module(tail_zip).
-compile(export_all).

zip(L1,L2) -> lists:reverse(zip(L1,L2,[])).

zip(_,[],New) -> New;
zip([],_,New) -> New;
zip([H1|T1],[H2|T2],New) -> zip(T1,T2,[{H1,H2}|New]).
