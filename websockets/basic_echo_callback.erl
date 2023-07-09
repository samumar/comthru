-module(basic_echo_callback).

%% Export for websocket callbacks
-export([handle_message/1, say_hi/1]).

handle_message({binary, Message}) ->
    io:format("~p:~p basic_echo_callback got ~p~n",
          [?MODULE, ?LINE, Message]),
    {reply, {binary, <<Message/binary>>}}.

say_hi(Pid) ->
    io:format("asynchronous greeting~n", []),
    yaws_api:websocket_send(Pid, {text, <<"say hi">>}).
