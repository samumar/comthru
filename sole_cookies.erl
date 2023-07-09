-module(sole_cookies).
-export([check_cookie/2]).
-export([arg_rewrite/1]).
-include("yaws.hrl").
-include("yaws_api.hrl").
-include("yaws_debug.hrl").

get_cookie_val(CookieName, Arg) ->
 H = Arg#arg.headers,
 yaws_api:find_cookie_val(CookieName, H#headers.cookie).


check_cookie(A, CookieName) ->
 case get_cookie_val(CookieName, A) of
  []  ->
      {error, "not logged in"};
  Cookie ->
      yaws_api:cookieval_to_opaque(Cookie)
 end.

arg_rewrite(Arg) ->
    OurCookieName = sole_api:phone_number(),
    case check_cookie(Arg, OurCookieName) of
        {error, _} ->
            do_rewrite(Arg);
        {ok, _Session} ->
            %return Arg untouched
            Arg
end.

%% these pages must be shippable without a good cookie
login_pages() ->
    ["/sign_up.yaws", "/dataStore/sole_data.yaws", "/emoji.yaws", "/authentication.yaws", "/log-in.yaws", "/index.yaws",
    "/voice/account_information.m4a", "/voice/click_and_read.m4a", "/voice/click_to_right.m4a", "/voice/help.m4a",
    "/voice/make_sure.m4a", "/voice/mind.m4a", "/voice/welcome.m4a", "/angry_photo.yaws", "/angry_upload.yaws",
    "/account_gen.yaws", "/poker_upload.yaws", "/regular_photo.yaws", "/happy_photo.yaws", "/happy_upload.yaws",
    "/error_login.yaws"].

do_rewrite(Arg) ->
    Req = Arg#arg.req,
    {abs_path, Path} = Req#http_request.path,
    case lists:member(Path, login_pages()) of
        true ->
            Arg;
        false ->
            Arg#arg{req = Req#http_request{path = {abs_path, "/log-in.yaws"}},
                    state = Path}
end.
