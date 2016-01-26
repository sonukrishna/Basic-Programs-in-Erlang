%% basics of closure
-module(closure).
-compile(export_all).
base(A,C=5) ->
    B = A + C,
    F = fun() -> A * B end,
    F().

a() ->
    Secret = "pony",
    fun() -> Secret end.

b(F) ->
    "a/0 password is"++F().


