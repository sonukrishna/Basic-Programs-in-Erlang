-module(rpl).
%%-export([eval/1]).
-compile(export_all). 
parse(Expression) ->
    parse(string:tokens(Expression," ")).
 
%%parse([],Expression) ->
%%    lists:reverse(Expression).
%%parse(["+"|Xs],Expression) ->
%%    parse(Xs,[fun erlang:'+'/2|Expression]);
%%parse(["-"|Xs],Expression) ->
%%    parse(Xs,[fun erlang:'-'/2|Expression]);
%%parse(["*"|Xs],Expression) ->
%%    parse(Xs,[fun erlang:'*'/2|Expression]);
%%parse(["/"|Xs],Expression) ->
%%    parse(Xs,[fun erlang:'/'/2|Expression]);
%%parse(["^"|Xs],Expression) ->
%%    parse(Xs,[fun math:pow/2|Expression]);
%%parse([X|Xs],Expression) ->
%%    {N,_} = string:to_integer(X),
%%    parse(Xs,[N|Expression]).
