-module(sole_comment).
%%-define(TOKEN, sole_api:check_to_see_if_token_exists()).
-export([share_content/1]).
-export([comment/1]).
-export([share/1]).

share_content(Arg) ->
{html, "<table><td width='100%'><div class='pop_up' style='display: block; width: 65px; height: 65px; border-radius: 50%;'><center><br><img src='images_folder/share.png' onclick='display" ++ Arg ++ "()' width='24px;' height='24px;'></center></div></td><td>" ++ share(Arg) ++ "</td></table>"}.

comment(Arg) ->
User = sole_api:uppercase_to_lowercase(sole_api:first_name()),
Rootname = filename:rootname(Arg),
TOKEN = tokens:pass_ehtml(Rootname, sole_api:email()),
[{html, "
<nav>
<table style='width: 50%; height:75px;' id='opinions' align='left'>
<td>
    <div class=pop_up><table><td><p class=paragraph>Follow</p></td><td><form><input value='Send Message' width=5px; style='border-color:#4e57fc;border-width:5px;' ></form></td></table></div></td><td><center><a href=#><img class=" ++ "'good" ++ Rootname ++ "'" ++ "onclick=" ++ "'good" ++ Rootname ++ "();send_photo();' id=" ++ "'" ++ sole_api:first_name() ++ "_" ++ "happy' " ++ "src=images_folder/happy.png width='55px;' height='55px;'></a></center>
</td>
<td>
    <div class=pop_up2><table><td><form><input value='Send Message' width=5px; style='border-color:#4e57fc;border-width:5px;'></form></td></table></div></td><td><center><a href=#><img class=" ++ "'neutral" ++ Rootname ++ "'" ++ "onclick=" ++ "'neutral" ++ Rootname ++ "();send_photo2();' id=" ++ "'" ++ sole_api:first_name() ++ "_" ++ "poker' " ++ "src=images_folder/neutral.png width='55px;' height='55px;'></a></center>
</td>
<td>
    <div class=pop_up3><table><td><p class=paragraph>Unfollow</p></td><td><form ><input value='Send Message' width=5px; style='border-color:#4e57fc;border-width:5px;' ></form></td></table></div></td><td><center><a href=#><img class=" ++ "'bad" ++ Rootname ++ "'" ++ "onclick=" ++ "'bad2" ++ Rootname ++ "();send_photo3();' id=" ++ "'" ++ sole_api:first_name() ++ "_" ++ "angry' " ++ "src=images_folder/angry.png width='55px;' height='55px;'></a></center>
</td>
</table>
</nav>
    <nav>
<div class='size'>
<table id='images' cellpadding='10' cellspacing='' align='right' style='float: right; bottom: 0; position: relative;'>
<td>
<input type='image' id='Happy' onclick='send_receiver_token();' alt='login' align='right'
src='images_folder/good.png' 'width=50px height=50px'>
</td><td><div class=dot><p class='paragragh' id='like_count' style='font-size: 35px; font-family: Open Sans,sans-serif;'></p></div>
</td>
<!--
<td>
<input type='image' id='Neutral' alt='login' align='right'
src='images_folder/okay.png' 'width=50px height=50px'>
</td><td><div class=dots><p class='paragragh' id='neutral_count' style='font-size: 35px; font-family: Open Sans,sans-serif;'></p></div>
</td>
<td>
<input type='image' id='Angry' alt='login' align='right'
src='images_folder/bad.png' 'width=50px height=50px'>
</td><td><div class=doto><p class='paragragh' id='dislike_count' style='font-size: 35px; font-family: Open Sans,sans-serif;'></p></div>
</td>-->
</table>
</div>
</nav>"}, TOKEN, {ehtml, {br, []}}, {ehtml, {br, []}}, {ehtml, {br, []}}, {ehtml, {br, []}}, {ehtml, {br, []}}, {ehtml, {br, []}}, {ehtml, {br, []}}, {ehtml, {br, []}}, share_content(Rootname),
{html, "<script>

var socket" ++ User ++ "_2 = new WebSocket('wss://comthru.com/" ++ User ++ "get_emojis.yaws');
var socket" ++ User ++ "_3 = new WebSocket('wss://comthru.com/" ++ User ++ "get_emojis2.yaws');
var socket" ++ User ++ "_4 = new WebSocket('wss://comthru.com/" ++ User ++ "get_emojis3.yaws');

function good" ++ Rootname ++ "() {
         var good1" ++ Rootname ++ " = document.querySelector(" ++ "'.good" ++ Rootname ++ "'" ++ ");
         good1" ++ Rootname ++ ".src = 'Uploads/" ++ sole_api:first_name() ++ "_cheese.jpeg';
         back_to_neutral" ++ Rootname ++ "();
         back_to_bad" ++ Rootname ++ "();
}
function neutral" ++ Rootname ++ "() {
         var neutral1" ++ Rootname ++ "= document.querySelector(" ++ "'.neutral" ++ Rootname ++ "'" ++ ");
         neutral1" ++ Rootname ++ ".src = 'Uploads/" ++ sole_api:first_name() ++ "_poker.jpeg';
         back_to_good" ++ Rootname ++ "();
         back_to_bad" ++ Rootname ++ "();
}
function bad2" ++ Rootname ++ "() {
         var bad1" ++ Rootname ++ " = document.querySelector(" ++ "'.bad" ++ Rootname ++ "'" ++ ");
         bad1" ++ Rootname ++ ".src = 'Uploads/" ++ sole_api:first_name() ++ "_angry.jpeg';
         back_to_good" ++ Rootname ++ "();
         back_to_neutral" ++ Rootname ++ "();
}

function send_photo () {
         socket" ++ User ++ "_2.send(" ++ "'" ++ sole_api:first_name() ++ "_cheese.jpeg');
}

function send_photo2 () {
         socket" ++ User ++ "_3.send(" ++ "'" ++ sole_api:first_name() ++ "_poker.jpeg');
}

function send_photo3 () {
         socket" ++ User ++ "_4.send(" ++ "'" ++ sole_api:first_name() ++ "_angry.jpeg');
}

function back_to_good" ++ Rootname ++ "() {
         var good = document.querySelector(" ++ "'.good" ++ Rootname ++ "'" ++ ");
         good.src = 'images_folder/happy.png';
}

function back_to_neutral" ++ Rootname ++ "() {
         var neutral = document.querySelector(" ++ "'.neutral" ++ Rootname ++ "'" ++ ");
         neutral.src = 'images_folder/neutral.png';
}

function back_to_bad" ++ Rootname ++ "() {
         var bad = document.querySelector(" ++ "'.bad" ++ Rootname ++ "'" ++ ");
         bad.src = 'images_folder/angry.png';
}
function display" ++ Rootname ++ "() {
  var display = document.querySelector('.window" ++ Rootname ++ "'" ++ ").style.display = 'block';
}

function send_receiver_token() {
  var token = document.getElementById(" ++ "\"" ++ "t" ++ Rootname ++ "token" ++ "\"" ++ ");
  var token2 = document.getElementsByClassName(" ++ "\"" ++ sole_api:first_name() ++ "\"" ++ ");
  if(token)
    socket.send(token.innerHTML);
  else
    console.log('this post will accept likes without owner receiving payment');
}

function send_sender_token() {
  var token2 = document.getElementById(" ++ "\"" ++ sole_api:first_name() ++ "\"" ++ ");
  if(token2)
    socket.send(token2.innerHTML);
  else
    console.log('the user who liked this post will not pay for the like');
}
</script>"}].


share(Arg) ->
"
<div class='window" ++ Arg ++ "'" "style='position : absolute; right: 0; width : 200px; height : 100px; border-radius : 15px; background-color : #fff; display: none;'>
  <table><td width=100%>
  <a href='http://www.facebook.com/sharer/sharer.php?s=100&p%5Btitle%5D=TITLE&p%5Bsummary%5D=DESC&p%5Burl%5D=URL&p%5Bimages%5D%5B0%5D=IMG_PATH' target='_blank' onclick='return Share.me(this);'><img src='images_folder/fb-Logo.jpg' height='80px;' width='110px;'></a>
</td><td>
<a href='https://twitter.com/intent/tweet?original_referer=http%3A%2F%2Ffiddle.jshell.net%2F_display%2F&text=TITLE&url=URL' target='_blank' onclick='return Share.me(this)'><img src='images_folder/Twitter-Logo.png' height='80px;' width='80px;'></a>
</td></table>
</div>".
