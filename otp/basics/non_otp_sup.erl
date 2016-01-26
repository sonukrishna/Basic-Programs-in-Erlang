% a supervisor for our non_otp
%supervisor is a process which monitors our server 
%and restarts it when it detects that it died

-module(non_otp_sup).
-compile(export_all).

start_server() ->
    spawn(?MODULE, supervise, []).

supervise() ->
    process_flag(trap_exit, true),

    Pid = non_otp:start(),
    link(Pid),
    receive
	{"EXIT", Pid, Reason} ->
	    case Reason of
		normal -> ok;
		_Other -> start_server()
	    end
    end.
