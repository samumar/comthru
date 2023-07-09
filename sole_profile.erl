-module(sole_profile).
-export([out/1]).

out(_Arg) ->
{ehtml, {'div', [{class, "white_dot"}, {style, "height: 100px; width: 100px;"}], {center, [], {img, [{src, "/Uploads/Uploadsprofile.png"}, {align, "center"}, {style, "height: 100px; width: 100px; border-radius: 50%;"}]}}}}.
