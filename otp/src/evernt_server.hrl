-record(state, {
	events,
	clients}).

-record(event, {
	name = "",
	description = "",
	pid,
	time0ut = {{1970,1,1},{0,0,0}}}).



