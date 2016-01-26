%% some basic stack and tree

-module(treee).
-compile(export_all).

postfix(L) when is_list(L) ->
    [Res] = lists:foldl(fun postfix/2, [], string:tokens(L, " ")),
    Res.

postfix("+", [N1,N2|S]) -> [N2+N1|S];
postfix("*", [N1,N2|S]) -> [N2*N1|S];
postfix(X, Stack) -> [read(X)| Stack].
read(N) ->
    case string:to_float(N) of
	{error, no_float} -> list_to_integer(N);
	{F, _} -> F
    end.
%% test with = sign, it acts like assertion.
post_test() ->
    87 = postfix("84 3 +"),
    24 = postfix("10 4 3 + 2 * +"),
    ok.
%% create an expression tree

empty() -> {node, 'nil'}.

insert(Key, Val, {node, 'nil'}) -> {node, {Key, Val,{node, 'nil'},{node, 'nil'}}};
%%insert(NwKey, NwVal,{node, {Key, Val, Smaller, Larger}}) when NwKey < Key ->
%%        {node, {Key, Val, insert(NwKey, NwVal, Smaller), Larger}};
%%insert(NwKey, NwVal, {node, {Key, Val, Smaller, Larger}}) when NwKey > Key ->
%%        {node, {Key, Val, Smaller, insert(NwKey, NwVal, Larger)}};
%%insert(Key, Val, {node, {Key, _, Smaller, Larger}}) ->
%%        {node, {Key, Val, Smaller, Larger}}.
%%empty() -> {node, 'nil'}.

is_op(X) -> X == " ( " orelse X == " ) " orelse X == " + " orelse X == " - " orelse  X == " * " orelse  X == " / ". 

op(X) -> fun(A,B) -> A+B end;
%%op("*") -> fun(A,B) -> A*B end.

eval1([], Stack) -> Stack;
eval1([H|T], Stack) when is_integer(H) ->
    eval1(T, [H|Stack]);
eval1([Op|T], Stack) ->
    case is_op(Op) of
	true ->
	    Rhs = hd(Stack),
	Lhs = hd(tl(Stack)),
	Res = {Rhs, Lhs},
%%	Res = apply(op(Op),[Lhs,Rhs]),
	eval1(T, [Res|tl(tl(Stack))])
    end.
    
