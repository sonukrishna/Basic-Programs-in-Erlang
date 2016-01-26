%% fold function

-module(fold).
-compile(export_all).

fold(_,Start,[]) -> Start;
fold(F,Start,[H|T]) -> fold(F,F(H,Start),T).
