-module(tree).
%%-export([eval/2, op/1, is_op/1]).
-compile(export_all).

op1("+") -> fun(L,R) -> L+R end;
op1("*") -> fun(L,R) -> L*R end;
op1("-") -> fun(L,R) -> L-R end;
op1("/") -> fun(L,R) -> L/R end.

is_op(X) -> X == "(" orelse X == ")" orelse X == "+" orelse X == "-" orelse  X == "*" orelse  X == "/".

eval([], Stack) -> Stack;
eval([Num|Rest], Stack) when is_integer(Num) ->
  eval(Rest, [Num|Stack]);
eval([Cur|Rest], Stack) ->
  case is_op(Cur) of
        true ->
          Rhs = hd(Stack),
      Lhs = hd(tl(Stack)),
      Res = apply(op1(Cur), [Lhs, Rhs]),
%%      print(Res),
      eval(Rest, [Res|tl(tl(Stack))])
  end.



%%  postfix to infix conversion , (only first operation works, but make it perfect)


op("+") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "+" ++ integer_to_list(R) ++ ")" end;
op("-") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "-" ++ integer_to_list(R) ++ ")" end;
op("*") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "*" ++ integer_to_list(R) ++ ")" end;
op("/") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "/" ++ integer_to_list(R) ++ ")" end;
op("(") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ "(" ++ integer_to_list(R) ++ ")" end;
op(")") -> fun(L,R) -> "(" ++ integer_to_list(L) ++ ")" ++ integer_to_list(R) ++ ")" end.
%%op("+") -> fun(L,R) -> "(" ++ L ++ "+" ++ R ++ ")" end;
%%op("-") -> fun(L,R) -> "(" ++ L ++ "-" ++ R ++ ")" end.

%%is_op(X) -> X == "(" orelse X == ")" orelse X == "+" orelse X == "-" orelse  X == "*" orelse  X == "/".
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





%% inserting to a tree....

insert(Key, Val, {node, 'nil'}) -> {node, {Key, Val,{node, 'nil'},{node, 'nil'}}};
insert(NwKey, NwVal,{node, {Key, Val, Smaller, Larger}}) when NwKey < Key ->
        {node, {Key, Val, insert(NwKey, NwVal, Smaller), Larger}};
insert(NwKey, NwVal, {node, {Key, Val, Smaller, Larger}}) when NwKey > Key ->
        {node, {Key, Val, Smaller, insert(NwKey, NwVal, Larger)}};
insert(Key, Val, {node, {Key, _, Smaller, Larger}}) ->
        {node, {Key, Val, Smaller, Larger}}.


%% infix to postfix....
%% find from stack overflow, read and understand that, and did myself.
%% expression tree 
parse(Str) ->
    {ok, Tokens, _} = erl_scan:string(Str ++ "."),
    {ok, [E]} = erl_parse:parse_exprs(Tokens),
    E.

rpn({op, _, What, LS, RS}) ->
    io_lib:format("~s ~s ~s", [rpn(LS), rpn(RS), atom_to_list(What)]);
rpn({integer, _, N}) ->
    io_lib:format("~b", [N]).

p(Str) ->
    Tree = parse(Str),
    lists:flatten(rpn(Tree)).






















