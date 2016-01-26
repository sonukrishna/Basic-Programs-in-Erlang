-module(fact_tail).
-compile(export_all).

fac(N) -> fac(N,1).
fac(0,Acc) -> Acc;
fac(N,Acc) when N > 0 -> fac(N-1, Acc*N).
