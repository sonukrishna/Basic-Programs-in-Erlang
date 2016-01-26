%% adding bdays, date and meeting to the mnesia databse

-module(exp).
-compile(export_all).

%%-include_lib("stdlib/include/qlc.erl").

-record(date, {day, month}).
-record(meeting, {locn, day, month, time, attendies}).
-record(birthday, {name, day, month, gifts}).
%%-record(at_dep, {emp,
%%dept_id}).
%%-record(in_proj, {emp,
%%proj_name})

init() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(date, [{type, bag},
                                  {attributes, record_info(fields, date)}]),
    mnesia:create_table(meeting, [{type, bag},
                                  {attributes, record_info(fields, meeting)}]),
    mnesia:create_table(birthday, [{type, bag},
                                   {attributes, record_info(fields, birthday)}]).

insert(Date, Loc, Part, Name) ->
    {Day, Month} = Date#date.day, Date#date.month,
    Fun = fun() ->
	mnesia:write(Date),
        Meet = #meeting{locn = Loc, day = Day, month = Month, attendies = Part},
        mnesia:write(Meet),
        bdays(Name, Day, Month)
    end,
    mnesia:transaction(Fun).

bdays(Name, [Day|Rem], [Month|Tail]) ->
     mnesia:write(#birthday{name = Name, day = Day, month = Month}),
     bdays(Name, Tail, Rem);
bdays(_, [], []) -> ok.

