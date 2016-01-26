%% first N elements of a list L using tail recursion

-module(tail_sub).
-compile(export_all).

sub(L,N) -> lists:reverse(sub(L,N,[])).

sub(_,0,SubLst) -> SubLst;
sub([],_,SubLst) -> SubLst;
sub([H|T],N,SubLst) when N>0 -> sub(T,N-1,[H|SubLst]).
