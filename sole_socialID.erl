-module(sole_socialID).
-export([display/0]).
-export([out/1]).
-define(DISPLAY, display()).

display() ->
  Username = sole_api:username(),
  if Username =< []  ->
       "profile";
  true ->
       Username
  end.

out(_Arg) ->
{ehtml, {p, [{class, "paragraph"}, {style, "color: #101010;"}], ?DISPLAY}}.
