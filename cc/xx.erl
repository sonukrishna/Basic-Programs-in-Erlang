-module(xx).
-export([insert/3, read1/1, read2/1, delete/1]).
insert(Name, Desc, Date) ->
    a:insert(Name, Desc, Date).

read1(Name) ->
    a:read_desc(Name).

read2(Date) ->
    a:read_all(Date).

delete(Date) ->
    a:delete(Date).

