%% min of a list

-module(min).
-compile(export_all).

min([H|T]) -> min2(T,H).

min2([],Min) -> Min;
min2([H|T], Min) when H < Min ->
    min2(T,H);
min2([_|T],Min) -> min2(T,Min).
