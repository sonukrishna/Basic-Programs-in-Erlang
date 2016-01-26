%% add duplicate

-module(duplicate).
-compile(export_all).

dup(0,_) -> [];
dup(N,Term) when N > 0 -> [Term|dup(N-1,Term)].
