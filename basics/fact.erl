-module(fact).
-compile(export_all).

fac(N) when N =:= 0 -> 1;
fac(N) when N > 0 -> N * fac(N-1).
