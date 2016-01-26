-module(head).
-compile(export_all).

-include("head.hrl").
included() -> #included{some_field = "some value"}.
