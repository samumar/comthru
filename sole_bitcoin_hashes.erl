-module(sole_bitcoin_hashes).

-record(bitcoin_wallet, {private_key,
                         public_key,
                         bitcoin_address,
                         currency_type,
                         amount,
                         transaction_history}).
-define(CURRENCY, "mBTC").
-define(BLOCKCHAIN, blockchain([])).
-export([tell_time/0]).
-export([give_date/0]).
-export([redirect/1]).
-export([merkle_tree/2]).
-export([blockchain/1]).
-export([store_hashes/1]).

tell_time() ->
   Units = erlang:time(),
   Hour = integer_to_list(element(1, Units)),
   Minute = integer_to_list(element(2, Units)),
   Read_Minute = list_to_integer(Minute),
   if Read_Minute < 10 ->
             Hour ++ ":" ++ "0" ++ integer_to_list(Read_Minute);
        true ->
             Hour ++ ":" ++ integer_to_list(Read_Minute)
   end.

give_date() ->
   Calendar = erlang:date(),
   Year = integer_to_list(element(1, Calendar)),
   Month = integer_to_list(element(2, Calendar)),
   Day = integer_to_list(element(3, Calendar)),
   Read_Month = list_to_integer(Month),
   Month_string = show_month(Read_Month),
   Month_string ++ "/" ++ Day ++ "/" ++ Year.

show_month(Read_Month) ->
   case Read_Month of
          1 -> "January";
          2 -> "February";
          3 -> "March";
          4 -> "April";
          5 -> "May";
          6 -> "June";
          7 -> "July";
          8 -> "August";
          9 -> "September";
          10 -> "October";
          11 -> "November";
          12 -> "December"
   end.

redirect(_Arg) ->
   [{redirect, "/index.yaws"}].


merkle_tree(Senders_address, Receivers_address) ->
   Sender = lists:last(sole_api:hash_256_A(Senders_address)),
   Receiver = lists:last(sole_api:hash_256_A(Receivers_address)),
   lists:last(sole_api:hash_256_A(Sender ++ Receiver)).

blockchain(Records) ->
   write_to_log_file(Records).

write_to_log_file(Records) ->
   Time = tell_time() ++ "          " ++ integer_to_list(element(3, erlang:timestamp())) ++ "          " ++ give_date() ++ "          ",
   {ok, Log} = file:open("/Users/mykalmarsh/Desktop/zivweb_app/com/ledger.log", [write, append]),
   io:format(Log, "~s~s~n", [Time, Records]).

store_hashes(Bitcoin) ->
   Private_key = element(1, Bitcoin),
   Public_Key = element(2, Bitcoin),
   Bitcoin_address = element(3, Bitcoin),
   create_wallet(Private_key, Public_Key, Bitcoin_address),
   store(Private_key, Public_Key, Bitcoin_address).

create_wallet(Private_key, Public_Key, Bitcoin_address) ->
   file:write_file("/Users/mykalmarsh/Desktop/zivweb_app/com/" ++ Public_Key ++ ".yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <wallet>
   <bitcoin_address>
   Bitcoin_address: " ++ Bitcoin_address ++
   "</bitcoin_address>
   <bitcoin_public_key>
   Bitcoin_public_key: " ++ Public_Key ++
   "</bitcoin_public_key>
   <bitcoin_private_key>
   Bitcoin_private_key: " ++ Private_key ++
   "</bitcoin_private_key>
   <bitcoin_amount>
   Amount: 0.000mBTC
   </bitcoin_amount>
   <erl>
     out(Arg) ->
     sole_bitcoin_hashes:redirect(Arg).
   </erl>
   </wallet>"]).

store(Private_key, Public_Key, Bitcoin_address) ->
   mnesia:create_schema([node()]),
   mnesia:start(),
   mnesia:create_table(bitcoin_wallet, [{attributes, record_info(fields, bitcoin_wallet)}]),

   BTC = fun() ->
   mnesia:write(
   #bitcoin_wallet{ private_key = Private_key}),
   mnesia:write(
   #bitcoin_wallet{ public_key = Public_Key}),
   mnesia:write(
   #bitcoin_wallet{ bitcoin_address = Bitcoin_address}),
   mnesia:write(
   #bitcoin_wallet{ currency_type = ?CURRENCY}),
   mnesia:write(
   #bitcoin_wallet{ amount = "0.000"}),
   mnesia:write(
   #bitcoin_wallet{ transaction_history = ?BLOCKCHAIN})
   end,

   mnesia:transaction(BTC).
