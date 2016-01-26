-module(infix).
-compile(export_all).

op("+") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "+" ++ integer_to_list(R) ++ ")" end;
op("-") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "-" ++ integer_to_list(R) ++ ")" end;
op("*") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "*" ++ integer_to_list(R) ++ ")" end;
op("/") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "/" ++ integer_to_list(R) ++ ")" end;
op("(") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "(" ++ integer_to_list(R) ++ ")" end;
op(")") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ ")" ++ integer_to_list(R) ++ ")" end.
%%op("+") -> fun(L,R) -> "(" ++ L ++ "+" ++ R ++ ")" end;
%%op("-") -> fun(L,R) -> "(" ++ L ++ "-" ++ R ++ ")" end.

is_op(X) -> X == "(" orelse X == ")" orelse X == "+" orelse X == "-" orelse  X == "*" orelse  X == "/".
%%post_inf(Exp) -> post_inf(string:tokens(Exp, " "), []).
post_inf([], Stack) -> Stack;
post_inf([H|T], Stack) when is_integer(H)->
    post_inf(T, [H|Stack]);
post_inf([Op|T], Stack) ->
    case is_op(Op) of
	true ->
	    Rhs = hd(Stack),
	Lhs = hd(tl(Stack)),
        Res = apply(op(Op),[Lhs,Rhs]),

%%        Res = "(" ++ integer_to_list(Rhs) ++ Op ++ integer_to_list(Lhs) ++ ")",
	post_inf(T, [Res|tl(tl(Stack))])
    end.


