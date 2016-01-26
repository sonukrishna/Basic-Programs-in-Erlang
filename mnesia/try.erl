-module().
-compile(export_all).
-include_lib("stdlib/include/qlc.hrl"). 
 
-record(painting, {index, artist, title}).
  
init() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(painting,
        [ {disc_copies, [node()] },
             {attributes,      
                record_info(fields,painting)} ]).
 
insert( Index, Artist, Title) ->
    Fun = fun() ->
         mnesia:write(
         #painting{ index=Index,
                   artist=Artist, 
                        title=Title    } )
               end,
         mnesia:transaction(Fun).
  
select( Index) ->
    Fun = 
        fun() ->
            mnesia:read({painting, Index})
        end,
    {atomic, [Row]}=mnesia:transaction(Fun),
    io:format(" ~p ~p ~n ", [Row#painting.artist, Row#painting.title] ).

