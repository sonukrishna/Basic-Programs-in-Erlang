%% length of a list by tail recursion

-module(len_tail).
-compile(export_all).

len(L) -> len(L,0).
len([],Acc) -> Acc;
len([_|T],Acc) -> len(T,Acc+1). 
