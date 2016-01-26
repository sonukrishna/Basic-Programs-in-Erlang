%% a quick sort in erlang

-module(quick).
-compile(export_all).

partition(_,[],Smaller,Larger) -> {Smaller,Larger};
partition(P,[H|T],Smaller,Larger) ->
	if H =< P -> partition(P,T,[H|Smaller],Larger);
	   T > P -> partition(P,T,Smaller,[H|Larger])
	end.

quick_sort([]) -> [];
quick_sort([P|Rest]) -> 
	{Smaller, Larger} = partition(P,Rest,[],[]),
	quick_sort(Smaller) ++ [P] ++ quick_sort(Larger).
