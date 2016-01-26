%% the filter function

-module(filter).
-compile(export_all).

filter(F,L) -> lists:reverse(filter(F,L,[])).

filter(_,[],Acc) -> Acc;
filter(F,[H|T],Acc) ->
    case F(H) of
	true -> filter(F,T,[H|Acc]);
	false -> filter(F,T,Acc)
    end.
