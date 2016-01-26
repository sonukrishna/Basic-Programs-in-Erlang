%% reverse of a list

-module(rev).
-compile(export_all).

rev([]) -> [];
rev([H|T]) -> rev(T)++[H].
