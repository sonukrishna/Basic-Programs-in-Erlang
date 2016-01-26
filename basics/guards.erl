-module(guards).
-compile(export_all).

right_age(X) when X >= 20, X =< 100 ->
	true;
right_age(_) ->
	false.

wrong_age(X) when X < 16; X > 100 ->
	true;
wrong_age(_) ->
	false.

old_enough(X) when X > 16 ->
	true;
old_enough(_) ->
	false.
%% if statement
oh_god(N) ->
	if N =:= 2 -> might_succeed;
		true -> always_succeed
	end.

%% case statement
%%insert to a list

insert(X,[]) ->
	[X];
insert(X,Set) ->
	case lists:member(X,Set) of
		true -> Set;
		false -> [X|Set]
	end.

%% temparature

beach(Tmp)->
	case Tmp of
		{celcius, N} when N >= 20, N =< 45 ->
			'favourable';
		{kelvin, N} when N >= 293; n =< 318 ->
			'notheavy';
		_ ->
			'avoid beach'
	end.
