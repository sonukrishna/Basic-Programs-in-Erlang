%% first N elements of a list L

-module(sublst).
-compile(export_all).

sub(_,0) -> [];
sub([],_) -> [];
sub([H|T],N) when N>0 -> [H|sub(T,N-1)].
