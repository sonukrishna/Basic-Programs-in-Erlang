%% reverse of a list using tail recursion

-module(rev_tail).
-compile(export_all).

rev(L) -> rev(L, []).
rev([], Acc) -> Acc;
rev([H|T], Acc) -> rev(T, [H|Acc]).
