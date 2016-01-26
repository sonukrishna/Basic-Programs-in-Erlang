%% creating basic database ideas using mnesia

-module(try1).
-compile(export_all).
-include_lib("stdlib/include/qlc.hrl"). 
 
%%-record(painting, {index, artist, title}).
-record(meeting, {location,
                  description,
                  day,
		  month,
                  attendies}).
  

init() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(meeting,
        [ {disc_copies, [node()] },
	   {type, bag},
             {attributes,      
                record_info(fields,meeting)} ]).
 
insert(Loc, Des, Day, Month, Present ) ->
    Fun = fun() ->
         mnesia:write(
         #meeting{ location=Loc,
                   description=Des, 
                        day=Day,
			month=Month,
			attendies=Present  } )
               end,
         mnesia:transaction(Fun).
  
select(Loc) ->
    Fun = 
        fun() ->
            mnesia:match_object({meeting, Loc, '_', '_', '_'})
        end,
    {atomic, Result}=mnesia:transaction(Fun),
    Result.
%%    io:format(" ~p ~p  ~p ~n ", [Row#meeting.description, Row#meeting.time, Row#meeting.attendies] ).

select_all() -> 
    mnesia:transaction( 
    fun() ->
        qlc:eval( qlc:q(
            [ X || X <- mnesia:table(meeting) ] 
        )) 
    end ).
  
