%% find only even numbers

-module(even).
-compile(export_all).

even(L) -> lists:reverse(even(L,[])).

even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
    even(T,[H|Acc]);
even([_|T], Acc) -> even(T,Acc).
