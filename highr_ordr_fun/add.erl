%% add two numbers, increment list and some higher order functions

-module(add).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

%%basic increment using recursion

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

%% nowuse some higher order functions

map(_, []) -> [];
map(F,[H|T]) -> [F(H)|map(F,T)].

incr(X) -> X+1.
decr(X) -> X-1.

%% using anonymous function
%% you can use it in the format fun(X) -> Exprsns end.

map(_, []) -> [];
map(F,[H|T]) -> [F(H)|map(F,T)].
