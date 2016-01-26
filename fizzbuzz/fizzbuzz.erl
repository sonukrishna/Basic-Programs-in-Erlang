%% It is a simple example used by many programming langauges.
%% Iterate over a list range of numbers, Then if the mod by 3 is 0--> returns a "fizz".
%% mod by 5 is 0, then returns a "bizz", if both are 0, then "fizzbuzz".

-module(fizzbuzz).

-compile(export_all).

t() ->
    fizzbuzz(lists:seq(1,100)). %% range of 100

fizzbuzz([H|Tail]) ->
    case {H rem 3, H rem 5 } of
	{0, _} -> io:format("fizz ~n");
	{_, 0} -> io:format("buzz ~n");
	{0, 0} -> io:format("fizzbuzz ~n");
	{_, _} -> io:format("~p ~n", [H])
    end,
    fizzbuzz(Tail).
