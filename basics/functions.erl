-module(functions).
-compile(export_all).  %%replaces with -export().
head([H|_]) -> H.
same(X,X) -> 
	true;
same(_,_) ->
	false.
valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
	io:format("the date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
	io:format("the time tuple(~p) indicates ~p:~p:~p,~n",[Time,H,Min,S]);
valid_time(_) ->
	io:format("Stop feeding me wrong data!~n").
