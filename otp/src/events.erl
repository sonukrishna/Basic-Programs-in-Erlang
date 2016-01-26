-module(events).
-compile(export_all).

-include("events.hrl").

start(Ename, Delay) ->
    spawn(?MODULE, init, [self(), Ename, Delay]).

start_link(Ename, Delay) ->
    spawn_link(?MODULE, init, [self(), Ename, Delay]).

cancel(Pid) ->
    Ref = erlang:monitor(process, Pid),
    Pid ! {self(), Ref, cancel},
    receive
        {Ref, ok} ->
                erlang:demonitor(Ref, [flush]),
                ok;
        {"DOWN", Ref, process, Pid, _Reason} ->
                ok
    end.


init(Server, Ename, Delay) ->
    loop(#state{server = Server,
		name = Ename,
		to_go = normalize(Delay)}).

loop(S = #state{server=Server, to_go= [T|Next]}) ->
    receive
	{Server, Ref, cancel} ->
	    Server ! {Ref, ok}
    after T* 1000 ->
	if Next =:= [] ->
	    Server ! {done, S#state.name} ;
	  Next =/= [] ->
	    loop(S#state{to_go = Next})
        end
    end.

normalize(N) ->
    Limit = 49*24*60*60,
    [N rem Limit | lists:duplicate(N div Limit, Limit)].

%cancel(Pid) ->
%    Ref = erlang:monitor(process, Pid),
%    Pid ! {self(), Ref, cancel},
%    receive
%	{ok, Ref} ->
%		erlang:demonitor(Ref, [flush]),
%		ok;
%        {"DOWN", Ref, process, Pid, _Reason} ->
%		ok 
%    end.

%time_to_go(T = {{_,_,_},{_,_,_}}) ->
%    Now = calendar:local_time(),
%    Togo = calenar:datetime_to_gregorian_seconds(T) -
%	   calendar:datetime_to_gregorian_seconds(Now),
%    Secs = if Togo > 0 -> Togo;
%              Togo =< 0 -> 0
%           end,
%    normalize(Secs).

