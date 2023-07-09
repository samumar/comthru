-module(sole_api).

-export([disc_copies_DB/0]).
-export([disc_copies_DB_setup/7]).
-export([tok/0]).
-export([redirect_emoji/1]).
-record(user_database, {node}).
-record(user_data, {first_name, last_name, email, date_of_birth, phone_num, gender, passwd}).
-record(token, {name, hashed_token}).
-record(posted_time, {file, time_posted}).
-export([local_ip_v4/0]).
-export([hash_256/1]).
-export([hash_256_A/1]).
-export([first_name/0]).
-export([last_name/0]).
-export([email/0]).
-export([date_of_birth/0]).
-export([phone_number/0]).
-export([gender/0]).
-export([password/0]).
-export([delete_account/0]).
-include_lib("stdlib/include/qlc.hrl").
-include_lib("kernel/include/file.hrl").
-include_lib("xmerl/include/xmerl.hrl").

-export([determined_avatar/0]).
-export([unique_port/0]).
-export([unique_port/1]).
-export([start_connection/1]).
-export([received/0]).
-export([did_not_received/0]).

%% xmpp directories, and ids.
-export([xmpp_directory/0]).
-export([xmpp1_directory/0]).
-export([xmpp2_directory/0]).
-export([generate_user_jabber_id/0]).
-export([xmpp1_ID/0, xmpp2_ID/0]).
%% xmpp protocols.
-export([start_tcp_server/0]).
-export([query/1]).
-export([connect_to_ip/1]).
-export([connect/1]).
-export([contact_lookup/1]).
-export([mobile_cell/1]).
-export([clients_number/0]).
-export([dynamic_message/1]).
-export([create_shared_file1/1]).
-export([create_shared_file2/1]).
-export([create_shared_file3/2]).
-export([all_xmpp_files/0]).
-export([listen_for_binary/1]).

-export([male_avatar/0]).
-export([female_avatar/0]).
-export([other_avatar/0]).

-export([uppercase_to_lowercase/1]).
-export([get_emoji/1]).

%% Generate files for voip service
-export([create_delete_repeat/1]).
-export([generate_user_number_file/1]).
-export([generate_voice_files/1]).

-export([store_image1/0, store_image2/0, store_image3/0, store_audio/0]).

-export([person_css/0]).
-export([copy_file/0]).
-export([copy_emojis/0]).
-export([duplicate_file/0]).
-export([duplicate_images/0]).
-export([stream_data/1]).
-export([stream_live/1]).
-export([validate_num/1]).
-export([divide/2]).
-export([string_to_int/2]).
-export([validate_card/1]).
-export([tokenization/1]).
-export([reference_token/0]).
-export([reference_token/1]).
-export([get_token/1]).
-export([delete_token/0]).
-export([check_to_see_if_token_exists/0]).
-export([check_to_see_if_token_exists/1]).
-export([from_hash_to_value/1]).
-export([post_time/1]).
-export([what_time_posted/1]).
-export([was_time_posted/1]).
-export([tell_time/0]).
-export([tell_time_html/0]).
-export([usd_exchange/1]).
-export([multimedia_dir/0]).
-export([store_media/0]).
-export([store_media_image/1]).
-export([username/1, username/0]).
-export([caption/1, caption/0]).
%% Deleting early Image files!!!
-export([caption_post/1]).
-export([caption_post/0]).
-export([deleting_files/0]).
-export([moving_profile_photo/0]).
-export([change_file_name/1]).
-export([change_file_name2/1]).
-export([change_file_name3/1]).
-export([check_file/1]).
-export([video/0]).
-export([rename_video_file/0]).
-export([rename_image_file/0]).
-export([process_stream/0]).
-export([delete_stream/0]).
-export([files/1]).
-export([send_file_type/1]).
-export([read_file_type/0]).
-export([check_file/0]).
-export([static_file/1]).
-export([store_Bitcoin_password/1]).
-export([bitcoin_network_directory/0]).
-export([recording_jabber_ids/0]).
-export([available/0]).
-export([non_available/0]).
-export([know_presence/0]).
-export([message_self/1]).
-export([message_others/1]).
-export([newsfeed_log_image/0]).
-export([newsfeed_log_video/0]).
-export([show_image/1]).
-export([show_video/1]).
-export([likes_page/0]).
-export([likes/1]).
-export([how_many_likes/0]).
-export([likes_for_each_post/0]).
-export([likes_for_post/1]).
-export([like_count_for_post/0]).
-export([verify_page/0]).
-export([verify_like/1]).
-export([read_number_of_visits/0]).

%% videos
-export([count_number_of_posts/0]).
-export([number_of_posts/1]).
-export([how_many_posts/0]).
-export([extract_number_of_posts/0]).

%% photos
-export([count_number_of_posts2/0]).
-export([number_of_posts2/1]).
-export([how_many_posts2/0]).
-export([extract_number_of_posts2/0]).

%% functions for video post feeds.

-export([records_of_videos_on_a_file/0]).
-export([hash_post/1]).
-export([display_hash_post/0]).
-export([delete_previous_file/0]).
-export([if_this_file_exist_delete/0]).
-export([check_for_posted_files/0]).
-export([show_hashed_file/0]).
-export([new_post_old_post/0]).
-export([if_upload/0]).
-export([first_post/0]).
-export([lets_see_if_first_post_exist/0]).
-export([image/0]).
-export([uploads_file/0]).

-export([read_all_videos_file/0]).

%% functions for photo post feeds.

-export([records_of_photos_on_a_file/0]).
-export([hash_post2/1]).
-export([display_hash_post2/0]).
-export([delete_previous_file2/0]).
-export([if_this_file_exist_delete2/0]).
-export([check_for_posted_files2/0]).
-export([show_hashed_file2/0]).
-export([new_post_old_post2/0]).
-export([if_upload2/0]).
-export([first_post2/0]).
-export([lets_see_if_first_post_exist2/0]).
-export([video_media/0]).
-export([uploads_file2/0]).

%% For no posts
-export([no_media/0]).
-export([file_must_exists/0]).

                    disc_copies_DB() ->
                      dataStore(),
                      mnesia:create_schema([node()]),
                      mnesia:start(),
                      try
                        mnesia:table_info(type, user)
                      catch
                        exit: _ ->
                           mnesia:create_table(user_database, [{attributes, record_info(fields, user_database)},
                           {type, bag},
                           {disc_copies, [node()]}]),
                           mnesia:write(
                           #user_database{node = []})
                      end.
dataStore() ->
file:make_dir("dataStore"),
file:write_file("dataStore/sole_data.yaws", ["<?xml version='1.0' encoding='utf-8'?>
<dataStore>
<erl>
  out(A) ->
  L = yaws_api:parse_post(A),
  {ehtml, f('~p', [L])},
  sole_api:redirect_emoji(A).
</erl>
<erl>
-record(session, {user, passwd, udata}).
  out(A) ->
  L = yaws_api:parse_post(A),
  B = {html, f('~p', [lists:nth(1, L)])},
  B1 = element(2, B),
  B2 = lists:append(B1),
  B3 = lists:nth(2, B2),
  B4 = lists:nth(3, B3),
  B5 = string:sub_string(B4, 2, $0),
  B6 = lists:last(string:tokens(B5, sole_api:tok())),
  C = {html, f('~p', [lists:nth(2, L)])},
  C1 = element(2, C),
  C2 = lists:append(C1),
  C3 = lists:nth(2, C2),
  C4 = lists:nth(3, C3),
  C5 = string:sub_string(C4, 2, $0),
  C6 = lists:last(string:tokens(C5, sole_api:tok())),
  D = {html, f('~p', [lists:nth(3, L)])},
  D1 = element(2, D),
  D2 = lists:append(D1),
  D3 = lists:nth(2, D2),
  D4 = lists:nth(3, D3),
  D5 = string:sub_string(D4, 2, $0),
  D6 = lists:last(string:tokens(D5, sole_api:tok())),
  E = {html, f('~p', [lists:nth(4, L)])},
  E1 = element(2, E),
  E2 = lists:append(E1),
  E3 = lists:nth(2, E2),
  E4 = lists:nth(3, E3),
  E5 = string:sub_string(E4, 2, 11),
  F = {html, f('~p', [lists:nth(5, L)])},
  F1 = element(2, F),
  F2 = lists:append(F1),
  F3 = lists:nth(2, F2),
  F4 = lists:nth(3, F3),
  F5 = string:sub_string(F4, 2, 4),
  G = {html, f('~p', [lists:nth(6, L)])},
  G1 = element(2, G),
  G2 = lists:append(G1),
  G3 = lists:nth(2, G2),
  G4 = lists:nth(3, G3),
  G5 = string:sub_string(G4, 2, 4),
  H = {html, f('~p', [lists:nth(7, L)])},
  H1 = element(2, H),
  H2 = lists:append(H1),
  H3 = lists:nth(2, H2),
  H4 = lists:nth(3, H3),
  H5 = string:sub_string(H4, 2, 5),
  I = {html, f('~p', [lists:nth(8, L)])},
  I1 = element(2, I),
  I2 = lists:append(I1),
  I3 = lists:nth(2, I2),
  I4 = lists:nth(3, I3),
  I5 = string:sub_string(I4, 2, $0),
  I6 = lists:last(string:tokens(I5, sole_api:tok())),
  J = {html, f('~p', [lists:nth(9, L)])},
  J1 = element(2, J),
  J2 = lists:append(J1),
  J3 = lists:nth(2, J2),
  J4 = lists:nth(3, J3),
  J5 = string:sub_string(J4, 2, $0),
  J6 = lists:last(string:tokens(J5, sole_api:tok())),
  J7 = sole_api:hash_256_A(J6),
  J8 = lists:last(J7),
  sole_api:disc_copies_DB_setup(B6, C6, D6, E5, F5 ++ G5 ++ H5, I6, J8),
  S = #session{user = F5 ++ G5 ++ H5,
               passwd = J8,
               udata = []},
               %% Now register the session to the session server
               Cookie = yaws_api:new_cookie_session(S),
               [
                 yaws_api:set_cookie(F5 ++ G5 ++ H5,Cookie,[])].
</erl>
</dataStore>"]).




disc_copies_DB_setup(First_Name, Last_Name, Email, Date_of_birth, Phone_dial, Gender, Password) ->
mnesia:create_table(user_data, [{attributes, record_info(fields, user_data)}]),


User_Database = fun() ->
mnesia:write(
#user_data{first_name = First_Name, last_name = Last_Name, email = Email, date_of_birth = Date_of_birth, phone_num = Phone_dial, gender = Gender, passwd = Password})
end,

mnesia:transaction(User_Database).

tok() ->
 "\"".

redirect_emoji(_Arg) ->
[{redirect, "/happy_photo.yaws"}].

local_ip_v4() ->
    {ok, Addrs} = inet:getifaddrs(),
    hd([
         Addr || {_, Opts} <- Addrs, {addr, Addr} <- Opts,
         size(Addr) == 4, Addr =/= {127,0,0,1}
    ]).

hash_256(Data) ->
       <<X:256>> = crypto:hash(sha256, Data),
       io_lib:format("~64.16.0b", [X]).



hash_256_A(Data_A) ->
       <<X:256>> = crypto:hash(sha256, Data_A),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_A++ "abfh",
       hash_256_B(Y).
hash_256_B(Data_B) ->
       <<X:256>> = crypto:hash(sha256, Data_B),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_B++ "9077h",
       hash_256_C(Y).
hash_256_C(Data_C) ->
       <<X:256>> = crypto:hash(sha256, Data_C),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_C++ "quiop",
       hash_256_D(Y).
hash_256_D(Data_D) ->
       <<X:256>> = crypto:hash(sha256, Data_D),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_D++ "kkp33fg",
       hash_256_E(Y).
hash_256_E(Data_E) ->
       <<X:256>> = crypto:hash(sha256, Data_E),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_E++ "kophbc",
       hash_256_F(Y).
hash_256_F(Data_F) ->
       <<X:256>> = crypto:hash(sha256, Data_F),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_F++ "jdgf890",
       hash_256_G(Y).
hash_256_G(Data_G) ->
       <<X:256>> = crypto:hash(sha256, Data_G),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_G++ "qaczxnu",
       hash_256_H(Y).
hash_256_H(Data_H) ->
       <<X:256>> = crypto:hash(sha256, Data_H),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_H++ "kk12345",
       hash_256_I(Y).
hash_256_I(Data_I) ->
       <<X:256>> = crypto:hash(sha256, Data_I),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_I++ "1BabCDcd",
       hash_256_J(Y).
hash_256_J(Data_J) ->
       <<X:256>> = crypto:hash(sha256, Data_J),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_J++ "abcdefghijklmnopqrstuVwxyz",
       hash_256_K(Y).
hash_256_K(Data_K) ->
       <<X:256>> = crypto:hash(sha256, Data_K),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_K++ "people_always_hate",
       hash_256_L(Y).
hash_256_L(Data_L) ->
       <<X:256>> = crypto:hash(sha256, Data_L),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_L++ ",.?",
       hash_256_M(Y).
hash_256_M(Data_M) ->
       <<X:256>> = crypto:hash(sha256, Data_M),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_M++ "jjjjjjmmmmm",
       hash_256_N(Y).
hash_256_N(Data_N) ->
       <<X:256>> = crypto:hash(sha256, Data_N),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_N++ "PaperMoney",
       hash_256_O(Y).
hash_256_O(Data_O) ->
       <<X:256>> = crypto:hash(sha256, Data_O),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_O++ "TTTWWW",
       hash_256_P(Y).
hash_256_P(Data_P) ->
       <<X:256>> = crypto:hash(sha256, Data_P),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_P++ "KRS1",
       hash_256_Q(Y).
hash_256_Q(Data_Q) ->
       <<X:256>> = crypto:hash(sha256, Data_Q),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_Q++ "ZH1",
       hash_256_R(Y).
hash_256_R(Data_R) ->
       <<X:256>> = crypto:hash(sha256, Data_R),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_R++ "HOT 97",
       hash_256_S(Y).
hash_256_S(Data_S) ->
       <<X:256>> = crypto:hash(sha256, Data_S),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_S++ "Bad Bitch",
       hash_256_T(Y).
hash_256_T(Data_T) ->
       <<X:256>> = crypto:hash(sha256, Data_T),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_T++ "I love you back",
       hash_256_U(Y).
hash_256_U(Data_U) ->
       <<X:256>> = crypto:hash(sha256, Data_U),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_U++ "Its better to be safe then sorry",
       hash_256_V(Y).
hash_256_V(Data_V) ->
       <<X:256>> = crypto:hash(sha256, Data_V),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_V++ "Praise the most high",
       hash_256_W(Y).
hash_256_W(Data_W) ->
       <<X:256>> = crypto:hash(sha256, Data_W),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_W++ "Barack Obama",
       hash_256_X(Y).
hash_256_X(Data_X) ->
       <<X:256>> = crypto:hash(sha256, Data_X),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_X++ "Michelle Obama",
       hash_256_Y(Y).
hash_256_Y(Data_Y) ->
       <<X:256>> = crypto:hash(sha256, Data_Y),
       io_lib:format("~64.16.0b", [X]),
       Y = Data_Y++ "Ronald McDonald",
       hash_256_Z(Y).
hash_256_Z(Data_Z) ->
       <<X:256>> = crypto:hash(sha256, Data_Z),
       io_lib:format("~64.16.0b", [X]).

first_name() ->
  Tuple = mnesia:transaction( fun() -> mnesia:first(user_data) end),
  lists:last(string:tokens(element(2, Tuple), " ")).

last_name() ->
  Data = mnesia:transaction( fun() -> mnesia:read(user_data, sole_api:first_name()) end),
  Table = element(2, Data),
  New_tuple = lists:last(Table),
  element(3, New_tuple).

email() ->
  Data = mnesia:transaction( fun() -> mnesia:read(user_data, sole_api:first_name()) end),
  Table = element(2, Data),
  New_tuple = lists:last(Table),
  element(4, New_tuple).

phone_number() ->
  Data = mnesia:transaction( fun() -> mnesia:read(user_data, sole_api:first_name()) end),
  Table = element(2, Data),
  New_tuple = lists:last(Table),
  element(6, New_tuple).

date_of_birth() ->
  Data = mnesia:transaction( fun() -> mnesia:read(user_data, sole_api:first_name()) end),
  Table = element(2, Data),
  New_tuple = lists:last(Table),
  element(5, New_tuple).

gender() ->
  Data = mnesia:transaction( fun() -> mnesia:read(user_data, sole_api:first_name()) end),
  Table = element(2, Data),
  New_tuple = lists:last(Table),
  element(7, New_tuple).

password() ->
  Data = mnesia:transaction( fun() -> mnesia:read(user_data, sole_api:first_name()) end),
  Table = element(2, Data),
  New_tuple = lists:last(Table),
  element(8, New_tuple).

delete_account() ->
  mnesia:delete_table(user_data).

determined_avatar() ->
  Sex = sole_api:gender(),
  if Sex == "Male" -> sole_api:male_avatar();
     Sex == "Female" -> sole_api:female_avatar();
     Sex == "Other" -> sole_api:other_avatar()
  end.

unique_port() ->
  Phone = sole_api:phone_number(),
  Four_Digits = string:substr(Phone, 7, $0),
  list_to_integer(Four_Digits).

unique_port(Number) ->
  Four_Digits = string:substr(Number, 7, $0),
  list_to_integer(Four_Digits).

start_connection(Integer) ->
  Module = list_to_atom("sole_" ++ sole_api:phone_number()),
  {ok, Socket} = gen_tcp:connect(Module:ip(), Integer, [binary, {active, true}]),
  gen_tcp:send(Socket, "Incoming call").


received() ->
   io:format(" The message was received.~n ").

did_not_received() ->
   io:format(" The message was not received.~n ").

xmpp_directory() ->
   file:make_dir("xmpp").

xmpp1_directory() ->
   file:make_dir("xmpp_client").

xmpp2_directory() ->
   file:make_dir("xmpp2").

generate_user_jabber_id() ->
   Email = sole_api:email(),
   Phone_Number = sole_api:phone_number(),
   Email ++ "/" ++ Phone_Number.

xmpp1_ID() ->
   Jabber_ID = "server@comthru.com/5756894433",
   Jabber_ID.
xmpp2_ID() ->
   Jabber_ID = "server@comthru.com/4989990000",
   Jabber_ID.

start_tcp_server() ->
   sole_tcp_sup:start_link().

query(Phone_dial) ->
   Lookup = "sole_" ++ sole_api:hash_256_A(Phone_dial) ++ ":jabber_id()",
   Connect_IP = "sole_" ++ sole_api:hash_256_A(Phone_dial) ++ ":ip()",
   sole_api:connect_to_ip(Connect_IP),
   sole_api:connect(Lookup).

connect_to_ip(Connect_IP) ->
  Pid = spawn_link(fun() ->
        {ok, Socket} = gen_tcp:connect(Connect_IP, 1010, [binary, {active, true}]),
         gen_tcp:send(Socket, []),
         timer:sleep(infinity)
  end),
{ok, Pid}.

connect(Lookup) ->
   create_shared_file3(Lookup, []).

contact_lookup(A) ->
   filelib:is_file("sole_" ++ sole_api:hash_256_A(A) ++ ".erl").

mobile_cell(Arg) ->
   User_number = "clients_number" ++ Arg ++ ".yaws",
   file:write_file("mobile_cell.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <!DOCTYPE html>
   <html>
       <head>
        <title>DialNumber</title>
        <meta charset='UTF-8'>
        <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' href='fake_page.css'>
        <erl>
          out(Arg) ->
          {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
        </erl>
          <style>
            .dot2 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot3 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot4 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot5 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot6 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot7 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot8 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot9 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot10 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .dot11 {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: white;
             border-radius: 50%;
             display: inline-block;
             position: relative;
             border-width: 0px;
             color: #F5A9F2;
            }
            .del {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: purple;
             bottom: 525px;
             left: 900px;
             border-radius: 50%;
             display: inline-block;
             position: absolute;
             border-width: 0px;
            }
            .call {
             height: 100px;
             width: 100px;
             font-size: 33px;
             background-color: #4e57fc;
             border-color: #4e57fc;
             border-radius: 50%;
             border-width: 0px;
             color: #FFF;
             left: 900px;
             position: absolute;
             bottom: 5px;
            }
            .Mouth { display: none; }
          </style>
       </head>
       <body>
         <center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>
           <div class='over'>


             <erl>
             out(Arg) ->
             avatar:out([]).
           </erl>
             <form action=" ++ User_number ++ " method='POST'>
             <div id='numberDialed'>
             <center>
             <input id='one' name='phone_number' type='tel'  size='35' maxlength='10' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'>
             </center>
           </div>
               <div id='dialNumber'>
               <center>
               <table cellspacing='70'><td><input class='dot2' style='border-width: 0px; border-color: purple;' id='add' type='button' onclick='ik(this.value), one1(); number(), number1_(), number2_(), number3_(), number4_(), number5_(), number6_(), number7_(), number8_(), number9_()'  value='1'></td><td><input class='dot3' id='add' type='button' onclick='ik(this.value); two(), number1(), number_(), number2_(), number3_(), number4_(), number5_(), number6_(), number7_(), number8_(), number9_()'  value='2'></td><td><input class='dot4' id='add' type='button' onclick='ik(this.value); three(), number2(), number_(), number1_(), number3_(), number5_(), number4_(), number5_(), number6_(), number7_(), number8_(), number9_()'  value='3'></td><tr>
               <td><input id='add' class='dot5' type='button' onclick='ik(this.value); four(), number3(), number_(), number1_(), number2_(), number4_(), number5_(), number6_(), number7_(), number8_(), number9_()'  value='4'></td><td><input class='dot6' id='add' type='button' onclick='ik(this.value); five(), number4(), number_(), number1_(), number2_(), number3_(), number5_(), number6_(), number7_(), number8_(), number9_()'  value='5'></td><td><input class='dot7' id='add' type='button' onclick='ik(this.value); six(), number5(), number_(), number1_(), number2_(), number3_(), number4_(), number6_(), number7_(), number8_(), number9_()'  value='6'></td></tr><tr>
               <td><input class='dot8' id='add' type='button' onclick='ik(this.value); seven(), number6(), number_(), number1_(), number2_(), number3_(), number4_(), number5_(), number7_(), number8_(), number9_()'  value='7'></td><td><input class='dot9' id='add' type='button' onclick='ik(this.value); eight(), number7(), number_(), number1_(), number2_(), number3_(), number4_(), number5_(), number6_(), number8_(), number9_()'  value='8'></td><td><input class='dot10' id='add' type='button' onclick='ik(this.value); nine(), number8(), number_(), number1_(), number2_(), number3_(), number4_(), number5_(), number6_(), number7_(), number9_()'  value='9'></td></tr></table>
               <input class='dot11' id='add' type='button' onclick='ik(this.value); zero(), number9(), number_(), number1_(), number2_(), number3_(), number4_(), number5_(), number6_(), number7_(), number8_()'  value='0'></div>
             </center>
             <div class='del' onclick='remove()'><center><p style='color: #FFF; width: 25px; height: 25px;' class=paragraph><=</p></center></div>
             <input class='call' type='submit' value='call'>
             </form>
           </div>
           <script>
             function remove() {
             result.value = result.value.toString().slice(0, -1);
             }

             function ik(val){
                 result = document.getElementById('one');
                 result.value = result.value? result.value.toString() + val.toString() : val.toString();
                }
           </script>

             <script>
               function number() {
                 document.querySelector('.dot2').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number1() {
                 document.querySelector('.dot3').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number2() {
                 document.querySelector('.dot4').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number3() {
                 document.querySelector('.dot5').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number4() {
                 document.querySelector('.dot6').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number5() {
                 document.querySelector('.dot7').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number6() {
                 document.querySelector('.dot8').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number7() {
                 document.querySelector('.dot9').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number8() {
                 document.querySelector('.dot10').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
               function number9() {
                 document.querySelector('.dot11').style.cssText = 'background-color: purple; color: #FFF; font-size: 33px;';
               }
             </script>

             <script>
               function number_() {
                 document.querySelector('.dot2').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number1_() {
                 document.querySelector('.dot3').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number2_() {
                 document.querySelector('.dot4').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number3_() {
                 document.querySelector('.dot5').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number4_() {
                 document.querySelector('.dot6').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number5_() {
                 document.querySelector('.dot7').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number6_() {
                 document.querySelector('.dot8').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number7_() {
                 document.querySelector('.dot9').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number8_() {
                 document.querySelector('.dot10').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
               function number9_() {
                 document.querySelector('.dot11').style.cssText = 'background-color: #FFF; color: #F5A9F2; font-size: 33px;';
               }
             </script>

           </div>
           <br>
             <br>
               <br>
                 <br>
                   <br>
                     <br>


           <center align='center'>
             <table cellspacing='0' width='100%'>
               <td>
             <div class='dot'><a href='contact_list.yaws'><br><img src='images_folder/Personal_profile_icon.png' 'width=40px height=40px'></a></div> </td><td> <div class='dot'><br><img src='images_folder/pad.png' 'width=40px height=40px'></div> </td><td> <div class='dot'><a href='group_chat.yaws'><br><img src='images_folder/convo_sketch.png' 'width=40px height=40px'></a></div>
             </td>
           </table>
         </center>
         <center align='center'>
           <table cellspacing='40' width='120%'>
             <td>
           <div class='write' style='width:150px;'>Contact list</div> </td><td> <div class='write' style='width:150px;'>Keypad</div> </td><td> <div class='write' style='width:150px; position: align-right;'>Group Chat</div>
           </td>
         </table>
           </center>

           <erl>
             out(Arg) ->
             {ehtml, {a, [{href, 'commercial5.yaws'}], [{'div', [{class, writes}, {style, 'width: 15%; height: 100px; background-color: #4e57fc; position: absolute; top: 0px; padding: 0px; margin: -8px; border-radius: 5px;'}, {align, center}], [{input, [{type, button}, {value, 'Go Back'}, {id, linkCreateAccount}, {style, 'color:#FFF; border-color:#4e57fc; background-color:#4e57fc; border-width:0px;'}]}]}]}}.
           </erl>


       </body>
       <script src='face.js'></script>
       <script src='figure.js'></script>
       <script>
         function zero() {
           var audio = new Audio('phone/0.m4a');
           audio.play();
         }
       </script>
       <script>
         function one1() {
           var audio = new Audio('phone/1.m4a');
           audio.play();
         }
       </script>
       <script>
         function two() {
           var audio = new Audio('phone/2.m4a');
           audio.play();
         }
       </script>
       <script>
         function three() {
           var audio = new Audio('phone/3.m4a');
           audio.play();
         }
       </script>
       <script>
         function four() {
           var audio = new Audio('phone/4.m4a');
           audio.play();
         }
       </script>
       <script>
         function five() {
           var audio = new Audio('phone/5.m4a');
           audio.play();
         }
       </script>
       <script>
         function six() {
           var audio = new Audio('phone/6.m4a');
           audio.play();
         }
       </script>
       <script>
         function seven() {
           var audio = new Audio('phone/7.m4a');
           audio.play();
         }
       </script>
       <script>
         function eight() {
           var audio = new Audio('phone/8.m4a');
           audio.play();
         }
       </script>
       <script>
         function nine() {
           var audio = new Audio('phone/9.m4a');
           audio.play();
         }
       </script>


   </html>"]).

clients_number() ->
   file:copy("clients_number.yaws", "clients_number" ++ sole_api:phone_number() ++ ".yaws").

dynamic_message(Msg) ->
   share_msg(Msg).

share_msg(Msg) ->
   create_shared_file1(Msg),
   share_msg2(Msg).

share_msg2(Msg) ->
   create_shared_file2(Msg),
   share_msg3(Msg).

share_msg3(Msg) ->
   create_shared_file3([], Msg).

create_shared_file1(Msg) ->
   file:write_file("xmpp_client/xmpp_client_to_server.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <erl module='client_to_server'>
   -export([get_id/1]).

   get_id(Intended_contact) ->
      L = yaws_api:parse_post(Intended_contact),
      M = {ehtml, f('~p', [L])},
      O = element(2, M),
      P = sole_api:contact_lookup(O),
      if P == true ->
              sole_api:query(O);
         true ->
              io:format('Error')
      end.

     out(A) ->
     Jabber_ID = sole_api:generate_user_jabber_id(),
     INTENDED_C = yaws_api:parse_post(A),
       {exhtml, {stream, []},
          {presence, [], sole_api, know_presence, f('~p', [])},
          {iq, [{type, 'get'}], {query, [{xmlns, 'jabber:iq:roster'}]}},
          {message, [{from, Jabber_ID}, {to, {client_to_server, get_id, f('~p' [INTENDED_C])}}, {type, 'chat'}]," ++ Msg ++ "}
          }.
   </erl>"
          ]).

create_shared_file2(Msg) ->
   file:write_file("xmpp/xmpp_server_to_server.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <erl module='server_to_server'>
     out(A) ->
     {exhtml, {stream, []},
     {message, [{from, {sole_api, xmpp1_ID, f('~p', [])}},
     {to, {sole_api, xmpp2_ID, f('~p', [])}}, {type, 'chat'}],",  Msg, "},
     }.
   </erl>"]).

create_shared_file3(Lookup, Msg) ->
   file:write_file("xmpp2/xmpp_server_to_client.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <erl module='server_to_client'>
     out(A) ->
     {exhtml, {stream, []},
     {presence, [], sole_api, know_presence, f('~p', [])},
     {message, [{from, {sole_api, xmpp2_ID, f('~p', [])}, {to, {" ++ Lookup ++ "}}}, {type, 'chat'}]," ++ Msg ++ "}}.\n
     </erl>
     "]).

all_xmpp_files() ->
   create_file1(),
   create_file2(),
   create_file3(),
   create_file4().

create_file1() ->
   file:write_file("xmpp_client/xmpp_client_to_server.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <erl module='client_to_server'>
   -export([get_id/1]).

   get_id(Intended_contact) ->
      L = yaws_api:parse_post(Intended_contact),
      M = {ehtml, f('~p', [L])},
      O = element(2, M),
      P = sole_api:contact_lookup(O),
      if P == true ->
              sole_api:query(O);
         true ->
              io:format('Error')
      end.

     out(A) ->
     Jabber_ID = sole_api:generate_user_jabber_id(),
       {exhtml, {stream, []},
          {presence, [], sole_api, know_presence, f('~p', [])},
          {iq, [{type, 'get'}], {query, [{xmlns, 'jabber:iq:roster'}]}},
          {message, [{from, Jabber_ID}, {to, 'unknown'}, {type, 'chat'}]}
          }.
   </erl>"
          ]).

create_file2() ->
   file:write_file("xmpp/xmpp_server_to_server.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <erl module='server_to_server'>
     out(A) ->
     {exhtml, {stream, []},
     {message, [{from, {sole_api, xmpp1_ID, f('~p', [])}},
     {to, {sole_api, xmpp2_ID, f('~p', [])}}, {type, 'chat'}]},
     }.
   </erl>"]).

create_file3() ->
  file:write_file("xmpp2/xmpp_server_to_client.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <erl module='server_to_client'>
    out(A) ->
    {exhtml, {stream, []},
    {presence, [], sole_api, know_presence, f('~p', [])},
    {message, [{from, {sole_api, xmpp2_ID, f('~p', [])}, {to, 'unknown'}}, {type, 'chat'}]}}.
    </erl>
    "]).

create_file4() ->
  file:write_file("stream_" ++ sole_api:phone_number() ++ ".txt", [""]).


listen_for_binary(1011) ->
  Pid = spawn_link(fun() ->
      {ok, Listen} = gen_tcp:listen(1011, [binary, {active, false}]),
      spawn(fun() -> acceptor(Listen) end),
      timer:sleep(infinity)
      end),
      {ok, Pid}.

acceptor(ListenSocket) ->
  {ok, Socket} = gen_tcp:accept(ListenSocket),
  spawn(fun() -> acceptor(ListenSocket) end),
  handle(Socket).

handle(Socket) ->
  inet:setopts(Socket, [{active, once}]),
  receive
      {tcp, Socket, []} ->
             io:format("received no message.~n");
      {tcp, Socket, Binary} ->
             manipulate_file(Binary),
             handle(Socket)
  end.

manipulate_file(Binary) ->
  file:write_file("stream_" ++ sole_api:phone_number() ++ ".txt", [Binary]).

male_avatar() ->
{html,"<div id='avatar'><table style='z-index: 10000' cellspacing=0><td><div class=space></div></td><td width=75%><div class=speech><p class='paragraphs' style='color: #101010;'>Talking...</p></div></td><tr><table id=Person style=position: absolute;><tr><embed><div id=Image><div class=Mouth></div></div></embed></tr><tr><div id=Gender style='background-color:#F5A9F2;width:25px;height:25px;'><img src=images_folder/Male.png height=25px width=25px</div></tr></table></tr></table><script src=speech.js></script><script src=space.js></script><script src=convo.js></script><script src=talk.js></script><script src=face.js></script><script src=figure.js></script></div>"}.

female_avatar() ->
{html,"<div id='avatar'><table style='z-index: 10000' cellspacing=0><td><div class=space></div></td><td width=75%><div class=speech><p class='paragraphs' style='color: #101010;'>Talking...</p></div></td><tr><table id=Person style=position: absolute;><tr><embed><div id=Image><div class=Mouth></div></div></embed></tr><tr><div id=Gender style='background-color:#F5A9F2;width:25px;height:25px;'><img src=images_folder/female.png height=25px width=25px</div></tr></table></tr></table><script src=speech.js></script><script src=space.js></script><script src=convo.js></script><script src=talk.js></script><script src=face.js></script><script src=figure.js></script></div>"}.

other_avatar() ->
{html,"<div id='avatar'><table style='z-index: 10000' cellspacing=0><td><div class=space></div></td><td width=75%><div class=speech><p class='paragraphs' style='color: #101010;'>Talking...</p></div></td><tr><table id=Person style=position: absolute;><tr><embed><div id=Image><div class=Mouth></div></div></embed></tr><tr><div id=Gender style='background-color:#F5A9F2;width:25px;height:25px;'><img src=images_folder/genderqueer.png height=25px width=25px</div></tr></table></tr></table><script src=speech.js></script><script src=space.js></script><script src=convo.js></script><script src=talk.js></script><script src=face.js></script><script src=figure.js></script></div>"}.

uppercase_to_lowercase(String) ->
  [_H|T] = String,
  L = string:left(String, 1),
      case L of
           "A" -> "a" ++ T;
           "B" -> "b" ++ T;
           "C" -> "c" ++ T;
           "D" -> "d" ++ T;
           "E" -> "e" ++ T;
           "F" -> "f" ++ T;
           "G" -> "g" ++ T;
           "H" -> "h" ++ T;
           "I" -> "i" ++ T;
           "J" -> "j" ++ T;
           "K" -> "k" ++ T;
           "L" -> "l" ++ T;
           "M" -> "m" ++ T;
           "N" -> "n" ++ T;
           "O" -> "o" ++ T;
           "P" -> "p" ++ T;
           "Q" -> "q" ++ T;
           "R" -> "r" ++ T;
           "S" -> "s" ++ T;
           "T" -> "t" ++ T;
           "U" -> "u" ++ T;
           "V" -> "v" ++ T;
           "W" -> "w" ++ T;
           "X" -> "x" ++ T;
           "Y" -> "y" ++ T;
           "Z" -> "z" ++ T
      end.

get_emoji(Name) ->
  happy_emojis(Name),
  poker_emojis(Name),
  angry_emojis(Name).


happy_emojis(Name) ->
  Tuple = "{content, " ++ "\"" ++ "text/plain" ++ "\"" ++ "," ++ "\"" ++ "You're not a web sockets client! Go away!" ++ "\"" ++ "}",
  file:write_file(Name ++ "get_emojis.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <websocket>
  <erl>


    get_upgrade_header(#headers{other=L}) ->
        lists:foldl(fun({http_header,_,KO,_,V}, undefined) ->
                            K = case is_atom(KO) of
                                    true ->
                                        atom_to_list(KO);
                                    false ->
                                        KO
                                end,
                            case string:to_lower(K) of
                                'Upgrade' ->
                                    true;
                                _ ->
                                    false
                            end;
                        (_, Acc) ->
                             Acc
                    end, false, L).


  %%------------------------------------------------------------------------------

  out(Arg) ->
      case get_upgrade_header(Arg#arg.headers) of
      true ->
          error_logger:warning_msg('Not a web socket client~n'),
          " ++ Tuple ++ ";
      false ->
          error_logger:info_msg('Starting web socket~n'),
          {websocket, " ++ Name ++ "_happy_emojis, []}
      end.

  </erl>
  </websocket>"]),
  file:copy("happy_emojis.erl", Name ++ "_happy_emojis.erl"),
  {ok, F} = file:open(Name ++ "_happy_emojis.erl", [read, write]),
  ok = file:pwrite(F, 0, ["-module(" ++ Name ++ "_happy_emojis).\n\n%%"]),
  c:c(Name ++ "_happy_emojis").



poker_emojis(Name) ->
  Tuple = "{content, " ++ "\"" ++ "text/plain" ++ "\"" ++ "," ++ "\"" ++ "You're not a web sockets client! Go away!" ++ "\"" ++ "}",
  file:write_file(Name ++ "get_emojis2.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <websocket>
  <erl>


    get_upgrade_header(#headers{other=L}) ->
        lists:foldl(fun({http_header,_,KO,_,V}, undefined) ->
                            K = case is_atom(KO) of
                                    true ->
                                        atom_to_list(KO);
                                    false ->
                                        KO
                                end,
                            case string:to_lower(K) of
                                'Upgrade' ->
                                    true;
                                _ ->
                                    false
                            end;
                        (_, Acc) ->
                              Acc
                    end, false, L).


  %%------------------------------------------------------------------------------

  out(Arg) ->
      case get_upgrade_header(Arg#arg.headers) of
      true ->
          error_logger:warning_msg('Not a web socket client~n'),
          " ++ Tuple ++ ";
      false ->
          error_logger:info_msg('Starting web socket~n'),
          {websocket, " ++ Name ++ "_poker_emojis, []}
      end.

  </erl>
  </websocket>"]),
  file:copy("poker_emojis.erl", Name ++ "_poker_emojis.erl"),
  {ok, F} = file:open(Name ++ "_poker_emojis.erl", [read, write]),
  ok = file:pwrite(F, 0, ["-module(" ++ Name ++ "_poker_emojis).\n\n%%"]),
  c:c(Name ++ "_poker_emojis").




angry_emojis(Name) ->
  Tuple = "{content, " ++ "\"" ++ "text/plain" ++ "\"" ++ "," ++ "\"" ++ "You're not a web sockets client! Go away!" ++ "\"" ++ "}",
  file:write_file(Name ++ "get_emojis3.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <websocket>
  <erl>


    get_upgrade_header(#headers{other=L}) ->
        lists:foldl(fun({http_header,_,KO,_,V}, undefined) ->
                            K = case is_atom(KO) of
                                    true ->
                                        atom_to_list(KO);
                                    false ->
                                        KO
                                end,
                            case string:to_lower(K) of
                                'Upgrade' ->
                                    true;
                                _ ->
                                    false
                            end;
                        (_, Acc) ->
                              Acc
                    end, false, L).


  %%------------------------------------------------------------------------------

  out(Arg) ->
      case get_upgrade_header(Arg#arg.headers) of
      true ->
          error_logger:warning_msg('Not a web socket client~n'),
          " ++ Tuple ++ ";
      false ->
          error_logger:info_msg('Starting web socket~n'),
          {websocket, " ++ Name ++ "_angry_emojis, []}
      end.

  </erl>
  </websocket>"]),
  file:copy("angry_emojis.erl", Name ++ "_angry_emojis.erl"),
  {ok, F} = file:open(Name ++ "_angry_emojis.erl", [read, write]),
  ok = file:pwrite(F, 0, ["-module(" ++ Name ++ "_angry_emojis).\n\n%%"]),
  c:c(Name ++ "_angry_emojis").


generate_user_number_file(Arg) ->
   file:write_file(Arg ++ ".yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <!DOCTYPE html>
   <html>
       <head>
        <title>Incoming Call</title>
        <meta charset='UTF-8'>
        <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' href='fake_page.css'>
        <erl>
          out(Arg) ->
          {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
        </erl>
       </head>
       <style>
       .Mouth { display: none; }
       </style>
       <body>
       <center>
       <div class=dot>
       <br>
       <img src=images_folder/comthru.png width=50% height=50%>
       </div>
       </center>
       <div class='over' style='height:1000px'>
             <erl>
             out(Arg) ->
             avatar:out([]).
           </erl>
           <script>
             function music() {
               var audio = new Audio('African_Moon.mp3');
               audio.play();
             }

       var eggAudio = new Audio('African_Moon.mp3');
       const bc = new window.BroadcastChannel('connecting_lines');
       eggAudio.loop = false;
   // Allow window to listen for a postMessage
       bc.onmessage = (msg) => {
   // Normally you would check event.origin
           // To verify the targetOrigin matches
           // this window's domain
           let txt=document.querySelector('#txtMsg');
           // event.data contains the message sent
           txt.value=`${event.data.pNumber}`;
   eggAudio.play();
   startTimeout();
       }

       const stop_connection = new window.BroadcastChannel('stop_connection');
       stop_connection.onmessage = (msg) => {
           let txt=document.querySelector('#connect');
           if (event.data.pConnection==='Stop connection'){
           cancel_call();
           }
       }
       </script>
     <center>
       <form>
                   <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>
                   <input type='text' id='connect' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

       </form>
     </center>
     <script type='text/javascript'>
     var values, count=0;

     function startTimeout() {
       values = setTimeout(cancel_call, 36000);
     }

       function cancel_call() {
         window.location.href = 'commercial5.yaws';
       }

     var childwin;
     const childname = 'close_lines';
     function openChild() {
     childwin = new window.BroadcastChannel(childname);

     }
     function sendMessage(){
         let msg={pVal : 'Yes'};
         // In production, DO NOT use '*', use toe target domain
         childwin.postMessage(msg,'https://www.comthru.com/clients_number${phoneNumber[0].value}.yaws');
     }
     function sendMessage1(){
         let msg={pVal : 'No'};
         // In production, DO NOT use '*', use toe target domain
         childwin.postMessage(msg,'https://www.comthru.com/clients_number${phoneNumber[0].value}.yaws');
     }
     const phoneNumber = document.getElementsByTagName('input');
     const phone_num = document.getElementById('Phone_Number');
     function allow() {
       window.location.href = `${Phone_Number.innerHTML}_${phoneNumber[0].value}.yaws`;
     }


     function reject_call() {
       socket.send(`${Phone_Number.innerHTML}_${phoneNumber[0].value}.yaws`);
     }
     </script>

           </div>

           <table cellspacing='0' width='100%' style='bottom: 0px; position: absolute; margin: -8px; border-radius: 5px;'>
             <td>
           <input class='paragraph' onclick='openChild(); sendMessage(); allow();' type='button' value='Accept' style='background-color: #4e57fc; color: #fff; border-radius: 5px; width: 500px; border-width: 0px;'></td><td width='5%'><input class='paragraph' id='btnSendMsg' type='button' value='Decline' style='color: #fff; background-color: #4e57fc; border-radius: 5px; width: 500px; border-width: 0px;' onclick='openChild(); sendMessage1(); reject_call(); cancel_call();'/>
           </td>
           </table>


           <erl>
             out(Arg) ->
             Phone_Number = " ++ Arg ++ ",
             {ehtml, {p, [{class, 'paragraph'}, {id, 'Phone_Number'}], Phone_Number}}.
           </erl>


       </body>
       <script src='face.js'></script>
       <script src='figure.js'></script>


   </html>"]).


create_delete_repeat(String) ->
   file:delete("a" ++ String ++ ".yaws"),
   file:write_file("a" ++ String ++ ".yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <!DOCTYPE html>
   <html>
   <head>
     <title>My Audio</title>
     </head>
   </head>
   <body>
     <audio src=" ++ "'" ++ String ++ ".mp3' " ++  " id='my_audio' loop='loop'></audio>
     <script type='text/javascript'>
       window.onload=function(){
         document.getElementById('my_audio').play();
       }
     </script>
   </body>
   </html>"]).

generate_voice_files(String) ->
   S1 = string:substr(String, 1, 10),
   S2 = string:substr(String, 12, 22),
   voip_module(S1),
   file1(S1, S2),
   file2(S1, S2).

voip_module(S1) ->
   AFE = ".mp3",
   Io_Format = " '~p:~p voip Server got ~p~n',",
   file:write_file("voip.erl", ["-module(voip).

   %% Export for websocket callbacks
   -export([handle_message/1]).

   handle_message({binary, Message}) ->
       io:format(",  Io_Format,  "
             [?MODULE, ?LINE, Message]),
             file:write_file(" ++ "'" ++ S1 ++ AFE ++ "'", ", [Message]),
       {reply, {binary, <<Message/binary>>}}."]),
       c:c("voip").

file1(S1, S2) ->
   AFE = ".mp3",
   file:write_file(S1 ++ "_" ++ S2 ++ ".yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <!DOCTYPE html>
   <html>
       <head>
        <title>instant-voice</title>
        <meta charset='UTF-8'>
        <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' href='fake_page.css'>
        <link rel='stylesheet' href='play.css'>
        <erl>
          out(Arg) ->
          {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
        </erl>
        <link rel='stylesheet' href='speech-bubble.css'>
       </head>
       <style>
         .paragraphs {display: block; }
       </style>
       <body id='btnStart'>
         <center>
           <div class=dot>
             <br>
               <img src=images_folder/comthru.png width=50% height=50%>
             </div>
           </center>
           <script src='jquery.min.map'></script>
           <div id='btnStop' class='over' style='height:1000px'>
             <erl>
               out(Arg) ->
               avatar:out([]).
             </erl>
             <erl>
               out(Arg) ->
               Phone_Number =" ++ "'" ++ S1 ++ "_" ++ S2 ++ "',", "
               {ehtml, {p, [{class, 'paragraph'}, {id, 'Phone_Number'}], atom_to_list(Phone_Number)}}.
             </erl>
             <erl module='first_avatar" ++ S1 ++ "'" ++ ">
               -export([send_avatar/0]).

               send_avatar() ->
                 avatar:out([]).

               out(Arg) ->
                 second_avatar" ++ S2 ++ ":send_avatar().
               </erl>
             <script>
               const broadcastvoice=new window.BroadcastChannel('voice_call_" ++ S1 ++ "');
               const WebSocket = window.WebSocket || window.MozWebSocket;
               const socket = new WebSocket('wss://www.comthru.com/rtc.yaws');
               let audioIN = { audio: true };
               //  audio is true, for recording

               // Access the permission for use
               // the microphone
               navigator.mediaDevices.getUserMedia(audioIN)


               // 'then()' method returns a Promise
               .then(function (mediaStreamObj) {

                 // Connect the media stream to the
                 // first audio element
                 let audio = document.querySelector('audio');
                 //returns the recorded audio via 'audio' tag

                 // 'srcObject' is a property which
                 // takes the media object
                 // This is supported in the newer browsers
                 if ('srcObject' in audio) {
                   audio.srcObject = mediaStreamObj;
                 }
                 else {   // Old version
                   audio.src = window.URL
                     .createObjectURL(mediaStreamObj);
                 }

                 // It will play the audio
                 audio.onloadedmetadata = function (ev) {

                   // Play the audio in the 2nd audio
                   // element what is being recorded
                   audio.play();
                 };

                 // Start record
                 let start = document.getElementById('btnStart');

                 // Stop record
                 let stop = document.getElementById('btnStop');

                 // 2nd audio tag for play the audio
                 let playAudio = document.getElementById('adioPlay');

                 // This is the main thing to recorde
                 // the audio 'MediaRecorder' API
                 let mediaRecorder = new MediaRecorder(mediaStreamObj);
                 // Pass the audio stream

                 // Start event
                 start.addEventListener('click', function (ev) {
                   mediaRecorder.start();
                   // console.log(mediaRecorder.state);
                 })

                 // Stop event
                 stop.addEventListener('mousemove', function (ev) {
                   mediaRecorder.stop();
                   // console.log(mediaRecorder.state);
                 });

                 // If audio data available then push
                 // it to the chunk array
                 mediaRecorder.ondataavailable = function (ev) {
                   dataArray.push(ev.data);
                 }

                 // Chunk array to store the audio data
                 let dataArray = [];

                 // Convert the audio data in to blob
                 // after stopping the recording
                 mediaRecorder.onstop = function (ev) {

                   // blob of type mp3
                   let audioData = new Blob(dataArray,
                             { 'type': 'audio/mp3;' });

                             socket.send(audioData);

                             socket.onmessage = function(event) {
                             playAudio()
                             };

                             function playAudio() {
                                 let audio = new Audio()
                                 audio.src ='" ++ S1 ++ AFE ++ "'
                                 audio.load()
                                 audio.play()
                                 let msg = {aData : audio.play()}
                                 broadcastvoice.postMessage(msg, 'https://www.comthru.com')
                             };

                   // After fill up the chunk
                   // array make it empty
                   dataArray = [];

                   // Creating audio url with reference
                   // of created blob named 'audioData'
                   let audioSrc = window.URL
                       .createObjectURL(audioData);

                   // Pass the audio url to the 2nd video tag
                   playAudio.src = audioSrc;
                 }
               })



               // If any error occurs then handles the error
               .catch(function (err) {
                 console.log(err.name, err.message);
               });

               broadcastvoice.onmessage = (msg) => {
                   let sound=new Audio();
                   sound.src=`${event.data.aData}`;
                   sound.load()
                   sound.play()

               }
             </script>
             <script>
               const socket2 = new WebSocket('wss://www.comthru.com/end_call.yaws');
               const phoneNumber = document.getElementsByTagName('p');
               const b=new window.BroadcastChannel('end_call');

               function stop_c() {
                   let msg={pConnection : phoneNumber[1].innerHTML};
                   b.postMessage(msg, 'https://www.comthru.com');
               }

               b.onmessage = (msg) => {
                   let txt=document.querySelector('#txtMsg');
                   txt.value=`${event.data.pConnection}`;
                   socket2.send(`${phoneNumber[1].innerHTML}.yaws`);
                   redirect();

               }

               function redirect() {
               window.location.href = 'commercial5.yaws';
               }

               function sending_message() {
                   socket2.send(`${phoneNumber[1].innerHTML}.yaws`);
                   socket2.send(`${num.innerHTML}.mp3`);
                   stop_c();
                   redirect();
               }
             </script>
             <audio muted></audio>
             <audio id='adioPlay'></audio>
             <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>
             <erl>
               out(Arg) ->
               Phone_Number =" ++ "'" ++ S1 ++ "'" ++ ",
               {ehtml, {p, [{class, 'paragraph'}, {id, 'num'}], atom_to_list(Phone_Number)}}.
             </erl>
           </div>
           <button type='submit' id='end_call' onclick='sending_message()' style='width: 100%; height: 100px; color: #fff; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px; border-width: 0px;'>End Voice Call</button>
         </body>
       </html>"]).

file2(S1, S2) ->
   AFE = ".mp3",
   file:write_file(S2 ++ "_" ++ S1 ++ ".yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <!DOCTYPE html>
   <html>
       <head>
        <title>instant-voice</title>
        <meta charset='UTF-8'>
        <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' href='fake_page.css'>
        <link rel='stylesheet' href='play.css'>
        <erl>
          out(Arg) ->
          {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
        </erl>
        <link rel='stylesheet' href='speech-bubble.css'>
       </head>
       <style>
         .paragraphs {display: block; }
       </style>
       <body id='btnStart'>
         <center>
           <div class=dot>
             <br>
               <img id='logo' src=images_folder/comthru.png width=50% height=50%>
             </div>
           </center>
           <script src='jquery.min.map'></script>
           <div id='btnStop' class='over' style='height:1000px'>
             <erl>
               out(Arg) ->
               avatar:out([]).
             </erl>
             <erl>
               out(Arg) ->
               Phone_Number = " ++ "'" ++ S2 ++ "_" ++ S1 ++ "',", "
               {ehtml, {p, [{class, 'paragraph'}, {id, 'Phone_Number'}], atom_to_list(Phone_Number)}}.
             </erl>
             <erl module='second_avatar" ++ S2 ++ "'" ++ ">
               -export([send_avatar/0]).

               send_avatar() ->
                 avatar:out([]).


               out(Arg) ->
                 first_avatar" ++ S1 ++ ":send_avatar().
               </erl>
               <script>
                 const broadcastvoice=new window.BroadcastChannel('voice_call_" ++ S1 ++ "');
                 const WebSocket = window.WebSocket || window.MozWebSocket;
                 const socket = new WebSocket('wss://www.comthru.com/rtc.yaws');
                 let audioIN = { audio: true };
                 //  audio is true, for recording

                 // Access the permission for use
                 // the microphone
                 navigator.mediaDevices.getUserMedia(audioIN)


                 // 'then()' method returns a Promise
                 .then(function (mediaStreamObj) {

                   // Connect the media stream to the
                   // first audio element
                   let audio = document.querySelector('audio');
                   //returns the recorded audio via 'audio' tag

                   // 'srcObject' is a property which
                   // takes the media object
                   // This is supported in the newer browsers
                   if ('srcObject' in audio) {
                     audio.srcObject = mediaStreamObj;
                   }
                   else {   // Old version
                     audio.src = window.URL
                       .createObjectURL(mediaStreamObj);
                   }

                   // It will play the audio
                   audio.onloadedmetadata = function (ev) {

                     // Play the audio in the 2nd audio
                     // element what is being recorded
                     audio.play();
                   };

                   // Start record
                   let start = document.getElementById('btnStart');

                   // Stop record
                   let stop = document.getElementById('btnStop');

                   // 2nd audio tag for play the audio
                   let playAudio = document.getElementById('adioPlay');

                   // This is the main thing to recorded
                   // the audio 'MediaRecorder' API
                   let mediaRecorder = new MediaRecorder(mediaStreamObj);
                   // Pass the audio stream

                   // Start event
                   start.addEventListener('click', function (ev) {
                     mediaRecorder.start();
                     // console.log(mediaRecorder.state);
                   })

                   // Stop event
                   stop.addEventListener('mousemove', function (ev) {
                     mediaRecorder.stop();
                     // console.log(mediaRecorder.state);
                   });

                   // If audio data available then push
                   // it to the chunk array
                   mediaRecorder.ondataavailable = function (ev) {
                     dataArray.push(ev.data);
                   }

                   // Chunk array to store the audio data
                   let dataArray = [];

                   // Convert the audio data in to blob
                   // after stopping the recording
                   mediaRecorder.onstop = function (ev) {

                     // blob of type mp3
                     let audioData = new Blob(dataArray,
                               { 'type': 'audio/mp3;' });

                               socket.send(audioData);

                               socket.onmessage = function(event) {
                               playAudio()
                               };

                               function playAudio() {
                                   let audio = new Audio()
                                   audio.src ='" ++ S1 ++ AFE ++ "'
                                   audio.load()
                                   audio.play()
                                   let msg = {aData : audio.play()}
                                   broadcastvoice.postMessage(msg, 'https://www.comthru.com')
                               };

                     // After fill up the chunk
                     // array make it empty
                     dataArray = [];

                     // Creating audio url with reference
                     // of created blob named 'audioData'
                     let audioSrc = window.URL
                         .createObjectURL(audioData);

                     // Pass the audio url to the 2nd video tag
                     playAudio.src = audioSrc;
                   }
                 })

                 // If any error occurs then handles the error
                 .catch(function (err) {
                   console.log(err.name, err.message);
                 });

                 broadcastvoice.onmessage = (msg) => {
                     let sound=new Audio();
                     sound.src=`${event.data.aData}`;
                     sound.load()
                     sound.play()

                 }
               </script>
               <script>
                 const b=new window.BroadcastChannel('end_call');
                 const socket2 = new WebSocket('wss://comthru.com/end_call.yaws');
                 const phoneNumber2 = document.getElementById('Phone_Number');

                 function stop_c() {
                     let msg={pConnection : phoneNumber2.innerHTML};
                     b.postMessage(msg, 'https://www.comthru.com');
                 }

                 b.onmessage = (msg) => {
                     let txt=document.querySelector('#txtMsg');
                     txt.value=`${event.data.pConnection}`;
                     socket2.send(`${phoneNumber2.innerHTML}.yaws`);
                     redirect();
                 }

                 function redirect() {
                 window.location.href = 'commercial5.yaws';
                 }

                 function sending_message() {
                     socket2.send(`${phoneNumber2.innerHTML}.yaws`);
                     socket2.send(`${num.innerHTML}.mp3`);
                     stop_c();
                     redirect();
                 }
               </script>
               <audio muted></audio>
               <audio id='adioPlay'></audio>
               <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>
               <erl>
                 out(Arg) ->
                 Phone_Number = " ++ "'" ++ S1 ++ "',
                 {ehtml, {p, [{class, 'paragraph'}, {id, 'num'}], atom_to_list(Phone_Number)}}.
               </erl>
           </div>
           <script src='face.js'></script>
           <script src='figure.js'></script>
           <button type='submit' id='end_call' onclick='sending_message()' style='width: 100%; height: 100px; color: #fff; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px; border-width: 0px;'>End Voice Call</button>
         </body>
       </html>"]).



store_image1() ->
   file:rename("Uploadsblob", "Uploads/" ++ sole_api:first_name() ++ "_cheese.jpeg").

store_image2() ->
   file:rename("Uploadsblob", "Uploads/" ++ sole_api:first_name() ++ "_poker.jpeg").

store_image3() ->
   file:rename("Uploadsblob", "Uploads/" ++ sole_api:first_name() ++ "_angry.jpeg").

store_audio() ->
   file:rename("Uploadsblob", "Uploads/voice.m4a").

person_css() ->
   file:write_file(sole_api:first_name() ++ ".css", ["html {
     padding: 0px;
     margin: 0px;
   }


   #Image {
     transform: translate3d(1/2px, 1/2px, 0);
     height: 100px;
     width: 100px;
     border-radius: 50%;
     background: url(" ++ "\"" ++ "Uploads/" ++ sole_api:first_name() ++ "_poker.jpeg" ++ "\"" ++ ") no-repeat center;
     background-size: contain;
     transition: transform .3s cubic-bezier(.29, .93, .29, .93);
     cursor: pointer;
     display: block;
     position: relative;
     z-index: 30;
     text-align: center;
   }
   #Gender {
       transform: translate3d(4px, 4px, 0);
       transition: transform .3s cubic-bezier(.29, .93, .88, .37);
       height: 20px;
       width: 20px;
       background-color: grey;
       border-radius: 50%;
       display: block;
       position: relative;
       z-index: 20;
   }
   #Person {
   position: absolute;
   }
   .Mouth {
     height: 30px;
     width: 30px;
     position: absolute;
     z-index: 40;
     border-radius: 50%;
     background-color: black;
     margin: 60% 40%;
   }

   .paragraphs {
     font-size: 25px;
     line-height: 62px;
     font-family: 'Open Sans',sans-serif;
     display: none;
   }"]).


copy_file() ->
   file:copy("filmmake.yaws", "filmmake" ++ sole_api:phone_number() ++ ".yaws"),
   [{redirect, "/filmmake" ++ sole_api:phone_number() ++ ".yaws"}].

copy_emojis() ->
   file:copy("Uploads/angry.jpeg", sole_api:first_name() ++ "_angry.jpeg"),
   file:copy("Uploads/cheese.jpeg", sole_api:first_name() ++ "_cheese.jpeg"),
   file:copy("Uploads/poker.jpeg", sole_api:first_name() ++ "_poker.jpeg").

duplicate_file() ->
   file:copy("commercial.yaws", "commercial" ++ sole_api:first_name() ++ ".yaws").

duplicate_images() ->
   file:copy("Uploads/cheese.jpeg", sole_api:hash_256("Uploads/cheese.jpeg") ++ ".jpeg"),
   file:copy("Uploads/poker.jpeg", sole_api:hash_256("Uploads/poker.jpeg") ++ ".jpeg"),
   file:copy("Uploads/angry.jpeg", sole_api:hash_256("Uploads/angry.jpeg") ++ ".jpeg").

stream_data(Pid) ->
   File = "/wallet.html",
   FileHDL = open_file(File),
   stream_from_file(Pid, FileHDL, 1).


open_file(File) ->
   {ok, IoDevice} = file:open(File, [read, binary]),
        IoDevice.

stream_from_file(Pid, File, I) ->
   Result = file:read(File, 4096),
   case Result of
   {ok, Data} ->
       yaws_api:stream_chunck_deliver_blocking(Pid, Data),
       stream_from_file(Pid, File, I+1);
   eof ->
       yaws_api:stream_chunck_end(Pid);
   {error, Reason} ->
       error_logger:error_msg("~p:~p Error ~p ~n",
                  [?MODULE, ?LINE, Reason])
   end.


stream_live(Pid) ->
  File = "/filmmake.yaws",
  FileHDL = open_file1(File),
  stream_from_file1(Pid, FileHDL, 1).


open_file1(File) ->
  {ok, IoDevice} = file:open(File, [read, binary]),
        IoDevice.

stream_from_file1(Pid, File, I) ->
  Result = file:read(File, 4096),
  case Result of
  {ok, Data} ->
      yaws_api:stream_chunck_deliver_blocking(Pid, Data),
      stream_from_file(Pid, File, I+1);
  eof ->
      yaws_api:stream_chunck_end(Pid);
  {error, Reason} ->
      error_logger:error_msg("~p:~p Error ~p ~n",
                  [?MODULE, ?LINE, Reason])
  end.

validate_num(String) ->
  Process_string = divide(String, 1),
  Strings_to_int = string_to_int(Process_string, 1),
  validate_card(Strings_to_int).

divide(List, N) ->
  divide(List, N, length(List)).

divide(List, N, Length) when Length > N ->
  {A, B} = lists:split(N, List),
  [A | divide(B, N, Length - N)];
divide(List, _, _) ->
  [List].

string_to_int(String, N) ->
  string_to_int(String, N, string:len(String)).

string_to_int(String, N, Len) when Len > N ->
  [H|T] = String,
  H1 = list_to_integer(H),
lists:flatten([H1, string_to_int(T,  N, string:len(T) + N)]);

string_to_int(List, _, _) ->
  [List].



  validate_card(Card_num) ->
    Newlist = lists:reverse(Card_num),
    [Check_digit | Digits] = Newlist,
    digit_process(Digits, Check_digit).

  digit_process(Digits, Check_digit) ->
    [First_Digit | Digit_list] = Digits,
    Digit1 = First_Digit * 2,
    [Second_Digit | More_digits] = Digit_list,
    Digit2 = Second_Digit * 1,
    [Third_Digit | More_digits2] = More_digits,
    Digit3 = Third_Digit * 2,
    [Fourth_Digit | More_digits3] = More_digits2,
    Digit4 = Fourth_Digit * 1,
    [Fifth_Digit | More_digits4] = More_digits3,
    Digit5 = Fifth_Digit * 2,
    [Sixth_Digit | More_digits5] = More_digits4,
    Digit6 = Sixth_Digit * 1,
    [Seventh_Digit | More_digits6] = More_digits5,
    Digit7 = Seventh_Digit * 2,
    [Eighth_Digit | More_digits7] = More_digits6,
    Digit8 = Eighth_Digit * 1,
    [Ninth_Digit | More_digits8] = More_digits7,
    Digit9 = Ninth_Digit * 2,
    [Tenth_Digit | More_digits9] = More_digits8,
    Digit10 = Tenth_Digit * 1,
    [Eleventh_Digit | More_digits10] = More_digits9,
    Digit11 = Eleventh_Digit * 2,
    [Twelve_Digit | More_digits11] = More_digits10,
    Digit12 = Twelve_Digit * 1,
    [Thirteenth_Digit | More_digits12] = More_digits11,
    Digit13 = Thirteenth_Digit * 2,
    [Fourteenth_Digit | More_digits13] = More_digits12,
    Digit14 = Fourteenth_Digit * 1,
    [Fifthteenth_Digit | _More_digits14] = More_digits13,
    Digit15 = Fifthteenth_Digit * 2,
    All_Digits =
    [if Digit1 > 9 ->
          Breakdown = Digit1 - 9,
          Final1 = single_digits(Breakdown),
          Final1;
       true ->
          Final1 = single_digits(Digit1),
          Final1
    end,
    if Digit2 > 9 ->
          Breakdown = Digit2 - 9,
          Final2 = single_digits1(Breakdown),
          Final2;
       true ->
          Final2 = single_digits1(Digit2),
          Final2
    end,
    if Digit3 > 9 ->
          Breakdown = Digit3 - 9,
          Final3 = single_digits2(Breakdown),
          Final3;
       true ->
          Final3 = single_digits2(Digit3),
          Final3
    end,
    if Digit4 > 9 ->
          Breakdown = Digit4 - 9,
          Final4 = single_digits3(Breakdown),
          Final4;
       true ->
          Final4 = single_digits3(Digit4),
          Final4
    end,
    if Digit5 > 9 ->
          Breakdown = Digit5 - 9,
          Final5 = single_digits4(Breakdown),
          Final5;
       true ->
          Final5 = single_digits4(Digit5),
          Final5
    end,
    if Digit6 > 9 ->
          Breakdown = Digit6 - 9,
          Final6 = single_digits5(Breakdown),
          Final6;
       true ->
          Final6 = single_digits5(Digit6),
          Final6
    end,
    if Digit7 > 9 ->
          Breakdown = Digit7 - 9,
          Final7 = single_digits6(Breakdown),
          Final7;
       true ->
          Final7 = single_digits6(Digit7),
          Final7
    end,
    if Digit8 > 9 ->
          Breakdown = Digit8 - 9,
          Final8 = single_digits7(Breakdown),
          Final8;
       true ->
          Final8 = single_digits7(Digit8),
          Final8
    end,
    if Digit9 > 9 ->
          Breakdown = Digit9 - 9,
          Final9 = single_digits8(Breakdown),
          Final9;
       true ->
          Final9 = single_digits8(Digit9),
          Final9
    end,
    if Digit10 > 9 ->
          Breakdown = Digit10 - 9,
          Final10 = single_digits9(Breakdown),
          Final10;
       true ->
          Final10 = single_digits9(Digit10),
          Final10
    end,
    if Digit11 > 9 ->
          Breakdown = Digit11 - 9,
          Final11 = single_digits10(Breakdown),
          Final11;
       true ->
          Final11 = single_digits10(Digit11),
          Final11
    end,
    if Digit12 > 9 ->
          Breakdown = Digit12 - 9,
          Final12 = single_digits11(Breakdown),
          Final12;
       true ->
          Final12 = single_digits11(Digit12),
          Final12
    end,
    if Digit13 > 9 ->
          Breakdown = Digit13 - 9,
          Final13 = single_digits12(Breakdown),
          Final13;
       true ->
          Final13 = single_digits12(Digit13),
          Final13
    end,
    if Digit14 > 9 ->
          Breakdown = Digit14 - 9,
          Final14 = single_digits13(Breakdown),
          Final14;
       true ->
          Final14 = single_digits13(Digit14),
          Final14
    end,
    if Digit15 > 9 ->
          Breakdown = Digit15 - 9,
          Final15 = single_digits14(Breakdown),
          Final15;
       true ->
          Final15 = single_digits14(Digit15),
          Final15
    end],
    sum_all_digits(All_Digits, Check_digit).

  single_digits(Digit1) ->
    Digit1.
  single_digits1(Digit2) ->
    Digit2.
  single_digits2(Digit3) ->
    Digit3.
  single_digits3(Digit4) ->
    Digit4.
  single_digits4(Digit5) ->
    Digit5.
  single_digits5(Digit6) ->
    Digit6.
  single_digits6(Digit7) ->
    Digit7.
  single_digits7(Digit8) ->
    Digit8.
  single_digits8(Digit9) ->
    Digit9.
  single_digits9(Digit10) ->
    Digit10.
  single_digits10(Digit11) ->
    Digit11.
  single_digits11(Digit12) ->
    Digit12.
  single_digits12(Digit13) ->
    Digit13.
  single_digits13(Digit14) ->
    Digit14.
  single_digits14(Digit15) ->
    Digit15.



  sum_all_digits(All_Digits, Check_digit) ->
          Sum = lists:sum(All_Digits),
          Final_digit = Sum * 9,
          compare_sum_to_check_digit(Final_digit, Check_digit).

  compare_sum_to_check_digit(Final_digit, Check_digit) ->
    String = integer_to_list(Final_digit),
    Num = string:substr(String, 3),
    Integer = list_to_integer(Num),
    if Integer =:= Check_digit ->
           "This credit card number is valid";
       true ->
           "this credit card number is not valid"
    end.

tokenization(Hash) ->
   Full_Name = sole_api:first_name() ++ " " ++ sole_api:last_name(),
   mnesia:create_table(token, [{attributes, record_info(fields, token)}]),

   F = fun() ->
   mnesia:write(
   #token{ name = Full_Name, hashed_token = Hash })
   end,

   mnesia:transaction(F).


reference_token() ->
   Data = mnesia:transaction( fun() -> mnesia:read(token, sole_api:first_name() ++ " " ++ sole_api:last_name()) end),
   Table = element(2, Data),
   New_tuple = lists:last(Table),
   Value = element(3, New_tuple),
   lists:last(Value).

reference_token(String) ->
   Data = mnesia:transaction( fun() -> mnesia:read(token, String) end),
   Table = element(2, Data),
   New_tuple = lists:last(Table),
   Value = element(3, New_tuple),
   lists:last(Value).

get_token(Port) ->
  Pid = spawn_link(fun() ->
      {ok, Listen} = gen_tcp:listen(Port, [binary, {active, false}]),
      spawn(fun() -> accepting(Listen) end),
      timer:sleep(infinity)
  end),
  {ok, Pid}.

accepting(ListenSocket) ->
  {ok, Socket} = gen_tcp:accept(ListenSocket),
  spawn(fun() -> accepting(ListenSocket) end),
  handling(Socket).


handling(Socket) ->
  inet:setopts(Socket, [{active, once}]),
  receive
      {tcp, Socket, []} ->
             gen_tcp:send(Socket, []);
      {tcp, Socket, Msg} ->
             tokenization(Msg),
             handling(Socket)
  end.

delete_token() ->
   mnesia:delete_table(token).

check_to_see_if_token_exists() ->
   ID = sole_api:first_name() ++ "_" ++ sole_api:last_name(),
   Tuple = mnesia:transaction( fun() -> mnesia:read(token, sole_api:first_name() ++ " " ++ sole_api:last_name()) end),
   if Tuple == {aborted, {no_exists, token}} ->
                    {ehtml, []};
            true ->
                    {ehtml, {p, [{class, 'paragraph'}, {id, ID}, {style, 'color: #F5A9F2'}], reference_token()}}
            end.

check_to_see_if_token_exists(Hash) ->
   String = string:substr(Hash, 65, $0),
   Extract = string:substr(Hash, 1, 64),
   Tuple = mnesia:transaction( fun() -> mnesia:read(token, String) end),
   if Tuple == {aborted, {no_exists, token}} ->
                    {ehtml, []};
           true ->
                    {ehtml, {p, [{class, 'paragraph'}, {id, Extract ++ String ++ "video"}, {style, 'color: #F5A9F2'}], reference_token()}}
           end.

from_hash_to_value(Hash) ->
   String = string:sub_string(Hash, 65, $0),
   Tuple = mnesia:transaction( fun() -> mnesia:read(token, String) end),
   if Tuple == {aborted, {no_exists, token}} ->
                     ok;
            true ->
                     {ok, Socket} = gen_tcp:connect(sole_api:local_ip_v4(), 5222, []),
                     gen_tcp:send(Socket, reference_token(String))
   end.

post_time(Hash) ->
   Time = sole_bitcoin_hashes:tell_time() ++ " " ++ "on" ++ " " ++ sole_bitcoin_hashes:give_date(),
   mnesia:create_table(posted_time, [{attributes, record_info(fields, posted_time)}]),

   F = fun() ->
   mnesia:write(
   #posted_time{ file = Hash, time_posted = Time })
   end,

   mnesia:transaction(F).

what_time_posted(Hash) ->
   Tuple = mnesia:transaction( fun() -> mnesia:read(posted_time, Hash) end),
   Table = element(2, Tuple),
   New_tuple = lists:last(Table),
   element(3, New_tuple).

was_time_posted(Hash) ->
   Tuple = mnesia:transaction( fun() -> mnesia:read(posted_time, Hash) end),
   if Tuple == {aborted, {no_exists, posted_time}} ->
                   {ehtml, []};
             true ->
                   {ehtml, {p, [{class, 'paragraph'}, {style, "color: purple"}], sole_api:what_time_posted(Hash)}}
             end.

tell_time() ->
   sole_bitcoin_hashes:tell_time() ++ " " ++ "on" ++ " " ++ sole_bitcoin_hashes:give_date().

tell_time_html() ->
   {ehtml, {p, [{class, 'paragraph'}, {style, "color: purple"}], sole_api:tell_time()}}.

usd_exchange(Amount) ->
   file:write_file("btc_to_usd.txt", ["1 BTC = ", Amount, "USD"]).

multimedia_dir() ->
   file:make_dir("Uploads"),
   file:make_dir("multimedia").


store_media() ->
   file:rename("Uploadsvideo.mp4", "multimedia/video.mp4").


store_media_image(File) ->
      file:write_file("photo.png", [File]).


username(Text) ->
   file:write_file(sole_api:first_name() ++ "username.txt", [Text]).

username() ->
   Read = file:read_file(sole_api:first_name() ++ "username.txt"),
   Extract = element(2, Read),
   Convert = binary:bin_to_list(Extract),
   Convert.

caption(Text) ->
   file:write_file("caption.txt", [Text]).

caption() ->
   Read = file:read_file("caption.txt"),
   Extract = element(2, Read),
   Convert = binary:bin_to_list(Extract),
   Convert.

caption_post(Text) ->
  file:write_file("caption_post.txt", [Text]).

caption_post() ->
  Read = file:read_file("caption_post.txt"),
  Extract = element(2, Read),
  Convert = binary:bin_to_list(Extract),
  Convert.

deleting_files() ->
   file:delete("Uploadsangry.jpeg"),
   file:delete("Uploadspoker_face.jpeg"),
   file:delete("Uploadssmile.jpeg").

moving_profile_photo() ->
   Name = sole_api:first_name(),
   file:rename(Name ++ "profile.png", "Uploads/" ++ Name ++ "_profile.png").


change_file_name(File) ->
   Uploads = "Uploads" ++ File,
   static_file(Uploads).

check_file(Filename) ->
     H = filelib:is_regular(Filename),
     if H == true ->
          files(Filename);
        true ->
          {error, enoent}
     end.


files(Filename) ->
   Extension = filename:extension(Filename),
      if Extension == ".jpeg" -> static_file(Filename);
         Extension == ".png" -> static_file(Filename);
         Extension == ".mp3" -> static_file(Filename);
         Extension == ".m4a" -> static_file(Filename)
      end.

static_file(Filename) ->
   Dir = string:substr(Filename, 1, 7),
   if Dir == "Uploads" ->
         File = string:substr(Filename, 8, $0),
         static_file(Dir, File);
      true ->
         {error, Filename}
end.

static_file(Dir, File) ->
        file:rename(Dir ++ File, sole_api:last_name() ++ "photo.png").

change_file_name2(File) ->
    Uploads = "Uploads" ++ File,
    static_file2(Uploads).

static_file2(Filename) ->
    Dir = string:substr(Filename, 1, 7),
    if Dir == "Uploads" ->
          File = string:substr(Filename, 8, $0),
          static_file2(Dir, File);
      true ->
          {error, Filename}
end.

static_file2(Dir, File) ->
        file:rename(Dir ++ File, last_name() ++ "video.mp4").


change_file_name3(File) ->
    Uploads = "Uploads" ++ File,
    static_file3(Uploads).

static_file3(Filename) ->
    Dir = string:substr(Filename, 1, 7),
    if Dir == "Uploads" ->
          File = string:substr(Filename, 8, $0),
          static_file3(Dir, File);
      true ->
          {error, Filename}
end.

static_file3(Dir, File) ->
        file:rename(Dir ++ File, sole_api:phone_number() ++ "live_video.mp4").

send_file_type(Filename) ->
      Extension = filename:extension(Filename),
          if Extension == ".jpeg" -> file:write_file("file_type.txt", ["image"]);
             Extension == ".png" -> file:write_file("file_type.txt", ["image"]);
             Extension == ".mp3" -> file:write_file("file_type.txt", ["audio"]);
             Extension == ".m4a" -> file:write_file("file_type.txt", ["audio"]);
             Extension == ".mp4" -> file:write_file("file_type.txt", ["video"])
        end.

read_file_type() ->
        {ok, F} = file:open(sole_api:first_name() ++ "file_type.txt", [read]),
        G = file:pread(F, 0, $0),
        H = element(2, G),
        H.

check_file() ->
        filelib:is_file(sole_api:first_name() ++ "file_type.txt").

video() ->
        file:write_file(sole_api:first_name() ++ "file_type.txt", ["video"]).

rename_video_file() ->
        file:rename("Uploadsblob", sole_api:last_name() ++ "video.mp4").

rename_image_file() ->
        file:rename("Uploadsblob", sole_api:last_name() ++ "photo.png").

process_stream() ->
        file:write_file(sole_api:first_name() ++ "file_type.txt", ["live_stream"]).

delete_stream() ->
        file:write_file(sole_api:first_name() ++ "file_type.txt", [" "]).

store_Bitcoin_password(String) ->
        file:write_file("b_pass.txt", [String]),
        read_b_pass().

read_b_pass() ->
        {ok, Bpass} = file:open("b_pass.txt", [read]),
        String = file:pread(Bpass, 0, $0),
        Extract_S = element(2, String),
        sole_BTC_wallet:create_wallet(Extract_S),
        delete_b_pass().

delete_b_pass() ->
        file:delete("b_pass.txt").



bitcoin_network_directory() ->
       file:make_dir("bitcoin_network_directory").



recording_jabber_ids() ->
       {ok, File} = file:open("roster.txt", [write, append]),
       Usersid = sole_api:generate_user_jabber_id(),
       io:format(File, "~s, ", [Usersid]).

available() ->
      {ok, File} = file:open("presence.txt", [write]),
      io:format(File, "~s~n", ["available"]).

non_available() ->
      {ok, File} = file:open("presence.txt", [write]),
      io:format(File, "~s~n", ["non_available"]).

know_presence() ->
      {ok, File} = file:open("presence.txt", [read]),
      Present_state = file:pread(File, 0, $0),
      Availability = element(2, Present_state),
      Availability.

message_self(_Arg) ->
      [{redirect, "/message_self.yaws"}].
message_others(_Arg) ->
      [{redirect, "/message_others.yaws"}].

newsfeed_log_image() ->
      Filename = sole_api:last_name() ++ "photo.png",
      H = filelib:is_regular(Filename),
      if H == true ->
          show_image(Filename);
        true ->
          ignore([])
      end.

newsfeed_log_video() ->
      Filename = sole_api:last_name() ++ "video.mp4",
      sole_api:post_time(Filename),
      H = filelib:is_regular(Filename),
      if H == true ->
          show_video(Filename);
        true ->
          ignore([])
      end.

show_image(_Arg) ->
   [sole_profile:out([]), sole_socialID:out([]), image([]), sole_comment:comment([]), sole_br:space([])].

show_video(Arg) ->
   [sole_profile:out([]), sole_socialID:out([]), video(Arg), sole_api:was_time_posted(Arg), sole_comment:comment(Arg), sole_br:space([])].

image(_Arg) ->
   File = sole_api:last_name() ++ "photo.png",
   {ehtml, {center, [], [{a, [{href, "#"}, {onclick, "return false;"}],
   [{'div', [{align, "right"}, {class, "stream"}, {onload, "err();"}, {style, "background-color:#101010;height:900px; border-radius: 0;"}], [{embed, [{id, "multimedia"}], [{img, [{src, File}, {style, "width: 100%; height: 100%;"}]}]}]}]}]}}.

video(Arg) ->
   File = Arg,
   {html, "<div class='container'>
            <div class='c-video'>
            <video class='video' style='width: 100%; height: 100%;' src=" ++ File ++ "></video>
            <div class='controls'>
            <div class='orange-bar'><div class='orange-juice'></div></div><div class='buttons'><button id='play-pause'></button></div>
            </div>
            </div>
            </div>"}.

ignore(_Arg) ->
   {ehtml, []}.

%% The below functions are for sending likes
%% Disregard these functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

likes_page() ->
   file:write_file(sole_api:phone_number() ++ "likes.txt", ["0"]).

likes(Number) ->
   if Number == 0 ->
         Add = Number + 1,
         file:write_file(sole_api:phone_number() ++ "likes.txt", [integer_to_list(Add)]);
      true ->
         Add = Number + 1,
         file:write_file(sole_api:phone_number() ++ "likes.txt", [integer_to_list(Add)])
   end.

how_many_likes() ->
   Read = file:read_file(sole_api:phone_number() ++ "likes.txt"),
   Extract = element(2, Read),
   binary:bin_to_list(Extract).


likes_for_each_post() ->
   file:write_file(sole_api:phone_number() ++ "each_post_count.txt", ["0"]).

likes_for_post(Number) ->
   if Number == 0 ->
         Add = Number + 1,
         file:write_file(sole_api:phone_number() ++ "each_post_count.txt", [integer_to_list(Add)]);
      true ->
         Add = Number + 1,
         file:write_file(sole_api:phone_number() ++ "each_post_count.txt", [integer_to_list(Add)])
   end.

like_count_for_post() ->
   Read = file:read_file(sole_api:phone_number() ++ "each_post_count.txt"),
   Extract = element(2, Read),
   binary:bin_to_list(Extract).



verify_page() ->
  file:write_file(sole_api:last_name() ++ "verify.txt", ["0"]).

verify_like(Number) ->
  if Number == 0 ->
        Add = Number + 1,
        file:write_file(sole_api:last_name() ++ "verify.txt", [integer_to_list(Add)]);
      true ->
        Add = Number + 1,
        file:write_file(sole_api:last_name() ++ "verify.txt", [integer_to_list(Add)])
  end.

read_number_of_visits() ->
  Read = file:read_file(sole_api:last_name() ++ "verify.txt"),
  Extract = element(2, Read),
  Num = binary:bin_to_list(Extract),
  like_auth(Num).

like_auth(Num) ->
 Number = list_to_integer(Num),
 if Number >= 1 ->
       [{redirect, "/commercial.yaws"}];
    true ->
       [{redirect, "/likes_count.yaws"}]
 end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Disregard the above functions

count_number_of_posts() ->
  file:write_file(sole_api:phone_number() ++ "number_of_posts.txt", ["0"]).


number_of_posts(Number) ->
  if Number == 0 ->
        Add = Number + 1,
        file:write_file(sole_api:phone_number() ++ "number_of_posts.txt", [integer_to_list(Add)]),
        hash_post(integer_to_list(Add));
      true ->
        Add = Number + 1,
        file:write_file(sole_api:phone_number() ++ "number_of_posts.txt", [integer_to_list(Add)]),
        hash_post(integer_to_list(Add))
  end.

how_many_posts() ->
    Read = file:read_file(sole_api:phone_number() ++ "number_of_posts.txt"),
    Extract = element(2, Read),
    binary:bin_to_list(Extract).

extract_number_of_posts() ->
    Read = file:read_file(sole_api:phone_number() ++ "number_of_posts.txt"),
    Extract = element(2, Read),
    Number = binary:bin_to_list(Extract),
    number_of_posts(list_to_integer(Number)).

count_number_of_posts2() ->
  file:write_file(sole_api:phone_number() ++ "posts.txt", ["0"]).

number_of_posts2(Number) ->
  if Number == 0 ->
        Add = Number + 1,
        file:write_file(sole_api:phone_number() ++ "posts.txt", [integer_to_list(Add)]),
        hash_post2(integer_to_list(Add));
      true ->
        Add = Number + 1,
        file:write_file(sole_api:phone_number() ++ "posts.txt", [integer_to_list(Add)]),
        hash_post2(integer_to_list(Add))
  end.

how_many_posts2() ->
    Read = file:read_file(sole_api:phone_number() ++ "posts.txt"),
    Extract = element(2, Read),
    binary:bin_to_list(Extract).

extract_number_of_posts2() ->
    Read = file:read_file(sole_api:phone_number() ++ "posts.txt"),
    Extract = element(2, Read),
    Number = binary:bin_to_list(Extract),
    number_of_posts(list_to_integer(Number)).

%% Functions that becomes part of the video news feed algorithm

records_of_videos_on_a_file() ->
  file:write_file("all_" ++ sole_api:first_name() ++ "_videos.txt", []).

hash_post(Value) ->
  file:copy(sole_api:last_name() ++ "video.mp4", sole_api:hash_256_A(last_name() ++ Value) ++ "video.mp4"),
  {ok, Videos} = file:open("all_" ++ sole_api:first_name() ++ "_videos.txt", [write, append]),
  io:format(Videos, "~s", [sole_api:hash_256_A(last_name() ++ Value) ++ "video.mp4\n"]),
  sole_api:post_time(lists:last(sole_api:hash_256_A(sole_api:last_name() ++ Value)) ++ "video.mp4").

%% Disregard the below functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

display_hash_post() ->
  Read = file:read_file(sole_api:phone_number() ++ "number_of_posts.txt"),
  Extract = element(2, Read),
  Number = binary:bin_to_list(Extract),
  [H|_T] = [sole_api:hash_256_A(last_name() ++ Number), "video.mp4"],
  File = lists:last(H) ++ "video.mp4",
  generate_media_file_of_files(),
  write_file_to_file(File).

write_file_to_file(File) ->
  {ok, IoDevice} = file:open("media_file_storage.html", [write, append]),
  io:format(IoDevice, "~s ", ["<video src=" ++ File ++ "  autoplay controls preload='true'></video>\n"]).

generate_media_file_of_files() ->
  {ok, IoDevice} = file:open("media_file_storage.html", [write, read]),
  io:format(IoDevice, "~s ", ["<!DOCTYPE html>
  <html>
  <head>
  <title>your-posts</title>
  <meta charset='UTF-8'>
  <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
  </head>
  <body>\n"]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Disregard the above functions

delete_previous_file() ->
  file:delete(sole_api:last_name() ++ "video.mp4").

if_this_file_exist_delete() ->
  A = filelib:is_regular(sole_api:last_name() ++ "video.mp4"),
  if A == true ->
         sole_api:delete_previous_file();
      true ->
         {ehtml,[]}
  end.

check_for_posted_files() ->
  A = filelib:is_regular(sole_api:last_name() ++ "video.mp4"),
  if A == true ->
         extract_number_of_posts();
      true ->
         {ehtml, []}
  end.

show_hashed_file() ->
  A = filelib:is_regular(sole_api:last_name() ++ "video.mp4"),
  if A == true ->
         num_po();
     true ->
         {ehtml, []}
  end.

num_po() ->
  Read = file:read_file(sole_api:phone_number() ++ "number_of_posts.txt"),
  Extract = element(2, Read),
  Number = binary:bin_to_list(Extract),
  sole_api:hash_256_A(last_name() ++ Number) ++ "video.mp4".


new_post_old_post() ->
  Read = file:read_file(sole_api:phone_number() ++ "number_of_posts.txt"),
  Extract = element(2, Read),
  Bin_String = binary:bin_to_list(Extract),
  Number = list_to_integer(Bin_String),
  if Number >= 1 ->
          Source = file:read_file("all_" ++ sole_api:first_name() ++ "_videos.txt"),
          E = element(2, Source),
          B = binary:bin_to_list(E),
          K = string:tokens(B, "\n"),
          G = length(K),
          next_post(K, G);
     true ->
          {ehtml, []}
  end.

next_post(K, G) ->
  if G >= 1 ->
         countdown(K, G);
      true ->
         ehtml([])
  end.

ehtml([]) ->
  {ehtml, []}.


countdown(List, Limit) when Limit > 1 ->
  [
  sole_api:show_video(lists:nth(Limit, List)),
  countdown(List, Limit - 1)];

countdown(List, Limit) ->
  sole_api:show_video(lists:nth(Limit, List)).



if_upload() ->
  A = filelib:is_regular("Uploadsblob"),
  if A == true ->
         sole_api:rename_video_file();
      true ->
         {ehtml, []}
  end.

first_post() ->
  file:write_file(sole_api:phone_number() ++ "number_of_posts.txt", ["0"]).



lets_see_if_first_post_exist() ->
  A = filelib:is_regular(sole_api:last_name() ++ "video.mp4"),
     if A == true ->
                sole_api:first_post();
          true ->
                {ehtml, []}
     end.

image() ->
  file:write_file(sole_api:first_name() ++ "file_type.txt", ["image"]).

uploads_file() ->
  Directory = file:list_dir("multimedia"),
  Get_files = element(2, Directory),
  Get_file = lists:nth(1, Get_files),
  change_uploaded_video(Get_file).

change_uploaded_video(String) ->
  Extension = filename:extension(String),
  if Extension == ".mp4" ->
            rename_the_file(String);
        true ->
            {ehtml, {p, [], "this is the wrong file"}}
  end.

rename_the_file(String) ->
  file:rename("multimedia/" ++ String, sole_api:last_name() ++ "video.mp4").

read_all_videos_file() ->
  File = file:read_file("all_" ++ sole_api:first_name() ++ "_videos.txt"),
  Get_data = element(2, File),
  Interpret_data = binary:bin_to_list(Get_data),
  if Interpret_data == "" ->
           sole_api:first_post();
        true ->
           sole_api:new_post_old_post()
  end.

%% Functions that becomes part of the photo news feed algorithm
%% Disregard these functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

records_of_photos_on_a_file() ->
  file:write_file("all_photos.txt", []).

hash_post2(Value) ->
  file:copy(sole_api:last_name() ++ "photo.png", sole_api:hash_256_A(last_name() ++ Value) ++ "photo.png"),
  {ok, Photos} = file:open("all_photos.txt", [write, append]),
  io:format(Photos, "~s", [sole_api:hash_256_A(last_name() ++ Value) ++ "photo.png\n"]).

display_hash_post2() ->
  Read = file:read_file(sole_api:phone_number() ++ "posts.txt"),
  Extract = element(2, Read),
  Number = binary:bin_to_list(Extract),
  [H|_T] = [sole_api:hash_256_A(last_name() ++ Number), "photo.png"],
  File = lists:last(H) ++ "photo.png",
  generate_media_file_of_files2(),
  write_file_to_file2(File).

write_file_to_file2(File) ->
  {ok, IoDevice} = file:open("media_files.html", [write, append]),
  io:format(IoDevice, "~s ", ["<img src=" ++ File ++ "></img>\n"]).

generate_media_file_of_files2() ->
  {ok, IoDevice} = file:open("media_files.html", [write, read]),
  io:format(IoDevice, "~s ", ["<!DOCTYPE html>
  <html>
  <head>
  <title>your-posts</title>
  <meta charset='UTF-8'>
  <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
  </head>
  <body>\n"]).

delete_previous_file2() ->
  file:delete(sole_api:last_name() ++ "photo.png").

if_this_file_exist_delete2() ->
  A = filelib:is_regular(sole_api:last_name() ++ "photo.png"),
  if A == true ->
         sole_api:delete_previous_file2();
      true ->
         {ehtml,[]}
  end.

check_for_posted_files2() ->
  A = filelib:is_regular(sole_api:last_name() ++ "photo.png"),
  if A == true ->
         extract_number_of_posts2();
      true ->
         {ehtml, []}
  end.

show_hashed_file2() ->
  A = filelib:is_regular(sole_api:last_name() ++ "photo.png"),
  if A == true ->
         num_po2();
     true ->
         {ehtml, []}
  end.

num_po2() ->
  Read = file:read_file(sole_api:phone_number() ++ "number_of_posts.txt"),
  Extract = element(2, Read),
  Number = binary:bin_to_list(Extract),
  sole_api:hash_256_A(last_name() ++ Number) ++ "photo.png".


new_post_old_post2() ->
  Read = file:read_file(sole_api:phone_number() ++ "number_of_posts.txt"),
  Extract = element(2, Read),
  Bin_String = binary:bin_to_list(Extract),
  Number = list_to_integer(Bin_String),
  if Number >= 1 ->
          Source = file:read_file("all_photos.txt"),
          E = element(2, Source),
          B = binary:bin_to_list(E),
          K = string:tokens(B, "\n"),
          G = length(K),
          next_post2(K, G);
     true ->
          {ehtml, []}
  end.

next_post2(K, G) ->
  if G > 1 ->
         countdown2(K, G);
      true ->
         ehtml2([])
  end.

ehtml2([]) ->
  {ehtml, []}.


countdown2(List, Limit) when Limit > 1 ->
  [
  sole_api:show_image(lists:nth(Limit, List)),
  countdown2(List, Limit - 1)];

countdown2(List, Limit) ->
  sole_api:show_image(lists:nth(Limit, List)).



if_upload2() ->
  A = filelib:is_regular("Uploadsblob"),
  if A == true ->
         sole_api:rename_image_file();
      true ->
         {ehtml, []}
  end.

first_post2() ->
  file:write_file(sole_api:phone_number() ++ "posts.txt", ["1"]).



lets_see_if_first_post_exist2() ->
  A = filelib:is_regular(sole_api:last_name() ++ "photo.png"),
     if A == true ->
                sole_api:first_post2();
          true ->
                {ehtml, []}
     end.

video_media() ->
  file:write_file(sole_api:first_name() ++ "file_type.txt", ["video"]).

uploads_file2() ->
  Directory = file:list_dir("multimedia"),
  Get_files = element(2, Directory),
  Get_file = lists:nth(1, Get_files),
  change_uploaded_photo(Get_file).

change_uploaded_photo(String) ->
  Extension = filename:extension(String),
  if Extension == ".jpeg" ->
            rename_the_file2(String);
        true ->
            io:format("this is the wrong file")
  end,
  if Extension == ".png" ->
            rename_the_file2(String);
        true ->
            io:format("this is the wrong file")
  end.

rename_the_file2(String) ->
  file:rename("multimedia/" ++ String, sole_api:last_name() ++ "photo.png").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Disregard the above functions


no_media() ->
  file:write_file(sole_api:first_name() ++ "file_type.txt", [" "]).


file_must_exists() ->
  File = filelib:is_regular(sole_api:first_name() ++ "file_type.txt"),
  if File == true ->
         sole_api:newsfeed_log_video();
     true ->
         error()
  end.

  error() ->
    {ehtml, {center, [], {'div', [{class, "pop_up"}, {style, "display: block; position: relative; top: 675px;"}], {p, [{class, paragraph}, {style, "color: #101010; width: 300px;"}], "You have no content yet"}}}}.
