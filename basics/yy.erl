-module(yy).
-compile(export_all).

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
