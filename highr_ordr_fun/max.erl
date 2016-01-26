%% find maximum of alist

-module(max).
-compile(export_all).

max([H|T]) -> max2(T,H).

max2([],Max) -> Max;
max2([H|T],Max) when H > Max ->
    max2(T,H);
max2([_|T],Max) -> max2(T,Max).
