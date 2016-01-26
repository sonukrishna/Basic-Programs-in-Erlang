%% learn what is spawn

-module(spawn1).
-compile(export_all).

ping(0, Pong_PID) ->
    Pong_PID ! finished,
    io:format("ping finished~n", []);
ping(N, Pong_PID) ->
    Pong_PID ! {ping, self()},
    recieve
	pong ->
	    io:format("Ping recieved pong~n", [])
    end,
    ping(N-1, Pong_PID).

