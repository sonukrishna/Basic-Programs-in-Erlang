-module(records).
-compile(export_all).
-record(user, {id, name, group, age}).
-record(robot, {name,
			type = industrial,
			hobbies,
			details = []}).
first_robot() ->
     #robot{name = "Sonu",
		type = human,
		details = ["the perfect fucker!!!"]}.
%%    Name1#robot.details.

admin_panel(#user{name=Name, group=admin}) ->
    Name ++ "is allowed";
admin_panel(#user{name=Name}) ->
    Name ++ "not allowed".

adult_section(U=#user{}) when U#user.age =:= 18 ->
    allowed;
adult_section(_) ->
    forbidden.

%%update only what we needed....
repairman(Rob) ->
    Details = Rob#robot.details,
    New = Rob#robot{details = ["repaired by man"|Details]},
    {repaired, New}.
