%%%----------------------------------------------------------------------
%%% File    : sole_app.erl
%%% Author  : Mykal
%%% Purpose : New social media platform.
%%% Created : 19 Jul 2023 by Mykal
%%%----------------------------------------------------------------------

-module(sole_app).
-author('Mykal').


-behaviour(application).
-export([start/2,stop/1]).

%% start

start(_Type, _StartArgs) ->
  sole_file_generator:launch().

%% stop

stop(_State) ->
  ok.
