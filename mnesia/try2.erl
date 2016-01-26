%% mnesia basics....

-module(try2).
-compile(export_all).
-include_lib("stdlib/include/qlc.hrl").

%%-record(painting, {index, artist, title}).
-record(my_meeting, {event,
		  location,
                  description,
                  day,
		  month,
                  attendies}).


-record(my_date, {event,
		location,
		day,
                month}).
init() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(my_meeting,
        [ {disc_copies, [node()] },
           {type, bag},
	    {record_name, log},
             {attributes,
                record_info(fields,my_meeting)} ]),
    mnesia:create_table(my_date,
		[ {disc_copies, [node()]},
		{type, bag},
		{record_name, log},
		{attributes, record_info(fields, my_date)}]).

%insert_date(Day, Month) ->
%    Fun = fun() ->
%	mnesia:write(
%		#date{ day = Day,
%			month = Month}).

insert(Event, Loc, Des, Day, Month, Present ) ->
    Fun = fun() ->
         mnesia:write(
         #my_meeting{ event = Event,
		   location=Loc,
                   description=Des,
                        day = Day,
			month = Month,
                        attendies=Present  } )
               end,
         mnesia:transaction(Fun).

insert_by_date(Event, Loc, Day, Month) ->
    Fun = fun() ->
	case mnesia:read({my_meeting, Day}) =:= [] orelse
	     mnesia:read({my_meeting, Month}) =:= [] of
		true -> {error, no_event};
		false ->
		    mnesia:write(
			#my_date{event = Event,
				location = Loc,
				day = Day,
				month = Month})
		end
	end,
   mnesia:transaction(Fun).
		
