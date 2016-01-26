% A simple server to return hello world

-module(non_otp).
-compile(export_all).

-define(SERVER, ?MODULE).
	
-record(state, {count}).

% functions that our clients use to interact with the server

start() ->
    spawn(?MODULE, init, []).

stop() ->
    ?SERVER ! stop,
    ok.

say_hello() ->
    ?SERVER ! say_hello,
    ok.
get_count() ->
    ?SERVER ! {self(), get_count},
    receive
	{count, Value} -> Value
    end.

% the callback functions

init() ->
    register(?SERVER, self()),
    loop(#state{count = 0}).

%internal functions

loop(#state{count = Count}) ->
    receive Msg ->
	case Msg of
	    stop ->
		exit(normal);
	    say_hello ->
		io:format("Hell0 ~n");
	    {From, get_count} ->
		From ! {count, Count}
	end
    end,
    loop(#state{count = Count + 1}).
