-module(event_server).
-compile(export_all).

-include("event_server.hrl").

init() ->
    loop(#state{
	events = orddict:new(),
	clients = orddicts:new()}).
