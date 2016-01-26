-module(xx).
%%-compile(export_all).
-export([op/1,eval1/2,is_op/1]).
is_op(X) -> X == "(" orelse X == ")" orelse X == "+" orelse X == "-" orelse  X == "*" orelse  X == "/".

op(X) -> fun(A,B) -> [X|[A|[B]]] end.
%%op("*") -> fun(A,B) -> A*B end.

eval1([], Stack) -> lists:reverse(Stack);
eval1([H|T], Stack) when is_integer(H) ->
    eval1(T, [H|Stack]);
eval1([Op|T], Stack) ->
    case is_op(Op) of
        true ->
            Rhs = hd(Stack),
        Lhs = hd(tl(Stack)),
%%        Res = {Rhs, Lhs},
        Res = apply(op(Op),[Lhs,Rhs]),
        eval1(T, [hd(tl(Stack))|tl(tl(Stack))])
    end.

