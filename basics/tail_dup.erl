%% duplicate using tail recursion

-module(tail_dup).
-compile(export_all).

dup(N,Term) -> dup(N,Term,[]).

dup(0,_,List) -> List;
dup(N,Term,List) when N>0 -> dup(N-1,Term,[Term|List]).
