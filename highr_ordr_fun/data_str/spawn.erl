-module(spawn).
-compile(export_all).

spawn1() ->
    receive
	do_a_flip -> io:format("how about a flip~n");
	fish -> io:format("so long and thanks for all the fish! ~n");
	_ -> io:format("heh, we are smarter than you humans")
    end.

spawn2() ->
    receive
        {From, do_a_flip} ->
	    From! "how about a fish ~n";
        {From, fish} ->
	    From ! "So long and thanks for the fish ~n";
        {From, _} ->
	    From ! "Heh, we are smarter than you"
    end.

spawn3() ->
    receive
	{From, do_a_flip} ->
	    From ! "how about a fish ",
	    spawn3();
	{From, fish} ->
	    From ! " So long and thanks for the fish";
%%	    spawn3();
	_  ->
	    io:format( "Heh, we are smarter than you ~n" ),
	    spawn3()
    end.

