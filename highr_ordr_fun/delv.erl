-module(delv).
-compile(export_all).

-record(recipe, {name, instructions = [], ingrediants = []}).

%#recipe{name = soup, instructions = ["order by phone"], ingrediants = [suace, tomatoes, meat, dough]}.
%#recipe{name = pizza, instructions = ["who knows"], ingrediants = ["all are good"]}.
-record(friends, {name,
		  contact = [],
		  info = [],
		  expertize}).
-record(services, {from,
		   to,
		   date,
		   description}).

