%% create a tree in erlang

-module(tree).
-compile(export_all).

empty() -> {node, 'nil'}.

insert(Key, Val, {node, 'nil'}) -> {node, {Key, Val,{node, 'nil'},{node, 'nil'}}};
insert(NwKey, NwVal,{node, {Key, Val, Smaller, Larger}}) when NwKey < Key ->
	{node, {Key, Val, insert(NwKey, NwVal, Smaller), Larger}};
insert(NwKey, NwVal, {node, {Key, Val, Smaller, Larger}}) when NwKey > Key ->
	{node, {Key, Val, Smaller, insert(NwKey, NwVal, Larger)}};
insert(Key, Val, {node, {Key, _, Smaller, Larger}}) ->
	{node, {Key, Val, Smaller, Larger}}.


lookup(_, {node, 'nil'}) -> 
	undefined;
lookup(Key, {node, {Key, Val, _, _}}) ->
	{ok, Val};

lookup(Key, {node, {NodeKey, _, Smaller, _}}) when NodeKey > Key ->
	lookup(Key,Smaller);
lookup(Key, {node, {_, _, _, Larger}}) ->
	lookup(Key, Larger).


