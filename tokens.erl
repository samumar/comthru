-module(tokens).

-record(transaction_id, {email, connected_account}).

%% Export for websocket callbacks
-export([handle_message/1, say_hi/1]).

%% Export for financial transactions
-export([payout/0]).
-export([generate_account/4]).
-export([transfer_funds/1]).
-export([pass_ehtml/2]).
-export([email_to_token/2]).
-export([email_to_token/1]).
-export([does_email_have_account/2]).
-export([does_email_have_account/1]).
-export([user_id_reference/1]).

handle_message({text, Message}) ->
    io:format("~p:~p tokens got ~p~n",
          [?MODULE, ?LINE, Message]),
          collect_and_send(Message),
    {reply, {text, <<Message/binary>>}}.

collect_and_send(Message) ->
    payout(),
    Get_ID = does_email_have_account(Message),
    transfer_funds(Get_ID).

say_hi(Pid) ->
    io:format("asynchronous greeting~n", []),
    yaws_api:websocket_send(Pid, {text, <<"say hi">>}).

payout() ->
  Url = "curl https://api.stripe.com/v1/payouts ",
  SKey = "-u sk_test_51MdNP0BgUxqa83hRfRXoQIs5vwTXGedFJQ4EstS89QVxmM08ot3T3vF8JPONbrYicClIxOjWrySsl8hl3dpP49Su00sx5fDhoP: ",
  Fee = "-d amount=100 ",
  Currency = " -d currency=usd",
  os:cmd([Url, SKey, Fee, Currency]).

generate_account(Address, Card_num, Expir, Sec) ->
  URL = "curl https://api.stripe.com/v1/accounts ",
  SKey = "-u sk_test_51MdNP0BgUxqa83hRfRXoQIs5vwTXGedFJQ4EstS89QVxmM08ot3T3vF8JPONbrYicClIxOjWrySsl8hl3dpP49Su00sx5fDhoP: ",
  Account = "-d type=custom ",
  Country = "-d country=US ",
  Email = "-d email=" ++ Address,
  C = "-d card_number=" ++ Card_num,
  Ex = "-d expiration_date=" ++ Expir,
  S = "-d security_code=" ++ Sec,
  Pay = "-d capabilities[card_payments][requested]=true ",
  Transfer = "-d capabilities[transfers][requested]=true",
  mnesia:create_table(transaction_id, [{attributes, record_info(fields, transaction_id)}]),
  Connect = os:cmd([URL, SKey, Account, Country, Email, C, Ex, S, Pay, Transfer]),

  Connected_Account = fun() ->
  mnesia:write(
  #transaction_id{ email = Address, connected_account = Connect})
  end,

  mnesia:transaction(Connected_Account).

transfer_funds(Destiny) ->
  URL = "curl https://api.stripe.com/v1/transfers ",
  SKey = "-u sk_test_51MdNP0BgUxqa83hRfRXoQIs5vwTXGedFJQ4EstS89QVxmM08ot3T3vF8JPONbrYicClIxOjWrySsl8hl3dpP49Su00sx5fDhoP: ",
  Amount = "-d amount=095 ",
  Currency = "-d currency=usd ",
  User = "-d destination=" ++ Destiny ++ "",
  T = "-d transfer_group=ORDER_95",
  os:cmd([URL, SKey, Amount, Currency, User, T]).

pass_ehtml(String, Email) ->
  {ehtml, {p, [{id, "t" ++ String ++ "token"}, {style, "color: #F5A9F2;"}], Email}}.

email_to_token(String, Email) ->
  does_email_have_account(String, Email).

email_to_token(Email) ->
  does_email_have_account(Email).

does_email_have_account(String, Email) ->
  Tuple = mnesia:transaction( fun() -> mnesia:read( transaction_id, Email) end),
  if Tuple == {aborted, {no_exists, transaction_id}} ->
                                {ehtml, []};
                        true ->
                                {ehtml, {p, [{id, "t" ++ String ++ "token"}, {style, "color: #F5A9F2;"}], user_id_reference(Email)}}
  end.

does_email_have_account(Email) ->
  Tuple = mnesia:transaction( fun() -> mnesia:read( transaction_id, Email) end),
  if Tuple == {aborted, {no_exists, transaction_id}} ->
                                [];
                        true ->
                                user_id_reference(Email)
  end.

user_id_reference(Address) ->
  Account = mnesia:transaction( fun() -> mnesia:read(transaction_id, Address) end),
  Table = element(2, Account),
  New_tuple = lists:last(Table),
  E = element(3, New_tuple),
  string:substr(E, 487, 21).
  %%transfer_funds(ID).
