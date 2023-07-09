-module(sole_file_generator).

-compile(export_all).

launch() ->
   c:lc([sole_api, sole_bitcoin_hashes, sole_br, sole_comment, sole_cookies, sole_profile, sole_socialID, sole_tcp_server, sole_tcp_sup, tokens]),
   mnesia:create_schema([node()]),
   mnesia:start(),
   start().

index() ->
  file:write_file("index.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
   <html>


           <head>
           <title>comthru</title>
           <meta charset='UTF-8'>
           <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
           <link rel='stylesheet' href='index_new.css'>
           </head>
           <body>
             <script type='text/javascript'>
             var values, count=0;

             function startTimeout() {
               values = setTimeout(slow_display, 8000);
             }
             </script>
             <script>
  function play() {
    var audio = new Audio('voice/welcome.m4a');
    audio.play();
  }
  function displayShow() {
              document.getElementById('logins').style.display = 'block';
           }
  function close() {
    var close = document.querySelector('#logins').style.display = 'none';
    var close1 = document.querySelector('.window').style.display = 'none';
  }
  function appear(elm, i, step, speed){
      var t_o;
      //initial opacity
      i = i || 0;
      //opacity increment
      step = step || 5;
      //time waited between two opacity increments in msec
      speed = speed || 50;

      t_o = setInterval(function(){
          //get opacity in decimals
          var opacity = i / 100;
          //set the next opacity step
          i = i + step;
          if(opacity > 1 || opacity < 0){
              clearInterval(t_o);
              //if 1-opaque or 0-transparent, stop
              return;
          }
          //modern browsers
          elm.style.opacity = opacity;
          //older IE
          elm.style.filter = 'alpha(opacity=' + opacity*100 + ')';
      }, speed);
  }
  function slow_display() {
    appear(document.getElementsByTagName('FORM')[0], 0, 5, 40);
    displayShow();
  }
  </script>


  <erl>
    out(Arg) ->
    Welcome = {html, " ++ "\"" ++ "<audio autoplay id=chatbot src=voice/welcome.mp3 type=audio/mpeg preload = auto></audio>" ++ "\"" ++ "}.
  </erl>

           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
                      <center>
                      <erl>
                         out(Arg) ->
                         {html, " ++ "\"" ++ "<div class=small_dot><div class='dot pulse'><br><br><img onclick=play(),startTimeout() src=images_folder/comthru.png width=50% height=50%></div></div>" ++ "\"" ++ "}.
                      </erl>
                      <br>
                      <br>
                      <br>
                      <form>
                      <div id='logins'>
                      <erl>
                        out(Arg) ->
                         {html, " ++ "\"" ++ "<div class=p style=background-color:#4e57fc;line-height:60px><center><a href='sign_up.yaws' style=color:#FFF;background-color:#4e57fc;>sign-up</a></center></div>" ++ "\"" ++ "}.
                      </erl>
                      <br>
                      <div class=p style=background-color:#4e57fc;line-height:60px><center><a href=log-in.yaws style=color:#FFF;>login</a></center></div>
                    </div>
                    <form>
                    </center>

                      </body>
                      <erl module='user_func'>
                        -export([store_mnesia/2]).
                        -export([reference_mnesia/1]).
                        -export([check_to_see_if_user_exists/1]).
                        -record(user_content, {user_name, user_file}).

                        store_mnesia(User, File) ->
                                     mnesia:create_table(user_content, [{attributes, record_info(fields, user_content)}]),

                        UContent = fun() ->
                                     mnesia:write(
                                     #user_content{ user_name = User, user_file = File})
                                     end,

                        mnesia:transaction(UContent).

                        reference_mnesia(User) ->
                                     Data = mnesia:transaction( fun() -> mnesia:read(user_content, User) end),
                                     Table = element(2, Data),
                                     New_tuple = lists:last(Table),
                                     element(3, New_tuple).

                        check_to_see_if_user_exists(User) ->
                                     Tuple = mnesia:transaction( fun() -> mnesia:read(user_content, User) end),
                                     if Tuple == {atomic,[]} ->
                                                    [{redirect, '/user_no_exists.yaws'}];
                                           true ->
                                                    [{redirect, reference_mnesia(User)}]
                                     end.

                        out(Arg) ->
                                     {ehtml, []}.
                        </erl>
   </html>"]),
   file:write_file("index_new.css", ["* {
     margin: 0;
     padding: 0;
   }

   body{background-color:#F5A9F2 no-repeat; background-size:100%}

   @font-face {
     src: url(Open_Sans/OpenSans-Light.ttf);
     font-family: 'Open Sans', sans-serif;

   }
   .p {
     font-size: 25px;
     line-height: 25px;
     font-family: 'Open Sans',sans-serif;
     position: relative;
     background-color: #FFF;
     border-radius: 15px;
     color:#F5A9F2;
     width: 30%;
   }

   .paragraphs {
     font-size: 100%;
     line-height: 100%;
     font-family: 'Open Sans',sans-serif;
     position: relative;
     background-color: #F5A9F2;
     border-radius: 15px;
     color:#FFF;
   }
   .paragraph {
     font-size: 15px;
     line-height: 15px;
     font-family: 'Open Sans',sans-serif;
     position: relative;
     background-color: #F5A9F2;
     border-radius: 15px;
     color:#FFF;
   }

   .dot {
    height: 150px;
    width: 150px;
    background-color: white;
    border-radius: 50%;
    box-shadow: 0px 0px 1px 1px #0000001a;
    display: inline-block;
   }
   .dot2 {
    height: 150px;
    width: 150px;
    background-color: white;
    border-radius: 50%;
    display: inline-block;
   }
   .colored_dot {
    height: 120px;
    width: 120px;
    background-color: #F5A9F2;
    border-radius: 50%;
    display: inline-block;
   }
   .space {
     height: 20%;
   }

   button, input, select, textarea {
     font-family: 'Open Sans', sans-serif;
     font-size: 20px;
     border-radius: 100px;
     border-color:white;
     background-color:#F5A9F2;
     border-width:30px;
     color: #FFF;
   }

   .bar {
     height: 66px;
     width: 400px;
     border-radius: 15px;
     background-color: #fff;
   }

   .form {
     border: 1px;
     border-radius: 0;
     -webkit-appearance: none;
   }

   ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
     color: #FFF;
     opacity: 1; /* Firefox */
   }

   #ImageWithText {
     bottom: 90;
     position: absolute;
     width:auto;
     height:80px;
     vertical-align:middle;/*text-bottom or text-top*/
     display: none;
   }
   @media only screen and (max-width: 414px){
     body {
       background-size:100%;
     }
   }

   @media only screen and (min-width:300px){
     body {
       background-color:#F5A9F2;
     }
   }

   A {
     text-decoration:none;
     color:#F5A9F2;
   }
   #logins {
     display: none;
     transition: width 2s, height 2s;
     -webkit-animation-name: show; /* Safari 12.1.1 */
     -webkit-animation-duration: 3s;
     animation-iteration-count: 1;
     animation-name: talk;
     animation-duration: 3s;
   }
   .window {
   width: 500px;
   height: 120px;
   border-radius: 15px;
   background-color: #FFF;
   color: #101010;
   border-width: 15px;
   position: center, absolute;
   display: none;

   }
   .button {
     width: 190px;
     height: 45px;
     border-radius: 5px;
     color: #FFF;
     background-color: #4e57fc;
   }
   .text {
   font-size: 25px;
   line-height: 25px;
   font-family: 'Open Sans',sans-serif;
   position: relative;
   }
   .small_dot {
     display: flex;
     justify-content: space-evenly;
     align-items: center;
   }
   .pulse {
     animation: pulse-animation 2s infinite;
   }

   @keyframes pulse-animation {
     0% {
       box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.2);
     }
     100% {
       box-shadow: 0 0 0 30px rgba(0, 0, 0, 0);
     }
   }"]).

   sign_up() ->
     file:write_file("sign_up.yaws", ["<?xml version='1.0' encoding='utf-8'?>
     <!DOCTYPE html>
     <html>
         <head>
          <title>sign-up</title>
          <meta charset='UTF-8'>
          <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
          <link rel='stylesheet' href='sign_up.css'>
         </head>
         <body>
             <erl>
               out(Arg) ->
               {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
             </erl>
               <form action='/dataStore/sole_data.yaws' method='post' name='formName' id='user'>
                 <table><td>
            <erl>
              out(Arg) ->
              {html," ++ "\"" ++ "<div class=write style=width:200px;><p class=paragraph style=color:#101010;>First Name</p></div>" ++ "\"" ++ "}.
            </erl></td><td>
              <script>
              function checkFirstName(fieldId) {
                if (document.getElementById(fieldId).value === '') {
                  changeColor1();
                  event.preventDefault();
                }
              }
              function changeColor1() {
                document.querySelector('#name1').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 270px;';
              }
              </script>
              <erl module='first_Name'>
              out(Arg) ->
           {ehtml,
             {input, [{type, text}, {autofocus, autofocus}, {name, 'First_Name'}, {id, name1}, {size, 20}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
         </erl>
       </td></table><br><br><br><table><td>
              <erl>
                out(_Arg) ->
                {html," ++ "\"" ++ "<div class=write style=width:200px><p class=paragraph style=color:#101010;>Last Name</p></div>" ++ "\"" ++ "}.
              </erl></td><td>
                <script>
                function checkLastName(fieldId) {
                  if (document.getElementById(fieldId).value === '') {
                    changeColor2();
                    event.preventDefault();
                  }
                }
                function changeColor2() {
                  document.querySelector('#name2').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 270px;';
                }
                </script>
                <erl module='Last_Name'>
                  out(Arg) ->
               {ehtml,
                 {input, [{type, text}, {name, 'Last_Name'}, {id, name2}, {size, 20}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
             </erl></td></table><br><br><br><table><td>
                  <erl>
                    out(_Arg) ->
                    {html," ++ "\"" ++ "<div class=write style=width:200px><p class=paragraph style=color:#101010;>Email address</p></div>" ++ "\"" ++ "}.
                  </erl></td><td>
                    <script>
                    function checkAddress(fieldId) {
                      if (document.getElementById(fieldId).value === '') {
                        changeColor();
                        event.preventDefault();
                      }
                    }
                    function changeColor() {
                      document.querySelector('#email').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 270px;';
                    }
                    </script>
                    <erl module='Email_Address'>
                      out(Arg) ->
                   {ehtml,
                     {input, [{type, email}, {type, text}, {name, email}, {id, email}, {size, 20}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
                 </erl></td></table><br><br><br><table><td>
                      <erl>
                        out(_Arg) ->
                        {html," ++ "\"" ++ "<div class=write style=width:200px><p class=paragraph style=color:#101010;>Date of Birth</p></div>" ++ "\"" ++ "}.
                      </erl></td><td>
                        <script>
                        function checkDateOfBirth(fieldId) {
                          if (document.getElementById(fieldId).value === '') {
                            changeColor3();
                            event.preventDefault();
                          }
                        }
                        function changeColor3() {
                          document.querySelector('#date').style.cssText = 'border-color: red; border-width: 5px;  height: 50px;';
                        }
                        </script>
                        <erl module='Date_of_Birth'>
                          out(Arg) ->
                          {ehtml,
                          {input, [{name, 'date_of_birth'}, {type, date}, {id, date}, {minlength, '10'}, {maxlength, '10'}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
                        </erl></td></table>
                          <br><br><br>
                          <table><td>
                           <erl>
                             out(_Arg) ->
                             {html," ++ "\"" ++ "<div class=write style=width:200px><p class=paragraph style=color:#101010;>Phone Number</p></div>" ++ "\"" ++ "}.
                           </erl></td><td>
                             <script>
     function autotab(current,to)
     {
         if (current.getAttribute && current.value.length==current.getAttribute('maxlength'))
         {
             to.focus()
         }
     }
     </script>
     <script>
     function checkPhone(fieldId) {
       if (document.getElementById(fieldId).value === '') {
         changeColor4();
         event.preventDefault();
       }
     }
     function changeColor4() {
       document.querySelector('#AreaNo').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
       document.querySelector('#Number1').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
       document.querySelector('#Number2').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
     }
     </script>


                           <erl module='Phone_Number'>
                             out(Arg) ->
                             {ehtml,
                             {span, [{class, areaDiv}], [
                             {input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'AreaNo'}, {class, number}, {name, areaNo}, {oninput, 'autotab(this, document.formName.number1)'}, {type, tel}, {'required placeholder', '(___)'}, {pattern, '[0-9]{3}'}, {'area-label', 'Area-Code'}, {size, '8'}, {minlength, '3'}, {maxlength, '3'}], [{span, [{class, validity}]}]},
                             [{span, [{class, number1Div}], [{input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'Number1'}, {class, number}, {name, number1}, {oninput, 'autotab(this, document.formName.number2)'}, {type, tel}, {'required placeholder', '___'}, {pattern, '[0-9]{3}'}, {size, '8'}, {minlength, '3'}, {maxlength, '3'}], [{span, [{class, validity}]}]}]}],
                             [{span, [{class, number2Div}], [{input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'Number2'}, {class, number}, {name, number2}, {type, tel}, {'required placeholder', '____'}, {pattern, '[0-9]{4}'}, {size, '12'}, {minlength, '4'}, {maxlength, '4'}], [{span, [{class, validity}]}]}]}]]}}.
                           </erl></td></table><br><br><br>
                           <div id=error class=write style='width:500px;'>Please identitfy your gender</div>
                          <table><td>
                          <erl>
                            out(_Arg) ->
                            {html," ++ "\"" ++ "<div class=write style=width:200px;><p class=paragraph style=color:#101010;>Gender</p></div>" ++ "\"" ++ "}.
                          </erl></td><td>
                            <script>
                            function checkButton() {
                                        if (document.getElementById('Male').checked) {
                                          '';
                                        }
                                        else if(document.getElementById('Female').checked) {
                                          '';
                                        }
                                        else if(document.getElementById('Other').checked) {
                                          '';
                                        }
                                        else {
                                          document.getElementById('error').style.display = 'block';
                                            event.preventDefault();
                                        }
                            }
                            </script>
                            <erl module='Male'>
                              out(Arg) ->
                              {html," ++ "\"" ++ "<div class=write style=width:130px><p class=paragraph style=color:#101010;><input id=Male type=radio name=Gender value=Male required/>Male<img src=images_folder/Male.png width=20px height=20px></p></div>" ++ "\"" ++ "}.
                            </erl></td><td>
                          <erl module='Female'>
                            out(Arg) ->
                            {html," ++ "\"" ++ "<div class=write style=width:130px><p class=paragraph style=color:#101010;><input id=Female type=radio name=Gender value=Female required/>Female<img src=images_folder/female.png width=20px height=20px></p></div>" ++ "\"" ++ "}.
                          </erl></td><td>
                          <erl module='Other'>
                            out(Arg) ->
                            {html," ++ "\"" ++ "<div class=write style=width:230px><p class=paragraph style=color:#101010;><input id=Other type=radio method=post name=Gender value=Other required/>Other<img class=imageWithText src=images_folder/genderqueer.png width=20px height=20px></p></div>" ++ "\"" ++ "}.
                          </erl>
                      </td></td>
                      </table>
                      <br>
                      <br>
                      <br>
                      <table>
                        <td>
                          <erl>
                            out(_Arg) ->
                            {html," ++ "\"" ++ "<div class=write style=width:200px;><p class=paragraph style=color:#101010;>Password</p></div>" ++ "\"" ++ "}.
                          </erl>
                        </td>
                        <td>
                      <erl>
                        out(Arg) ->
                        {ehtml,
                        {input, [{type, password}, {name, password}, {autofocus, autofocus}, {placeholder, 'Password'}, {size, '31'}, {id, password}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
                      </erl>
                    </td>
                  </table>
                      <br><br><br><br><br><br><br>
                        <erl module='form1'>
                          out(Arg) ->
                          {ehtml, {a, [{href, ''}], [{'div', [{class, writes}, {style, 'width: 100%; height: 100px; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px;'}, {align, center}], [{input, [{type, submit}, {type, button}, {onclick, 'checkForms()'}, {id, linkCreateAccount}, {style, 'color:#FFF; border-color:#4e57fc; background-color:#4e57fc; border-width:0px;'}]}]}]}}.
                        </erl>
                      </form>
                   <script>
                   function play() {
                     var audio = new Audio('voice/make_sure.m4a');
                     audio.play();
                   }
                   </script>
                   <script src='main.js'></script>
             <script>
             function checkForms() {
               checkFirstName('name1');
               checkLastName('name2');
               checkAddress('email');
               checkDateOfBirth('date');
               checkPhone('AreaNo');
               checkButton();
               password('password')
             }
             </script>
             <script>
             function password(fieldId) {
               if (document.getElementById(fieldId).value === '') {
                 changeColor5();
                 event.preventDefault();
               }
             }
             function changeColor5() {
               document.querySelector('#password').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 400px;';
             }
             </script>
         </body>

     </html>"]),
     file:write_file("sign_up.css", ["body{background-color:#F5A9F2 no-repeat; background-size:100%}
     @font-face {
       src: url(Open_Sans/OpenSans-Light.ttf);
       font-family: 'Open Sans', sans-serif;

     }
     .bar {
       height: 20%;
       width: 530%;
       border-radius: 15px;
       background-color: #FFF;
       position: relative;
     }
     .over {
       height:900px;
       overflow: auto;
       position: relative;
     }
     .paragraph {
       font-size: 25px;
       line-height: 62px;
       font-family: 'Open Sans',sans-serif;
       color: #F5A9F2;
     }
     .write {
       font-size: 25px;
       line-height: 62px;
       font-family: 'Open Sans',sans-serif;
       border-radius: 15px;
       background-color: #FFF;
       width:100px;
     }
     .writing {
       font-size: 25px;
       line-height: 62px;
       font-family: 'Open Sans',sans-serif;
       border-radius: 15px;
       background-color: #FFF;
       width:100px;
     }
     .writes {
       font-size: 25px;
       line-height: 62px;
       font-family: 'Open Sans',sans-serif;
       border-radius: 15px;
       background-color: #FFF;
       width:100px;
     }
     .form {
       border: 1px dotted #999;
       border-radius: 0;
       -webkit-appearance: none;
       color: #F5A9F2;
     }
     .form-input--error {
       border-color: red;
       display: none;
     }
     .dot {
      height: 100px;
      width: 100px;
      background-color: white;
      border-radius: 50%;
      display: inline-block;
      position: relative;
     }
     .sdot {
      height: 80px;
      width: 80px;
      background-color: white;
      border-radius: 50%;
      display: inline-block;
      position: relative;
     }
     .audio {
      height: 60px;
      width: 60px;
      background-color: red;
      border-radius: 50%;
      display: inline-block;
      position: relative;
     }
     button, input, select, textarea {
       font-family: 'Open Sans', sans-serif;
       font-size: 25px;
       border-radius: 15px;
       border-color:#FFF;
       background-color: #FFF;
     }
     @media only screen and (min-width:300px){
       body {
         background-color:#F5A9F2;
       }
       .slide {
         height: 50%;
       }
     }
     A {
       text-decoration:none;
       color:#F5A9F2;
     }
     input {
       text-decoration:none;
       color:black;
       outline: none;
     }
     #error {
       font-family: 'Open Sans', sans-serif;
       font-size: 25px;
       border-radius: 15px;
       text-decoration:none;
       border-color: #FFF;
       color:red;
       display:none;
     }"]).

login() ->
   file:write_file("log-in.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <!DOCTYPE html>
   <html>
       <head>
        <title>login</title>
        <meta charset='UTF-8'>
        <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' href='log-in.css'>
        <link rel='stylesheet' href='log.css'>
       </head>
       <body style='color:#F5A9F2;'>
           <erl>
             out(Arg) ->
             {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
           </erl>
           <br>
              <script>
   function autotab(current,to)
   {
   if (current.getAttribute && current.value.length==current.getAttribute('maxlength'))
   {
   to.focus()
   }
   }
   </script>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
   <form action='authentication.yaws' method='POST' name='formName' id='user'>
            <center>
              <br>
                <erl>
                  out(Arg) ->
                  {html," ++ "\"" ++ "<div class=write style=width:200px;color:#101010;><p class=paragraph>Phone</p></div>" ++ "\"" ++ "}.
                </erl>
            <br>
              <erl>
                out(Arg) ->
                {ehtml, {'div', [{class, 'form-input'}, {id, theFormID}, {name, formName}], [
                {span, [{class, areaDiv}], [
                {input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'AreaNo'}, {class, number}, {name, areaNo}, {autofocus, autofocus}, {oninput, 'autotab(this, document.formName.number1)'}, {type, tel}, {type, submit}, {method, post}, {'required placeholder', '(___)'}, {pattern, '[0-9]{3}'}, {'area-label', 'Area-Code'}, {size, '8'}, {minlength, '3'}, {maxlength, '3'}], [{span, [{class, validity}]}]},
                [{span, [{class, number1Div}], [{input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'Number1'}, {class, number}, {name, number1}, {oninput, 'autotab(this, document.formName.number2)'}, {type, tel}, {type, submit}, {method, post}, {'required placeholder', '___'}, {pattern, '[0-9]{3}'}, {size, '4'}, {minlength, '3'}, {maxlength, '3'}], [{span, [{class, validity}]}]}]}],
                [{span, [{class, number2Div}], [{input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'Number2'}, {class, number}, {name, number2}, {type, tel}, {type, submit}, {method, post}, {'required placeholder', '____'}, {pattern, '[0-9]{4}'}, {size, '10'}, {minlength, '4'}, {maxlength, '4'}], [{span, [{class, validity}]}]}]}]
                ]}
                ]}}.
              </erl>
            <br>
            <erl>
              out(Arg) ->
              {html," ++ "\"" ++ "<div class=write style=width:200px;color:#101010;><p class=paragraph>Password</p></div>" ++ "\"" ++ "}.
            </erl>
             <br>
             <erl>
               out(Arg) ->
               {ehtml, {'div', [{id, 'Pass'}, {class, 'form-input5'}], [
               {input, [{type, password}, {name, password}, {placeholder, password}, {size, '32'}, {id, password}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]},
               []
               ]}}.
             </erl>
             <br>
               <erl>
                 out(Arg) ->
                 {ehtml, {'div', [{class, writes}, {style, 'width:100%;height: 100px;background-color:#4e57fc; line-height: 62px; font-size: 25px; color:#FFF; position: absolute; bottom: 0px; padding: 0px; margin: -8px;'}], [{input, [{type, submit}, {id, 'login'}, {onclick, 'return play()'}, {style, 'color:#FFF; background-color:#4e57fc; border-color:#FFF; border-width:0px;'}]}]}}.
               </erl>
           </center>
         </form>
       <script>
       function checkPhone(fieldId) {
         if (document.getElementById(fieldId).value === '') {
           changeColor4();
           event.preventDefault();
         }
       }
       function changeColor4() {
         document.querySelector('#AreaNo').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
         document.querySelector('#Number1').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
         document.querySelector('#Number2').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
       }
       </script>

       <script>
       function password(fieldId) {
         if (document.getElementById(fieldId).value === '') {
           changeColor5();
           event.preventDefault();
         }
       }
       function changeColor5() {
         document.querySelector('#password').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 400px;';
       }
       </script>
       <script>
       function checkForms() {
         checkPhone('AreaNo');
         password('password');
         window.onbeforeunload = function() {
           return
         }
       }
       function play() {
         var audio = new Audio('voice/make_sure.m4a');
         audio.play();
         checkForms();
       }
       </script>
       <script>
       $('#login').click(function(e) {
         e.preventDefault();
     var area_code = $('#AreaNo').val();
     var num1 = $('#num1').val();
     var num2 = $('#num2').val();
     var password = $('#password').val();
     var dataString = 'area_code='+area_code+'&num1='+num1+'&num2='+num2+'&password='+password;
     $.ajax({
       type:'POST',
       data:dataString,
       url:'/authentication.yaws',
       success:function(data) {
         alert(data);
       }
     });
   });
       </script>
       </body>

   </html>"]),
   file:write_file("log-in.css", ["body{background-color:#F5A9F2; no-repeat; background-size:100%}
   @font-face {
     src: url(Open_Sans/OpenSans-Light.ttf);
     font-family: 'Open Sans', sans-serif;

   }
   .paragraph {
     font-size: 25px;
     line-height: 62px;
     font-family: 'Open Sans',sans-serif;
   }
   .dot {
    height: 100px;
    width: 100px;
    background-color: white;
    border-radius: 50%;
    display: inline-block;
    position: relative;
   }
   .words {
     width: 150px;
     border-radius: 15px;
     height:50px;
     background-color: #fff;
   }
   .word {
     width: 150px;
     border-radius: 15px;
     height:50px;
     background-color: #FFF;
   }
   .write {
     font-size: 25px;
     line-height: 62px;
     font-family: 'Open Sans',sans-serif;
     border-radius: 15px;
     background-color: #FFF;
     width:100px;
   }
   .form {
     border: 1px dotted #999;
     border-radius: 0;
     -webkit-appearance: none;
   }
   @media only screen and (min-width:300px){
     body {
       background-color:#F5A9F2;
     }
   }
   A {
     text-decoration:none;
     color:#F5A9F2;
   }
   input {
     text-decoration:none;
     color:black;
     outline: none;
   }
   .bottom {
     bottom: 15px;
     position: absolute;
   }"]),
   file:write_file("log.css", ["button, input, select, textarea {
     font-family: 'Open Sans', sans-serif;
     font-size: 25px;
     border-radius: 15px;
     border-color:skyblue;
     background-color:white;
     border-width:1px;
   }
   input {
     text-decoration;
     color:black;
   }"]).

authentication() ->
  file:write_file("authentication.yaws", ["<?xml version='1.0' encoding='UTF-8'?>
  <authenticate>
  <erl module='authenticate'>
    -export([authenticate/2]).
    -record(session, {user, passwd, udata}).

  out(A) ->
      L = yaws_api:parse_post(A),
      B = {html, f('~p', [lists:nth(1, L)])},
      B1 = element(2, B),
      B2 = lists:append(B1),
      B3 = lists:nth(2, B2),
      B4 = lists:nth(3, B3),
      B5 = string:sub_string(B4, 2, 4),
      L = yaws_api:parse_post(A),
      C = {html, f('~p', [lists:nth(2, L)])},
      C1 = element(2, C),
      C2 = lists:append(C1),
      C3 = lists:nth(2, C2),
      C4 = lists:nth(3, C3),
      C5 = string:sub_string(C4, 2, 4),
      L = yaws_api:parse_post(A),
      D = {html, f('~p', [lists:nth(3, L)])},
      D1 = element(2, D),
      D2 = lists:append(D1),
      D3 = lists:nth(2, D2),
      D4 = lists:nth(3, D3),
      D5 = string:sub_string(D4, 2, 5),
      L = yaws_api:parse_post(A),
      E = {html, f('~p', [lists:nth(4, L)])},
      E1 = element(2, E),
      E2 = lists:append(E1),
      E3 = lists:nth(2, E2),
      E4 = lists:nth(3, E3),
      E5 = string:sub_string(E4, 2, $0),
      E6 = lists:last(string:tokens(E5, sole_api:tok())),
      E7 = sole_api:hash_256_A(E6),
      E8 = lists:last(E7),
      Phone_Number = B5 ++ C5 ++ D5,
      Password = E8,
      {ehtml, f('~p~p~n', [Phone_Number, Password])},
      authenticate(Phone_Number, Password).


      authenticate(Num, Password) ->
        Number = phone_number:out([]),
        Phone_Number = {ehtml, f('~p', [Num])},
        if Phone_Number == Number ->
                   authenticate_last(Password, Num);
              true ->
                   [{redirect, " ++ "\"" ++ "/error_login.yaws" ++ "\"" ++ "}]
        end.

      authenticate_last(Passwd, Num) ->
        Key = password:out([]),
        Password = {ehtml, f('~p', [Passwd])},
        if Password == Key ->
                   S = #session{user = Num,
                                passwd = Password,
                                udata = []},
                                %% Now register the session to the session server
                                Cookie = yaws_api:new_cookie_session(S),
                                [{redirect, " ++ "\"" ++ "/commercial5.yaws" ++ "\"" ++ "},
                                  yaws_api:set_cookie(sole_api:phone_number(),Cookie,[])];
            true ->
                   [{redirect, " ++ "\"" ++ "/error_login.yaws" ++ "\"" ++ "}]
        end.
    </erl>
    <br>
      <br>
    <erl module='phone_number'>
      out(Arg) ->
      P = sole_api:phone_number(),
      {ehtml, f('~p', [P])}.
    </erl>
    <erl module='password'>
      out(Arg) ->
      P = sole_api:password(),
      {ehtml, f('~p', [P])}.
    </erl>
    </authenticate>"]).

error_login() ->
  file:write_file("error_login.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>error login</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='log-in.css'>
       <link rel='stylesheet' href='log.css'>
      </head>
      <body style='color:#F5A9F2;'>
          <erl>
            out(Arg) ->
            {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
          </erl>
          <br>
             <script>
  function autotab(current,to)
  {
  if (current.getAttribute && current.value.length==current.getAttribute('maxlength'))
  {
  to.focus()
  }
  }
  </script>
           <br>
           <br>
           <br>
           <br>
           <br>
           <div class='error' width='600px' height='100px' style='background-color: #FFF; border-radius: 5px; position: absolute; bottom: 50%; padding: 10px; margin: 30%;'>
             <center>
             <p class='paragraph' style='color: red;'>Your login credentials was invalid. Please try again.</p>
           </center>
           </div>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
           <center>
             <br>
               <erl>
                 out(Arg) ->
                 {html," ++ "\"" ++ "<div class=write style=width:200px;color:#101010;><p class=paragraph>Phone</p></div>" ++ "\"" ++ "}.
               </erl>
           <br>
             <div class='form-input' id='theFormID' name='formName'><span class='areaDiv'><input style='height:50px; border-width: 0px; border-radius: 0px;' id='area_code' class='number' name='areaNo' autofocus='autofocus' oninput='autotab(this, document.formName.number1)' type='tel' type='submit' method='post' required placeholder='(___)' pattern='[0-9]{3}' area-label='Area-Code' size='8' minlength='3' maxlength='3' disabled><span class='validity'></span></input><span class='number1Div'><input style='height:50px; border-width: 0px; border-radius: 0px;' id='num1' class='number' name='number1' oninput='autotab(this, document.formName.number2)' type='tel' type='submit' method='post' required placeholder='___' pattern='[0-9]{3}' size='4' minlength='3' maxlength='3' disabled><span class='validity'></span></input></span><span class='number2Div'><input style='height:50px; border-width: 0px; border-radius: 0px;' id='num2' class='number' name='number2' type='tel' type='submit' method='post' required placeholder='____' pattern='[0-9]{4}' size='10' minlength='4' maxlength='4' disabled><span class='validity'></span></input></span></span></div>
           <br>
           <erl>
             out(Arg) ->
             {html," ++ "\"" ++ "<div class=write style=width:200px;color:#101010;><p class=paragraph>Password</p></div>" ++ "\"" ++ "}.
           </erl>
            <br>
            <div id='Pass' class='form-input5'><input type='password' name='password' placeholder='password' size='32' id='password' style='height:50px; border-width: 0px; border-radius: 0px;' disabled/></div>
            <br>
            <erl>
              out(Arg) ->
              {ehtml, {'div', [{class, writes}, {onclick, 'startTimeout()'}, {style, 'width:100%;height: 100px;background-color:#4e57fc; line-height: 62px; font-size: 25px; color:#FFF; position: absolute; bottom: 0px; padding: 0px; margin: -8px; font-family: 'Open Sans', sans-serif; line-height: 62px;'}, {align, center}], [{input, [{type, button}, {style, 'color:#FFF; background-color:#4e57fc; border-color:#FFF; border-width:0px;'}], 'try again'}]}}.
            </erl>
          </center>
      <script>
      function play() {
        var audio = new Audio('voice/account_information.m4a');
        audio.play();
      }
      </script>
      <script type='text/javascript'>
      var values, count=0;

      function startTimeout() {
        values = setTimeout(new_page, 4500);
        play();
      }
      </script>

      <script>
        function new_page() {
               window.location.href = 'log-in.yaws';
        }
      </script>

      </body>

  </html>"]).

commercial5() ->
  file:write_file("commercial5.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <stream>
  <html>
      <head>
       <title>option_page</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
       <link rel='stylesheet' href='commercial5.css'>
       <erl>
         out(Arg) ->
         {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
       </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
           .sentence { width: 700px; border-radius: 15px; height:100px; background-color: #FFF; }
           .window { width: 500px; height: 350px; }
         </style>
      </head>
      <body>
        <!--onclick=play(),display()-->
        <erl>
          out(Arg) ->
          {html, " ++ "\"" ++ "<center><div class=dot><br><img onclick='play();display();' src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
        </erl><center><div style='height: 480px; top: 200px; align-items: center; position: absolute;' class=window3><p class=paragraph>This platform is free to use. To make money, go to logo up top, then pay service, and submit your credit card details. Whenever, you recieve a like on content you've posted, you'll recieve $1.00. This platform will only credit 5% of every profit made.</p>
        <!--
        <form action='bitcoin_wallet_generation.yaws' method='POST'>
          <input type='password' style='border-width: 0px;' placeholder='MUST BE 32 CHARACTERS' size='32' minlength='32' maxlength='32' name='password'>
            <input type='submit' style='background-color: #4e57fc; border-color: #4e57fc; color: #fff; width: 410px;'>
            </form>-->
        <div class='button'><center><p class='paragraph' onclick='dont_show();'>Click Me</p></center></div></div></center>

          <!-- TCP -->
          <!-- Menu goes here --><div class='menu'>
          <center align='center'>
            <table cellspacing='0' width='98%' style='bottom: 0px; position: absolute;'>
              <td>
                <erl>
                  out(Arg) ->
                  {ehtml, {'div', [{class, 'circle'}], {a, [{href, 'commercial' ++ sole_api:first_name() ++ '.yaws'}], {br, [], {img, [{src, 'images_folder/Personal_profile_icon.png'}, {width, '40px'}, {height, '40px'}]}}}}}.
                </erl>
            </td><td> <div class='circle'><br><img src='images_folder/Home.png' 'width=40px height=40px'></div>
            </td>
          </table>
        </center></div>
          <center><div class='window'><table><tr><p class='paragraph' style='color: #101010;'>Do you want to submit credit card details, and potentially earn money, or do you want to delete credit card account.</p></tr><tr><table><td><div class='button'><center><p class='paragraph' onclick='go_to_page();'>Pay Service</p></center></div></td><td><div class='button'><center><a href='delete_card.yaws' style='color: #fff'><p class='paragraph'>Delete Account</p></a></center></div></td></table></tr></table></div></center>
          <center><div class='window2' style='height: 700px;'><p class='paragraph' style='color: #101010; height: 100px;'>Type in Bitcoin address</p>
          <center>
            <erl>
              out(Arg) ->
              {ehtml, {img, [{src, 'images_folder/frame.png'}, {width, '300px'}, {height, '300px'}]}}.
            </erl>
          </center>
            <erl>
              out(Arg) ->
              {ehtml, {form, [{class, 'form-input4'}, {action, 'sole_database.txt'}, {method, 'post'}], [
              {span, [{class, areaDiv}], [
              {input, [{style, 'height:50px; border-width:5px; border-color: #4e57fc;'}, {id, 'Credit-Card_Info'}, {autofocus, autofocus}, {class, number}, {name, 'Bitcoin_address'}, {type, password}, {'required placeholder', '00000000000000000000'}, {pattern, '[0-9]{3}'}, {'area-label', 'Area-Code'}, {size, '20'}, {minlength, '16'}, {maxlength, '16'}], [{span, [{class, validity}]}]}]}]}}.
            </erl><table><td><div class='button'><center><p class='paragraph' onclick='cancel();'>Type</p></center></div></td><td><div class='button'><center><p class='paragraph'>Take screenshot</p></center></div></td></table>
          </div></center>

          <erl module='avatar'>
            out(Arg) ->
            sole_api:determined_avatar().
          </erl>
          <center>
  <br><div class='options'>
    <div class=words><p class=paragraph onclick=show();>Click Me!!!</p></div>
    <div class='words'>
  <a href='user_home.yaws'><p class='paragraph' style=color:#101010;>User Profile</p></a></div></td><td width=5%>
    <!--<div class=words><center><a href='likes.yaws' style='color:#101010;'><p class='paragraph'>Likes</p></a></center></div>-->
          <erl>
            out(Arg) ->
            {html," ++ "\"" ++ "<div class=words><p class=paragraph><a href=mobile_cell.yaws style=color:#101010;><img src=images_folder/telephone.png width=20% height=20% class=imageWithText></a></p></div>" ++ "\"" ++ "}.
          </erl><!--
          <erl>
            out(Arg) ->
            {html," ++ "\"" ++ "<div class=words><p class=paragraph><a href=group_chat.yaws style=color:#101010;><img src=images_folder/industy_search_icon.png width=20% height=20% class=imageWithText>group chat</a></p></div>" ++ "\"" ++ "}.
          </erl>
          <erl>
            out(Arg) ->
            {html," ++ "\"" ++ "<div class=words><p class=paragraph><a href=add_contact.yaws style=color:#101010;>+ Contact</a></p></div>" ++ "\"" ++ "}.
          </erl>
    <script src='jquery.min.map'></script>
    <!--<script src='sole_bitcoin_network1.js'></script>-->
    <erl>
      out(Arg) ->
      {html," ++ "\"" ++ "<div class=words><p class=paragraph><a href=likes.yaws style=color:#101010;><img src=images_folder/happy.png width=20% height=20% class=imageWithText></a></p></div>" ++ "\"" ++ "}.
    </erl>
    <erl>
      out(Arg) ->
      {html," ++ "\"" ++ "<div class=words><p class=paragraph><a href=no_comment.yaws style=color:#101010;><img src=images_folder/neutral.png width=20% height=20% class=imageWithText></a></p></div>" ++ "\"" ++ "}.
    </erl>
    <erl>
      out(Arg) ->
      {html," ++ "\"" ++ "<div class=words><p class=paragraph><a href=dislikes.yaws style=color:#101010;><img src=images_folder/angry.png width=20% height=20% class=imageWithText></a></p></div>" ++ "\"" ++ "}.
    </erl>
  <div class='words'><a href='log-out.yaws'><p class='paragraph' style=color:#101010;>Log Out</p></a></div>
  </center>
        <script>
        function play() {
          var audio = new Audio('voice/help.m4a');
          audio.play();
        }
        function display() {
          var display = document.querySelector('.window').style.display = 'block';
        }
        function display2() {
          var display = document.querySelector('.window2').style.display = 'block';
          var close = document.querySelector('.window').style.display = 'none';
        }
        function cancel() {
          var cancel = document.querySelector('.window2').style.display = 'none';
        }
        function go_to_page() {
          window.location.href = 'comthru_pay.yaws';
        }
        </script>
        <script>
          function show() {
            var display = document.querySelector('.window3').style.display = 'block';
          }
          function dont_show() {
          var close = document.querySelector('.window3').style.display = 'none';
          }
        </script>
        <erl>
          out(Arg) ->
          sole_api:if_this_file_exist_delete().
        </erl>

        <script>
        const WebSocket = window.WebSocket || window.MozWebSocket;
          const br = new window.BroadcastChannel('send_numbr');
          const number = document.getElementsByTagName('p');

          function answer_call() {
            window.location.href = `${number[number.length - 1].innerHTML}.yaws`;
          }

          br.onmessage = (msg) => {
              let txt=document.querySelector('#txtMsg');
              txt.value=`${event.data.pNumber1}`;
              if (txt.value===`${number[number.length - 1].innerHTML}`){
              answer_call();
            }else{
                null;
              }
          }
        </script>

        <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

        <erl>
          out(Arg) ->
          Phone_Number = sole_api:phone_number(),
          {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
        </erl>




        <script src='face.js'></script>
        <script src='figure.js'></script>

      </body>


  </html>
  </stream>"]),
  file:write_file("commercial5.css", ["body{background-color:#F5A9F2 no-repeat; background-size:100%}
  @font-face {
    src: url(Open_Sans/OpenSans-Light.ttf);
    font-family: 'Open Sans', sans-serif;

  }
  .over {
    height:870px;
    overflow: auto;
    position: relative;
  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
  }
  .words {
    width: 250px;
    border-radius: 15px;
    height:80px;
    background-color: #FFF;
  }
  .text {
    width: 350px;
    border-radius: 15px;
    height:80px;
    background-color: #FFF;
  }
  .form {
    border: 1px dotted #999;
    border-radius: 0;
    -webkit-appearance: none;
  }
  button, input, select, textarea {
    font-family: 'Open Sans', sans-serif;
    font-size: 25px;
    border-radius: 10px;
    border-color:skyblue;
    border-width:1px;
  }
  .booth {
    width:80%;
    height:700px;
    background-color:black;
    border:10px solid black;
    border-radius:10px;
    margin:0 auto;
  }
  .booths {
    width:80%;
    height:700px;
    background-color:black;
    border:10px solid black;
    border-radius:10px;
    margin:0 auto;
  }
  @media only screen and (min-width:300px){
    body {
      background-color:#F5A9F2;;
    }
  }
  A {
    text-decoration:none;
    color:#F5A9F2;;
  }
  .dots {
   height: 100px;
   width: 100px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }
  .circle {
   height: 80px;
   width: 80px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }
  .dot {
   height: 100px;
   width: 100px;
   background-color: white;
   border-radius: 50%;
   display: inline-block;
   position: relative;
  }
  .menus {
    width: 100%;
    height: 65px;
    bottom: 0px;
    position: absolute;
    background-color: #FFF;
  }
  .window3 {
  width: 500px;
  height: 800px;
  border-radius: 15px;
  background-color: #FFF;
  border-color: #F5A9F2;
  border-width: 15px;
  position: absolute;
  display: none;

  }"]).

happy_photo() ->
  file:write_file("happy_photo.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
  <head>
      <meta charset='utf-8'>
      <meta http-equiv='X-UA-Compatible' content='IE=edge'>
      <title>webcam-js</title>
      <meta name='viewport' content='width=device-width, initial-scale=+1'>
      <link rel='icon' href='data:;base64,iVBORw0KGgo='>
      <link rel='stylesheet' href='bootstrap.min.css'>
      <link rel='stylesheet' href='cropselect.css'>
      <link href='material-icon.css' rel='stylesheet'>
      <link rel='stylesheet' type='text/css' media='screen' href='webcam-demo.css'>
      <script src='jquery-3.3.1.min.js'></script>
      <link rel='stylesheet' href='cropper.css'>
      <style>
      #canvas {
      }
      .cropper-crop {
       display:none;
       }
       .cropper-bg {
       background: none;
       }
      </style>
  </head>
  <body>
      <main id='webcam-app'>
          <div class='form-control webcam-start' id='webcam-control'>
                  <label class='form-switch'>
                  <input type='checkbox' id='webcam-switch'>
                  <i></i>
                  <span id='webcam-caption'>Click to Start Camera and smile</span>
                  </label>
                  <button id='cameraFlip' class='btn d-none'></button>
          </div>

          <div id='errorMsg' class='col-12 col-md-6 alert-danger d-none'>
              Fail to start camera, please allow permision to access camera. <br/>
              If you are browsing through social media built in browsers, you would need to open the page in Sarafi (iPhone)/ Chrome (Android)
              <button id='closeError' class='btn btn-primary ml-3'>OK</button>
          </div>
          <div class='md-modal md-effect-12'>
              <div id='app-panel' class='app-panel md-content row p-0 m-0'>
                  <div id='webcam-container' class='webcam-container col-12 d-none p-0 m-0'>
                      <video id='webcam' autoplay playsinline width='640' height='480'></video>
                      <canvas id='canvas' class='d-none'></canvas>
                      <div class='flash'></div>
                      <audio id='snapSound' src='Camera.mp3' preload = 'auto'></audio>
                  </div>
                  <div id='cameraControls' class='cameraControls'>
                    <!--  <a href='#' id='exit-app' title='Exit App' class='d-none'><i class='material-icons'>exit_to_app</i></a> -->
                      <button id='take-photo' onclick='bar();' title='Take Photo'><i class='material-icons'>camera_alt</i></button>
                      <a href='#' id='download-photo' target='_blank' title='Save Photo' class='d-none'><i class='material-icons'>file_download</i></a>
                      <a href='#' id='resume-camera'  title='Resume Camera' class='d-none'><i class='material-icons'>camera_front</i></a>

                      <br>
                        <br>
                          <br>
                            <erl>
                            out(A) ->
                          Form =
                              {form, [{class, words}, {align, left}],
                                      [{input, [{type, submit}, {id, 'photoID'}, {class, paragraph}, {style, 'position: fixed; width:100%; height:100px; bottom:0; z-index: 10000; display: none;'}, {value, 'Save photo'}]}]},
                          {ehtml, {html,[], [{h2,[], ''},
                          Form]}}.
                        </erl>
                        <script>
                          function bar() {
                                 document.querySelector('#photoID').style.display = 'block';
                          }
                        </script>
                        <script type='text/javascript'>
                        var values, count=0;

                        function startTimeout() {
                          values = setTimeout(redirect, 7000);
                        }
                        function redirect() {
                               window.location.href = 'rename_file.yaws';
                        }
                        </script>
                        <script>
                          const photoID = document.getElementById('photoID');


                          photoID.addEventListener('click', (e) => {
                          //prevent default
                          e.preventDefault();
                          startTimeout();

                          play();
                          })
                        </script>
                              <br><script src='jquery.min.map'></script><script src='cropper.js'></script>
                              <script>
                                //**dataURL to blob**
                                function dataURLtoBlob(dataurl) {
                                    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                                        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
                                    while(n--){
                                        u8arr[n] = bstr.charCodeAt(n);
                                    }
                                    var blob = new Blob([u8arr], {type:mime});
                                    upload(blob);
                                }
                              </script>
                              <script>
                                class Webcam {
                                    constructor(webcamElement, facingMode = 'user', canvasElement = null, snapSoundElement = null) {
                                      this._webcamElement = webcamElement;
                                      this._webcamElement.width = this._webcamElement.width || 640;
                                      this._webcamElement.height = this._webcamElement.height || video.width * (3 / 4);
                                      this._facingMode = facingMode;
                                      this._webcamList = [];
                                      this._streamList = [];
                                      this._selectedDeviceId = '';
                                      this._canvasElement = canvasElement;
                                      this._snapSoundElement = snapSoundElement;
                                    }

                                    get facingMode(){
                                      return this._facingMode;
                                    }

                                    set facingMode(value){
                                      this._facingMode = value;
                                    }

                                    get webcamList(){
                                      return this._webcamList;
                                    }

                                    get webcamCount(){
                                      return this._webcamList.length;
                                    }

                                    get selectedDeviceId(){
                                      return this._selectedDeviceId;
                                    }

                                    /* Get all video input devices info */
                                    getVideoInputs(mediaDevices){
                                      this._webcamList = [];
                                      mediaDevices.forEach(mediaDevice => {
                                        if (mediaDevice.kind === 'videoinput') {
                                          this._webcamList.push(mediaDevice);
                                        }
                                      });
                                      if(this._webcamList.length == 1){
                                        this._facingMode = 'user';
                                      }
                                      return this._webcamList;
                                    }

                                    /* Get media constraints */
                                    getMediaConstraints() {
                                        var videoConstraints = {};
                                        if (this._selectedDeviceId == '') {
                                            videoConstraints.facingMode =  this._facingMode;
                                        } else {
                                            videoConstraints.deviceId = { exact: this._selectedDeviceId};
                                        }
                                        var constraints = {
                                            video: videoConstraints,
                                            audio: false
                                        };
                                        return constraints;
                                    }

                                    /* Select camera based on facingMode */
                                    selectCamera(){
                                      for(let webcam of this._webcamList){
                                        if(   (this._facingMode=='user' && webcam.label.toLowerCase().includes('front'))
                                          ||  (this._facingMode=='enviroment' && webcam.label.toLowerCase().includes('back'))
                                        )
                                        {
                                          this._selectedDeviceId = webcam.deviceId;
                                          break;
                                        }
                                      }
                                    }

                                    /* Change Facing mode and selected camera */
                                    flip(){
                                      this._facingMode = (this._facingMode == 'user')? 'enviroment': 'user';
                                      this._webcamElement.style.transform = '';
                                      this.selectCamera();
                                    }

                                    /*
                                      1. Get permission from user
                                      2. Get all video input devices info
                                      3. Select camera based on facingMode
                                      4. Start stream
                                    */
                                    async start(startStream = true) {
                                      return new Promise((resolve, reject) => {
                                        this.stop();
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints()) //get permisson from user
                                          .then(stream => {
                                            this._streamList.push(stream);
                                            this.info() //get all video input devices info
                                              .then(webcams =>{
                                                this.selectCamera();   //select camera based on facingMode
                                                if(startStream){
                                                    this.stream()
                                                        .then(facingMode =>{
                                                            resolve(this._facingMode);
                                                        })
                                                        .catch(error => {
                                                            reject(error);
                                                        });
                                                }else{
                                                    resolve(this._selectedDeviceId);
                                                }
                                              })
                                              .catch(error => {
                                                reject(error);
                                              });
                                          })
                                          .catch(error => {
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Get all video input devices info */
                                    async info(){
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.enumerateDevices()
                                          .then(devices =>{
                                            this.getVideoInputs(devices);
                                            resolve(this._webcamList);
                                          })
                                          .catch(error => {
                                            reject(error);
                                          });
                                      });
                                    }

                                    /* Start streaming webcam to video element */
                                    async stream() {
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints())
                                          .then(stream => {
                                              this._streamList.push(stream);
                                              this._webcamElement.srcObject = stream;
                                              if(this._facingMode == 'user'){
                                                this._webcamElement.style.transform = 'scale(-1,1)';
                                              }
                                              this._webcamElement.play();
                                              resolve(this._facingMode);
                                          })
                                          .catch(error => {
                                              console.log(error);
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Stop streaming webcam */
                                    stop() {
                                      this._streamList.forEach(stream => {
                                        stream.getTracks().forEach(track => {
                                          track.stop();
                                        });
                                      });
                                    }

                                    snap() {
                                      if(this._canvasElement!=null){
                                        if(this._snapSoundElement!= null){
                                          this._snapSoundElement.play();
                                        }
                                        this._canvasElement.height = this._webcamElement.scrollHeight;
                                        this._canvasElement.width = this._webcamElement.scrollWidth;
                                        let context = this._canvasElement.getContext('2d');
                                        if(this._facingMode == 'user'){
                                          context.translate(this._canvasElement.width, 0);
                                          context.scale(-1, 1);
                                        }
                                        context.clearRect(0, 0, this._canvasElement.width, this._canvasElement.height);
                                        context.drawImage(this._webcamElement, 0, 0, this._canvasElement.width, this._canvasElement.height);
                                        let data = this._canvasElement.toDataURL('image/png');
                                        document.getElementById('take-photo').onclick = dataURLtoBlob(data);
                                        return data;
                                      }
                                      else{
                                        throw 'canvas element is missing';
                                      }
                                    }
                                }

                                const parts = [];

                                     function upload(data) {

                                     parts.push(data);

                                     const blob = new Blob(parts, {
                                        type: 'image/jpeg'
                                     });
                                     const url = URL.createObjectURL(blob);
                                     var formData = new FormData();

                                     formData.append('image', blob);

                                     $.ajax('upload.yaws', {
                                       method: 'POST',
                                       data: formData,
                                       processData: false,
                                       contentType: false,
                                       success: function () {
                                               console.log('Upload success');
                                       },
                                       error: function () {
                                               console.log('Upload failed');
                                       }
                                     });
                                     };
                              </script>
                                   <script>
                                     function play() {
                                       var audio = new Audio('voice/click_to_right.m4a');
                                       audio.play();
                                     }
                                   </script>
                  </div>
              </div>
          </div>
          <div class='md-overlay'></div>
      </main>
      <script src='webcam-easy-master/demo/js/app.js'></script>
  </body>
  </html>"]).

regular_photo() ->
  file:write_file("regular_photo.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
  <head>
      <meta charset='utf-8'>
      <meta http-equiv='X-UA-Compatible' content='IE=edge'>
      <title>webcam-js</title>
      <meta name='viewport' content='width=device-width, initial-scale=+1'>
      <link rel='icon' href='data:;base64,iVBORw0KGgo='>
      <link rel='stylesheet' href='bootstrap.min.css'>
      <link rel='stylesheet' href='cropselect.css'>
      <link href='material-icon.css' rel='stylesheet'>
      <link rel='stylesheet' type='text/css' media='screen' href='webcam-demo.css'>
      <script src='jquery-3.3.1.min.js'></script>
      <link rel='stylesheet' href='cropper.css'>
      <style>
      #canvas {
      }
      .cropper-crop {
       display:none;
       }
       .cropper-bg {
       background: none;
       }
      </style>
  </head>
  <body>
      <main id='webcam-app'>
          <div class='form-control webcam-start' id='webcam-control'>
                  <label class='form-switch'>
                  <input type='checkbox' id='webcam-switch'>
                  <i></i>
                  <span id='webcam-caption'>Click to Start Camera and look normal</span>
                  </label>
                  <button id='cameraFlip' class='btn d-none'></button>
          </div>

          <div id='errorMsg' class='col-12 col-md-6 alert-danger d-none'>
              Fail to start camera, please allow permision to access camera. <br/>
              If you are browsing through social media built in browsers, you would need to open the page in Sarafi (iPhone)/ Chrome (Android)
              <button id='closeError' class='btn btn-primary ml-3'>OK</button>
          </div>
          <div class='md-modal md-effect-12'>
              <div id='app-panel' class='app-panel md-content row p-0 m-0'>
                  <div id='webcam-container' class='webcam-container col-12 d-none p-0 m-0'>
                      <video id='webcam' autoplay playsinline width='640' height='480'></video>
                      <canvas id='canvas' class='d-none'></canvas>
                      <div class='flash'></div>
                      <audio id='snapSound' src='Camera.mp3' preload = 'auto'></audio>
                  </div>
                  <div id='cameraControls' class='cameraControls'>
                    <!--  <a href='#' id='exit-app' title='Exit App' class='d-none'><i class='material-icons'>exit_to_app</i></a> -->
                      <button id='take-photo' onclick='bar();' title='Take Photo'><i class='material-icons'>camera_alt</i></button>
                      <a href='#' id='download-photo' target='_blank' title='Save Photo' class='d-none'><i class='material-icons'>file_download</i></a>
                      <a href='#' id='resume-camera'  title='Resume Camera' class='d-none'><i class='material-icons'>camera_front</i></a>

                      <br>
                        <br>
                          <br>
                            <erl>
                            out(A) ->
                          Form =
                              {form, [{class, words}, {align, left}],
                                      [{input, [{type, submit}, {id, 'photoID'}, {class, paragraph}, {style, 'position: fixed; width:100%; height:100px; bottom:0; z-index: 10000; display: none;'}, {value, 'Save photo'}, {onclick, 'redirect()'}]}]},
                          {ehtml, {html,[], [{h2,[], ''},
                          Form]}}.
                        </erl>
                        <script>
                          function bar() {
                                 document.querySelector('#photoID').style.display = 'block';
                          }
                          function redirect() {
                                 window.location.href = 'rename_file2.yaws';
                          }
                        </script>
                              <br><script src='jquery.min.map'></script><script src='cropper.js'></script>
                              <script>
                                //**dataURL to blob**
                                function dataURLtoBlob(dataurl) {
                                    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                                        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
                                    while(n--){
                                        u8arr[n] = bstr.charCodeAt(n);
                                    }
                                    var blob = new Blob([u8arr], {type:mime});
                                    upload(blob);
                                }
                              </script>
                              <script>
                                class Webcam {
                                    constructor(webcamElement, facingMode = 'user', canvasElement = null, snapSoundElement = null) {
                                      this._webcamElement = webcamElement;
                                      this._webcamElement.width = this._webcamElement.width || 640;
                                      this._webcamElement.height = this._webcamElement.height || video.width * (3 / 4);
                                      this._facingMode = facingMode;
                                      this._webcamList = [];
                                      this._streamList = [];
                                      this._selectedDeviceId = '';
                                      this._canvasElement = canvasElement;
                                      this._snapSoundElement = snapSoundElement;
                                    }

                                    get facingMode(){
                                      return this._facingMode;
                                    }

                                    set facingMode(value){
                                      this._facingMode = value;
                                    }

                                    get webcamList(){
                                      return this._webcamList;
                                    }

                                    get webcamCount(){
                                      return this._webcamList.length;
                                    }

                                    get selectedDeviceId(){
                                      return this._selectedDeviceId;
                                    }

                                    /* Get all video input devices info */
                                    getVideoInputs(mediaDevices){
                                      this._webcamList = [];
                                      mediaDevices.forEach(mediaDevice => {
                                        if (mediaDevice.kind === 'videoinput') {
                                          this._webcamList.push(mediaDevice);
                                        }
                                      });
                                      if(this._webcamList.length == 1){
                                        this._facingMode = 'user';
                                      }
                                      return this._webcamList;
                                    }

                                    /* Get media constraints */
                                    getMediaConstraints() {
                                        var videoConstraints = {};
                                        if (this._selectedDeviceId == '') {
                                            videoConstraints.facingMode =  this._facingMode;
                                        } else {
                                            videoConstraints.deviceId = { exact: this._selectedDeviceId};
                                        }
                                        var constraints = {
                                            video: videoConstraints,
                                            audio: false
                                        };
                                        return constraints;
                                    }

                                    /* Select camera based on facingMode */
                                    selectCamera(){
                                      for(let webcam of this._webcamList){
                                        if(   (this._facingMode=='user' && webcam.label.toLowerCase().includes('front'))
                                          ||  (this._facingMode=='enviroment' && webcam.label.toLowerCase().includes('back'))
                                        )
                                        {
                                          this._selectedDeviceId = webcam.deviceId;
                                          break;
                                        }
                                      }
                                    }

                                    /* Change Facing mode and selected camera */
                                    flip(){
                                      this._facingMode = (this._facingMode == 'user')? 'enviroment': 'user';
                                      this._webcamElement.style.transform = '';
                                      this.selectCamera();
                                    }

                                    /*
                                      1. Get permission from user
                                      2. Get all video input devices info
                                      3. Select camera based on facingMode
                                      4. Start stream
                                    */
                                    async start(startStream = true) {
                                      return new Promise((resolve, reject) => {
                                        this.stop();
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints()) //get permisson from user
                                          .then(stream => {
                                            this._streamList.push(stream);
                                            this.info() //get all video input devices info
                                              .then(webcams =>{
                                                this.selectCamera();   //select camera based on facingMode
                                                if(startStream){
                                                    this.stream()
                                                        .then(facingMode =>{
                                                            resolve(this._facingMode);
                                                        })
                                                        .catch(error => {
                                                            reject(error);
                                                        });
                                                }else{
                                                    resolve(this._selectedDeviceId);
                                                }
                                              })
                                              .catch(error => {
                                                reject(error);
                                              });
                                          })
                                          .catch(error => {
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Get all video input devices info */
                                    async info(){
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.enumerateDevices()
                                          .then(devices =>{
                                            this.getVideoInputs(devices);
                                            resolve(this._webcamList);
                                          })
                                          .catch(error => {
                                            reject(error);
                                          });
                                      });
                                    }

                                    /* Start streaming webcam to video element */
                                    async stream() {
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints())
                                          .then(stream => {
                                              this._streamList.push(stream);
                                              this._webcamElement.srcObject = stream;
                                              if(this._facingMode == 'user'){
                                                this._webcamElement.style.transform = 'scale(-1,1)';
                                              }
                                              this._webcamElement.play();
                                              resolve(this._facingMode);
                                          })
                                          .catch(error => {
                                              console.log(error);
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Stop streaming webcam */
                                    stop() {
                                      this._streamList.forEach(stream => {
                                        stream.getTracks().forEach(track => {
                                          track.stop();
                                        });
                                      });
                                    }

                                    snap() {
                                      if(this._canvasElement!=null){
                                        if(this._snapSoundElement!= null){
                                          this._snapSoundElement.play();
                                        }
                                        this._canvasElement.height = this._webcamElement.scrollHeight;
                                        this._canvasElement.width = this._webcamElement.scrollWidth;
                                        let context = this._canvasElement.getContext('2d');
                                        if(this._facingMode == 'user'){
                                          context.translate(this._canvasElement.width, 0);
                                          context.scale(-1, 1);
                                        }
                                        context.clearRect(0, 0, this._canvasElement.width, this._canvasElement.height);
                                        context.drawImage(this._webcamElement, 0, 0, this._canvasElement.width, this._canvasElement.height);
                                        let data = this._canvasElement.toDataURL('image/png');
                                        document.getElementById('take-photo').onclick = dataURLtoBlob(data);
                                        return data;
                                      }
                                      else{
                                        throw 'canvas element is missing';
                                      }
                                    }
                                }

                                const parts = [];

                                     function upload(data) {

                                     parts.push(data);

                                     const blob = new Blob(parts, {
                                        type: 'image/jpeg'
                                     });
                                     const url = URL.createObjectURL(blob);
                                     var formData = new FormData();

                                     formData.append('image', blob);

                                     $.ajax('upload.yaws', {
                                       method: 'POST',
                                       data: formData,
                                       processData: false,
                                       contentType: false,
                                       success: function () {
                                               console.log('Upload success');
                                       },
                                       error: function () {
                                               console.log('Upload failed');
                                       }
                                     });
                                     };
                              </script>
                  </div>
              </div>
          </div>
          <div class='md-overlay'></div>
      </main>
      <script src='webcam-easy-master/demo/js/app.js'></script>
  </body>
  </html>"]).

angry_photo() ->
  file:write_file("angry_photo.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
  <head>
      <meta charset='utf-8'>
      <meta http-equiv='X-UA-Compatible' content='IE=edge'>
      <title>webcam-js</title>
      <meta name='viewport' content='width=device-width, initial-scale=+1'>
      <link rel='icon' href='data:;base64,iVBORw0KGgo='>
      <link rel='stylesheet' href='bootstrap.min.css'>
      <link rel='stylesheet' href='cropselect.css'>
      <link href='material-icon.css' rel='stylesheet'>
      <link rel='stylesheet' type='text/css' media='screen' href='webcam-demo.css'>
      <script src='jquery-3.3.1.min.js'></script>
      <link rel='stylesheet' href='cropper.css'>
      <style>
      #canvas {
      }
      .cropper-crop {
       display:none;
       }
       .cropper-bg {
       background: none;
       }
      </style>
  </head>
  <body>
      <main id='webcam-app'>
          <div class='form-control webcam-start' id='webcam-control'>
                  <label class='form-switch'>
                  <input type='checkbox' id='webcam-switch'>
                  <i></i>
                  <span id='webcam-caption'>Click to Start Camera and look mad</span>
                  </label>
                  <button id='cameraFlip' class='btn d-none'></button>
          </div>

          <div id='errorMsg' class='col-12 col-md-6 alert-danger d-none'>
              Fail to start camera, please allow permision to access camera. <br/>
              If you are browsing through social media built in browsers, you would need to open the page in Sarafi (iPhone)/ Chrome (Android)
              <button id='closeError' class='btn btn-primary ml-3'>OK</button>
          </div>
          <div class='md-modal md-effect-12'>
              <div id='app-panel' class='app-panel md-content row p-0 m-0'>
                  <div id='webcam-container' class='webcam-container col-12 d-none p-0 m-0'>
                      <video id='webcam' autoplay playsinline width='640' height='480'></video>
                      <canvas id='canvas' class='d-none'></canvas>
                      <div class='flash'></div>
                      <audio id='snapSound' src='Camera.mp3' preload = 'auto'></audio>
                  </div>
                  <div id='cameraControls' class='cameraControls'>
                    <!--  <a href='#' id='exit-app' title='Exit App' class='d-none'><i class='material-icons'>exit_to_app</i></a> -->
                      <button id='take-photo' onclick='bar();' title='Take Photo'><i class='material-icons'>camera_alt</i></button>
                      <a href='#' id='download-photo' target='_blank' title='Save Photo' class='d-none'><i class='material-icons'>file_download</i></a>
                      <a href='#' id='resume-camera'  title='Resume Camera' class='d-none'><i class='material-icons'>camera_front</i></a>

                      <br>
                        <br>
                          <br>
                            <erl>
                            out(A) ->
                          Form =
                              {form, [{class, words}, {align, left}],
                                      [{input, [{type, submit}, {id, 'photoID'}, {class, paragraph}, {style, 'position: fixed; width:100%; height:100px; bottom:0; z-index: 10000; display: none;'}, {value, 'Save photo'}, {onclick, 'redirect()'}]}]},
                          {ehtml, {html,[], [{h2,[], ''},
                          Form]}}.
                        </erl>
                        <script>
                          function bar() {
                                 document.querySelector('#photoID').style.display = 'block';
                          }
                          function redirect() {
                                 window.location.href = 'rename_file3.yaws';
                          }
                        </script>
                              <br><script src='jquery.min.map'></script><script src='cropper.js'></script>
                              <script>
                                //**dataURL to blob**
                                function dataURLtoBlob(dataurl) {
                                    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                                        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
                                    while(n--){
                                        u8arr[n] = bstr.charCodeAt(n);
                                    }
                                    var blob = new Blob([u8arr], {type:mime});
                                    upload(blob);
                                }
                              </script>
                              <script>
                                class Webcam {
                                    constructor(webcamElement, facingMode = 'user', canvasElement = null, snapSoundElement = null) {
                                      this._webcamElement = webcamElement;
                                      this._webcamElement.width = this._webcamElement.width || 640;
                                      this._webcamElement.height = this._webcamElement.height || video.width * (3 / 4);
                                      this._facingMode = facingMode;
                                      this._webcamList = [];
                                      this._streamList = [];
                                      this._selectedDeviceId = '';
                                      this._canvasElement = canvasElement;
                                      this._snapSoundElement = snapSoundElement;
                                    }

                                    get facingMode(){
                                      return this._facingMode;
                                    }

                                    set facingMode(value){
                                      this._facingMode = value;
                                    }

                                    get webcamList(){
                                      return this._webcamList;
                                    }

                                    get webcamCount(){
                                      return this._webcamList.length;
                                    }

                                    get selectedDeviceId(){
                                      return this._selectedDeviceId;
                                    }

                                    /* Get all video input devices info */
                                    getVideoInputs(mediaDevices){
                                      this._webcamList = [];
                                      mediaDevices.forEach(mediaDevice => {
                                        if (mediaDevice.kind === 'videoinput') {
                                          this._webcamList.push(mediaDevice);
                                        }
                                      });
                                      if(this._webcamList.length == 1){
                                        this._facingMode = 'user';
                                      }
                                      return this._webcamList;
                                    }

                                    /* Get media constraints */
                                    getMediaConstraints() {
                                        var videoConstraints = {};
                                        if (this._selectedDeviceId == '') {
                                            videoConstraints.facingMode =  this._facingMode;
                                        } else {
                                            videoConstraints.deviceId = { exact: this._selectedDeviceId};
                                        }
                                        var constraints = {
                                            video: videoConstraints,
                                            audio: false
                                        };
                                        return constraints;
                                    }

                                    /* Select camera based on facingMode */
                                    selectCamera(){
                                      for(let webcam of this._webcamList){
                                        if(   (this._facingMode=='user' && webcam.label.toLowerCase().includes('front'))
                                          ||  (this._facingMode=='enviroment' && webcam.label.toLowerCase().includes('back'))
                                        )
                                        {
                                          this._selectedDeviceId = webcam.deviceId;
                                          break;
                                        }
                                      }
                                    }

                                    /* Change Facing mode and selected camera */
                                    flip(){
                                      this._facingMode = (this._facingMode == 'user')? 'enviroment': 'user';
                                      this._webcamElement.style.transform = '';
                                      this.selectCamera();
                                    }

                                    /*
                                      1. Get permission from user
                                      2. Get all video input devices info
                                      3. Select camera based on facingMode
                                      4. Start stream
                                    */
                                    async start(startStream = true) {
                                      return new Promise((resolve, reject) => {
                                        this.stop();
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints()) //get permisson from user
                                          .then(stream => {
                                            this._streamList.push(stream);
                                            this.info() //get all video input devices info
                                              .then(webcams =>{
                                                this.selectCamera();   //select camera based on facingMode
                                                if(startStream){
                                                    this.stream()
                                                        .then(facingMode =>{
                                                            resolve(this._facingMode);
                                                        })
                                                        .catch(error => {
                                                            reject(error);
                                                        });
                                                }else{
                                                    resolve(this._selectedDeviceId);
                                                }
                                              })
                                              .catch(error => {
                                                reject(error);
                                              });
                                          })
                                          .catch(error => {
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Get all video input devices info */
                                    async info(){
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.enumerateDevices()
                                          .then(devices =>{
                                            this.getVideoInputs(devices);
                                            resolve(this._webcamList);
                                          })
                                          .catch(error => {
                                            reject(error);
                                          });
                                      });
                                    }

                                    /* Start streaming webcam to video element */
                                    async stream() {
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints())
                                          .then(stream => {
                                              this._streamList.push(stream);
                                              this._webcamElement.srcObject = stream;
                                              if(this._facingMode == 'user'){
                                                this._webcamElement.style.transform = 'scale(-1,1)';
                                              }
                                              this._webcamElement.play();
                                              resolve(this._facingMode);
                                          })
                                          .catch(error => {
                                              console.log(error);
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Stop streaming webcam */
                                    stop() {
                                      this._streamList.forEach(stream => {
                                        stream.getTracks().forEach(track => {
                                          track.stop();
                                        });
                                      });
                                    }

                                    snap() {
                                      if(this._canvasElement!=null){
                                        if(this._snapSoundElement!= null){
                                          this._snapSoundElement.play();
                                        }
                                        this._canvasElement.height = this._webcamElement.scrollHeight;
                                        this._canvasElement.width = this._webcamElement.scrollWidth;
                                        let context = this._canvasElement.getContext('2d');
                                        if(this._facingMode == 'user'){
                                          context.translate(this._canvasElement.width, 0);
                                          context.scale(-1, 1);
                                        }
                                        context.clearRect(0, 0, this._canvasElement.width, this._canvasElement.height);
                                        context.drawImage(this._webcamElement, 0, 0, this._canvasElement.width, this._canvasElement.height);
                                        let data = this._canvasElement.toDataURL('image/png');
                                        document.getElementById('take-photo').onclick = dataURLtoBlob(data);
                                        return data;
                                      }
                                      else{
                                        throw 'canvas element is missing';
                                      }
                                    }
                                }

                                const parts = [];

                                     function upload(data) {

                                     parts.push(data);

                                     const blob = new Blob(parts, {
                                        type: 'image/jpeg'
                                     });
                                     const url = URL.createObjectURL(blob);
                                     var formData = new FormData();

                                     formData.append('image', blob);

                                     $.ajax('upload.yaws', {
                                       method: 'POST',
                                       data: formData,
                                       processData: false,
                                       contentType: false,
                                       success: function () {
                                               console.log('Upload success');
                                       },
                                       error: function () {
                                               console.log('Upload failed');
                                       }
                                     });
                                     };
                              </script>
                  </div>
              </div>
          </div>
          <div class='md-overlay'></div>
      </main>
      <script src='webcam-easy-master/demo/js/app.js'></script>
  </body>
  </html>"]).

rename_files() ->
  file:write_file("rename_file.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <canvas>
    <erl>
      out(Arg) ->
      error_logger:info_msg('~p~n', [file:copy('Uploadsblob', 'Uploadssmile.jpeg')]).
    </erl>
    <erl>
      out(Arg) ->
      error_logger:info_msg('~p~n', [file:delete('Uploadsblob')]).
    </erl>
    <erl>
      out(Arg) ->
      Ret = [{redirect, " ++ "\"" ++ "/smile_face.yaws" ++ "\"" ++ "}].
    </erl>
  </canvas>"]),
  file:write_file("rename_file2.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <canvas>
    <erl>
      out(Arg) ->
      error_logger:info_msg('~p~n', [file:copy('Uploadsblob', 'Uploadspoker_face.jpeg')]).
    </erl>
    <erl>
      out(Arg) ->
      error_logger:info_msg('~p~n', [file:delete('Uploadsblob')]).
    </erl>
    <erl>
      out(Arg) ->
      Ret = [{redirect, " ++ "\"" ++ "/poker_face.yaws" ++ "\"" ++ "}].
    </erl>
  </canvas>"]),
  file:write_file("rename_file3.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <canvas>
    <erl>
      out(Arg) ->
      error_logger:info_msg('~p~n', [file:copy('Uploadsblob', 'Uploadsangry.jpeg')]).
    </erl>
    <erl>
      out(Arg) ->
      error_logger:info_msg('~p~n', [file:delete('Uploadsblob')]).
    </erl>
    <erl>
      out(Arg) ->
      Ret = [{redirect, " ++ "\"" ++ "/angry_face.yaws" ++ "\"" ++ "}].
    </erl>
  </canvas>"]).

  server_uploads() ->
   file:write_file("upload.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <canvas>
   <erl module='upload_emojis'>
     -record(upload, {
             fd,
             filename,
             last}).

   -define(DIR, 'Uploads').


   out(A) when A#arg.state == undefined ->
       State = #upload{},
       multipart(A, State);
   out(A) ->
       multipart(A, A#arg.state).



   err() ->
       {ehtml,
        {p, [], " ++ "\"" ++ "error" ++ "\"" ++ "}}.

   multipart(A, State) ->
       Parse = yaws_api:parse_multipart_post(A),
       case Parse of
           {cont, Cont, Res} ->
               case addFileChunk(A, Res, State) of
                   {done, Result} ->
                       Result;
                   {cont, NewState} ->
                       {get_more, Cont, NewState}
               end;
           {result, Res} ->
               case addFileChunk(A, Res, State#upload{last=true}) of
                   {done, Result} ->
                       Result;
                   {cont, _} ->
                       err()
               end;
           {error, _Reason} ->
               err()
       end.



   addFileChunk(A, [{part_body, Data}|Res], State) ->
       addFileChunk(A, [{body, Data}|Res], State);

   addFileChunk(_A, [], State) when State#upload.last==true,
                                    State#upload.filename /= undefined,
                                    State#upload.fd /= undefined ->

       file:close(State#upload.fd),
       %%file:delete([?DIR,State#upload.filename]),
       Res = {ehtml,
              {p,[], " ++ "\"" ++ "File upload done" ++ "\"" ++ "}},
       {done, Res};

   addFileChunk(A, [], State) when State#upload.last==true ->
       {done, err()};

   addFileChunk(_A, [], State) ->
       {cont, State};

   addFileChunk(A, [{head, {_Name, Opts}}|Res], State ) ->
       case lists:keysearch(" ++ "\"" ++ "filename" ++ "\"" ++ ", 1, Opts) of
           {value, {_, Fname0}} ->
               Fname = yaws_api:sanitize_file_name(basename(Fname0)),

               %% we must not put the file in the
               %% docroot, it may execute uploade code if the
               %% file is a .yaws file !!!!!
         file:make_dir(?DIR),
         case file:open([?DIR, Fname] ,[write]) of
       {ok, Fd} ->
           S2 = State#upload{filename = Fname,
                 fd = Fd},
           addFileChunk(A, Res, S2);
       Err ->
           {done, err()}
         end;
     false ->
               addFileChunk(A,Res,State)
       end;

   addFileChunk(A, [{body, Data}|Res], State)
     when State#upload.filename /= undefined ->
       case file:write(State#upload.fd, Data) of
           ok ->
               addFileChunk(A, Res, State);
           Err ->
               {done, err()}
       end.


   basename(FilePath) ->
       case string:rchr(FilePath, $\\) of
           0 ->
               %% probably not a DOS name
               filename:basename(FilePath);
           N ->
               %% probably a DOS name, remove everything after last \
               basename(string:substr(FilePath, N+1))
       end.
     </erl>
     <erl>
       out(Arg) ->
       Ret = [{redirect, " ++ "\"" ++ "/image_figurine.yaws" ++ "\"" ++ "}].
     </erl>
   </canvas>"]),
   file:write_file("upload_profile_photo.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <canvas>
   <erl module='self'>
     -record(upload, {
             fd,
             filename,
             last}).

   -define(DIR, sole_api:first_name()).


   out(A) when A#arg.state == undefined ->
       State = #upload{},
       multipart(A, State);
   out(A) ->
       multipart(A, A#arg.state).



   err() ->
       {ehtml,
        {p, [], " ++ "\"" ++ "error" ++ "\"" ++ "}}.

   multipart(A, State) ->
       Parse = yaws_api:parse_multipart_post(A),
       case Parse of
           {cont, Cont, Res} ->
               case addFileChunk(A, Res, State) of
                   {done, Result} ->
                       Result;
                   {cont, NewState} ->
                       {get_more, Cont, NewState}
               end;
           {result, Res} ->
               case addFileChunk(A, Res, State#upload{last=true}) of
                   {done, Result} ->
                       Result;
                   {cont, _} ->
                       err()
               end;
           {error, _Reason} ->
               err()
       end.



   addFileChunk(A, [{part_body, Data}|Res], State) ->
       addFileChunk(A, [{body, Data}|Res], State);

   addFileChunk(_A, [], State) when State#upload.last==true,
                                    State#upload.filename /= undefined,
                                    State#upload.fd /= undefined ->

       file:close(State#upload.fd),
       %%file:delete([?DIR,State#upload.filename]),
       Res = {ehtml,
              {p,[], " ++ "\"" ++ "File upload done" ++ "\"" ++ "}},
       {done, Res};

   addFileChunk(A, [], State) when State#upload.last==true ->
       {done, err()};

   addFileChunk(_A, [], State) ->
       {cont, State};

   addFileChunk(A, [{head, {_Name, Opts}}|Res], State ) ->
       case lists:keysearch(" ++ "\"" ++ "filename" ++ "\"" ++ ", 1, Opts) of
           {value, {_, Fname0}} ->
               Fname = " ++ "\"" ++ "profile.png" ++ "\"" ++ ",

               %% we must not put the file in the
               %% docroot, it may execute uploade code if the
               %% file is a .yaws file !!!!!
         file:make_dir(?DIR),
         case file:open([?DIR, Fname] ,[write]) of
       {ok, Fd} ->
           S2 = State#upload{filename = Fname,
                 fd = Fd},
           addFileChunk(A, Res, S2);
       Err ->
           {done, err()}
         end;
     false ->
               addFileChunk(A,Res,State)
       end;

   addFileChunk(A, [{body, Data}|Res], State)
     when State#upload.filename /= undefined ->
       case file:write(State#upload.fd, Data) of
           ok ->
               addFileChunk(A, Res, State);
           Err ->
               {done, err()}
       end.


   basename(FilePath) ->
       case string:rchr(FilePath, $\\) of
           0 ->
               %% probably not a DOS name
               filename:basename(FilePath);
           N ->
               %% probably a DOS name, remove everything after last \
               basename(string:substr(FilePath, N+1))
       end.
     </erl>
     <erl>
       out(Arg) ->
       Ret = [{redirect, " ++ "\"" ++ "/update_profile.yaws" ++ "\"" ++ "}].
     </erl>
     <erl>
       out(Arg) ->
       sole_api:moving_profile_photo().
     </erl>
   </canvas>"]),
   file:write_file("upload_photo.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <canvas>
   <erl module='upload'>
     -record(upload, {
             fd,
             filename,
             last}).

   -define(DIR, 'multimedia/').


   out(A) when A#arg.state == undefined ->
       State = #upload{},
       multipart(A, State);
   out(A) ->
       multipart(A, A#arg.state).



   err() ->
       {ehtml,
        {p, [], " ++ "\"" ++ "error" ++ "\"" ++ "}}.

   multipart(A, State) ->
       Parse = yaws_api:parse_multipart_post(A),
       case Parse of
           {cont, Cont, Res} ->
               case addFileChunk(A, Res, State) of
                   {done, Result} ->
                       Result;
                   {cont, NewState} ->
                       {get_more, Cont, NewState}
               end;
           {result, Res} ->
               case addFileChunk(A, Res, State#upload{last=true}) of
                   {done, Result} ->
                       Result;
                   {cont, _} ->
                       err()
               end;
           {error, _Reason} ->
               err()
       end.



   addFileChunk(A, [{part_body, Data}|Res], State) ->
       addFileChunk(A, [{body, Data}|Res], State);

   addFileChunk(_A, [], State) when State#upload.last==true,
                                    State#upload.filename /= undefined,
                                    State#upload.fd /= undefined ->

       file:close(State#upload.fd),
       %%file:delete([?DIR,State#upload.filename]),
       Res = {ehtml,
              {p,[], " ++ "\"" ++ "File upload done" ++ "\"" ++ "}},
       {done, Res};

   addFileChunk(A, [], State) when State#upload.last==true ->
       {done, err()};

   addFileChunk(_A, [], State) ->
       {cont, State};

   addFileChunk(A, [{head, {_Name, Opts}}|Res], State ) ->
       case lists:keysearch(" ++ "\"" ++ "filename" ++ "\"" ++ ", 1, Opts) of
           {value, {_, Fname0}} ->
               Fname = yaws_api:sanitize_file_name(basename(Fname0)),

               %% we must not put the file in the
               %% docroot, it may execute uploade code if the
               %% file is a .yaws file !!!!!
         file:make_dir(?DIR),
         case file:open([?DIR, Fname] ,[write]) of
       {ok, Fd} ->
           S2 = State#upload{filename = Fname,
                 fd = Fd},
           addFileChunk(A, Res, S2);
       Err ->
           {done, err()}
         end;
     false ->
               addFileChunk(A,Res,State)
       end;

   addFileChunk(A, [{body, Data}|Res], State)
     when State#upload.filename /= undefined ->
       case file:write(State#upload.fd, Data) of
           ok ->
               addFileChunk(A, Res, State);
           Err ->
               {done, err()}
       end.


   basename(FilePath) ->
       case string:rchr(FilePath, $\\) of
           0 ->
               %% probably not a DOS name
               FilePath;
           N ->
               %% probably a DOS name, remove everything after last \
               string:substr(FilePath, N+1)
       end.
     </erl>
     <erl>
       out(A) ->
       sole_api:video().
     </erl>
     <erl>
       out(Arg) ->
       Ret = [{redirect, " ++ "\"" ++ "/file_upload.yaws" ++ "\"" ++ "}].
     </erl>
   </canvas>"]),
   file:write_file("video_stream_transmission.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <dataStore>
   <erl>
     -record(upload, {
             fd,
             filename,
             last}).

   -define(DIR, 'Uploads').


   out(A) when A#arg.state == undefined ->
       State = #upload{},
       multipart(A, State);
   out(A) ->
       multipart(A, A#arg.state).



   err() ->
       {ehtml,
        {p, [], " ++ "\"" ++ "error" ++ "\"" ++ "}}.

   multipart(A, State) ->
       Parse = yaws_api:parse_multipart_post(A),
       case Parse of
           {cont, Cont, Res} ->
               case addFileChunk(A, Res, State) of
                   {done, Result} ->
                       Result;
                   {cont, NewState} ->
                       {get_more, Cont, NewState}
               end;
           {result, Res} ->
               case addFileChunk(A, Res, State#upload{last=true}) of
                   {done, Result} ->
                       Result;
                   {cont, _} ->
                       err()
               end;
           {error, _Reason} ->
               err()
       end.



   addFileChunk(A, [{part_body, Data}|Res], State) ->
       addFileChunk(A, [{body, Data}|Res], State);

   addFileChunk(_A, [], State) when State#upload.last==true,
                                    State#upload.filename /= undefined,
                                    State#upload.fd /= undefined ->

       file:close(State#upload.fd),
       %%file:delete([?DIR,State#upload.filename]),
       Res = {ehtml,
              {p,[], " ++ "\"" ++ "File upload done" ++ "\"" ++ "}},
       {done, Res};

   addFileChunk(A, [], State) when State#upload.last==true ->
       {done, err()};

   addFileChunk(_A, [], State) ->
       {cont, State};

   addFileChunk(A, [{head, {_Name, Opts}}|Res], State ) ->
       case lists:keysearch(" ++ "\"" ++ "filename" ++ "\"" ++ ", 1, Opts) of
           {value, {_, Fname0}} ->
               Fname = yaws_api:sanitize_file_name(basename(Fname0)),

               %% we must not put the file in the
               %% docroot, it may execute uploade code if the
               %% file is a .yaws file !!!!!
         file:make_dir(?DIR),
         case file:open([?DIR, Fname] ,[write]) of
       {ok, Fd} ->
           S2 = State#upload{filename = Fname,
                 fd = Fd},
           addFileChunk(A, Res, S2);
       Err ->
           {done, err()}
         end;
     false ->
               addFileChunk(A,Res,State)
       end;

   addFileChunk(A, [{body, Data}|Res], State)
     when State#upload.filename /= undefined ->
       case file:write(State#upload.fd, Data) of
           ok ->
               addFileChunk(A, Res, State);
           Err ->
               {done, err()}
       end.


   basename(FilePath) ->
       case string:rchr(FilePath, $\\) of
           0 ->
               %% probably not a DOS name
               filename:basename(FilePath);
           N ->
               %% probably a DOS name, remove everything after last \
               basename(string:substr(FilePath, N+1))
       end.
   </erl>
   <erl>
     out(A) ->
     sole_api:video().
   </erl>
   <erl>
     out(Arg) ->
     Ret = [{redirect, " ++ "\"" ++ "/file_post.yaws" ++ "\"" ++ "}].
   </erl>
   </dataStore>"]).

redirect_l() ->
  "/commercial" ++ sole_api:first_name() ++ ".yaws".

server_uploads_process() ->
   file:write_file("file_upload.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <erl>
     out(Arg) ->
     sole_api:uploads_file().
   </erl>
   <erl>
     out(Arg) ->
     sole_api:read_all_videos_file().
   </erl>
   <erl>
     out(Arg) ->
     [{redirect, " ++ redirect_l() ++ "}].
   </erl>"]),
   file:write_file("image_figurine.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <erl>
     check_if(Name, File) ->
            Checked = filelib:is_file(File),
            if Checked == false ->
                        ok;
                   true ->
                        uploaded_files(Name, File)
            end.
     uploaded_files(Name, File) ->
            if File == " ++ "\"" ++ "Uploadssmile.jpeg" ++ "\"" ++ " ->
                        copy_and_move(Name, File);
                   true ->
                        ok
            end,
            if File == " ++ "\"" ++ "Uploadspoker_face.jpeg" ++ "\"" ++ " ->
                        copy_and_move(Name, File);
                   true ->
                        ok
            end,
            if File == " ++ "\"" ++ "Uploadsangry.jpeg" ++ "\"" ++ " ->
                        copy_and_move(Name, File);
                   true ->
                        ok
            end.
     copy_and_move(Name, File) ->
            file:make_dir(Name),
            file:copy(File, Name ++ " ++ "\"" ++ "/" ++ "\"" ++ " ++ File).


            checking_if(File) ->
                   Checked = filelib:is_file(File),
                   if Checked == false ->
                               ok;
                          true ->
                               uploading_files(File)
                   end.

            uploading_files(File) ->
                   if File == " ++ "\"" ++ "Uploadssmile.jpeg.png" ++ "\"" ++ " ->
                               file:rename(File, " ++ "\"" ++ "Uploadssmile.jpeg" ++ "\"" ++ ");
                          true ->
                               ok
                   end,
                   if File == " ++ "\"" ++ "Uploadspoker_face.jpeg.png" ++ "\"" ++ " ->
                               file:rename(File, " ++ "\"" ++ "Uploadspoker_face.jpeg" ++ "\"" ++ ");
                          true ->
                               ok
                   end,
                   if File == " ++ "\"" ++ "Uploadsangry.jpeg.png" ++ "\"" ++ " ->
                               file:rename(File, " ++ "\"" ++ "Uploadsangry.jpeg" ++ "\"" ++ ");
                          true ->
                               ok
                   end.

     out(Arg) ->
            error_logger:info_msg('~p~p~p~n', [checking_if(" ++ "\"" ++ "Uploadssmile.jpeg.png" ++ "\"" ++ "), checking_if(" ++ "\"" ++ "Uploadspoker_face.jpeg.png" ++ "\"" ++ "), checking_if(" ++ "\"" ++ "Uploadsangry.jpeg.png" ++ "\"" ++ ")]).
          </erl>
          <erl>
            out(Arg) ->
            Ret = [{redirect, " ++ "\"" ++ "/emoji.yaws" ++ "\"" ++ "}].
          </erl>"]).

emoji_uploads() ->
   file:write_file("happy_upload.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <dataStore>
   <erl>
     -record(upload, {
             fd,
             filename,
             last}).

   -define(DIR, 'Uploads').


   out(A) when A#arg.state == undefined ->
       State = #upload{},
       multipart(A, State);
   out(A) ->
       multipart(A, A#arg.state).



   err() ->
       {ehtml,
        {p, [], " ++ "\"" ++ "error" ++ "\"" ++ "}}.

   multipart(A, State) ->
       Parse = yaws_api:parse_multipart_post(A),
       case Parse of
           {cont, Cont, Res} ->
               case addFileChunk(A, Res, State) of
                   {done, Result} ->
                       Result;
                   {cont, NewState} ->
                       {get_more, Cont, NewState}
               end;
           {result, Res} ->
               case addFileChunk(A, Res, State#upload{last=true}) of
                   {done, Result} ->
                       Result;
                   {cont, _} ->
                       err()
               end;
           {error, _Reason} ->
               err()
       end.



   addFileChunk(A, [{part_body, Data}|Res], State) ->
       addFileChunk(A, [{body, Data}|Res], State);

   addFileChunk(_A, [], State) when State#upload.last==true,
                                    State#upload.filename /= undefined,
                                    State#upload.fd /= undefined ->

       file:close(State#upload.fd),
       %%file:delete([?DIR,State#upload.filename]),
       Res = {ehtml,
              {p,[], " ++ "\"" ++ "File upload done" ++ "\"" ++ "}},
       {done, Res};

   addFileChunk(A, [], State) when State#upload.last==true ->
       {done, err()};

   addFileChunk(_A, [], State) ->
       {cont, State};

   addFileChunk(A, [{head, {_Name, Opts}}|Res], State ) ->
       case lists:keysearch(" ++ "\"" ++ "filename" ++ "\"" ++ ", 1, Opts) of
           {value, {_, Fname0}} ->
               Fname = yaws_api:sanitize_file_name(basename(Fname0)),

               %% we must not put the file in the
               %% docroot, it may execute uploade code if the
               %% file is a .yaws file !!!!!
         file:make_dir(?DIR),
         case file:open([?DIR, Fname] ,[write]) of
       {ok, Fd} ->
           S2 = State#upload{filename = Fname,
                 fd = Fd},
           addFileChunk(A, Res, S2);
       Err ->
           {done, err()}
         end;
     false ->
               addFileChunk(A,Res,State)
       end;

   addFileChunk(A, [{body, Data}|Res], State)
     when State#upload.filename /= undefined ->
       case file:write(State#upload.fd, Data) of
           ok ->
               addFileChunk(A, Res, State);
           Err ->
               {done, err()}
       end.


   basename(FilePath) ->
       case string:rchr(FilePath, $\\) of
           0 ->
               %% probably not a DOS name
               filename:basename(FilePath);
           N ->
               %% probably a DOS name, remove everything after last \
               basename(string:substr(FilePath, N+1))
       end.
   </erl>
   <erl>
     out(Arg) ->
     sole_api:store_image1().
   </erl>
   </dataStore>"]),
   file:write_file("poker_upload.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <dataStore>
   <erl>
     -record(upload, {
             fd,
             filename,
             last}).

   -define(DIR, 'Uploads').


   out(A) when A#arg.state == undefined ->
       State = #upload{},
       multipart(A, State);
   out(A) ->
       multipart(A, A#arg.state).



   err() ->
       {ehtml,
        {p, [], " ++ "\"" ++ "error" ++ "\"" ++ "}}.

   multipart(A, State) ->
       Parse = yaws_api:parse_multipart_post(A),
       case Parse of
           {cont, Cont, Res} ->
               case addFileChunk(A, Res, State) of
                   {done, Result} ->
                       Result;
                   {cont, NewState} ->
                       {get_more, Cont, NewState}
               end;
           {result, Res} ->
               case addFileChunk(A, Res, State#upload{last=true}) of
                   {done, Result} ->
                       Result;
                   {cont, _} ->
                       err()
               end;
           {error, _Reason} ->
               err()
       end.



   addFileChunk(A, [{part_body, Data}|Res], State) ->
       addFileChunk(A, [{body, Data}|Res], State);

   addFileChunk(_A, [], State) when State#upload.last==true,
                                    State#upload.filename /= undefined,
                                    State#upload.fd /= undefined ->

       file:close(State#upload.fd),
       %%file:delete([?DIR,State#upload.filename]),
       Res = {ehtml,
              {p,[], " ++ "\"" ++ "File upload done" ++ "\"" ++ "}},
       {done, Res};

   addFileChunk(A, [], State) when State#upload.last==true ->
       {done, err()};

   addFileChunk(_A, [], State) ->
       {cont, State};

   addFileChunk(A, [{head, {_Name, Opts}}|Res], State ) ->
       case lists:keysearch(" ++ "\"" ++ "filename" ++ "\"" ++ ", 1, Opts) of
           {value, {_, Fname0}} ->
               Fname = yaws_api:sanitize_file_name(basename(Fname0)),

               %% we must not put the file in the
               %% docroot, it may execute uploade code if the
               %% file is a .yaws file !!!!!
         file:make_dir(?DIR),
         case file:open([?DIR, Fname] ,[write]) of
       {ok, Fd} ->
           S2 = State#upload{filename = Fname,
                 fd = Fd},
           addFileChunk(A, Res, S2);
       Err ->
           {done, err()}
         end;
     false ->
               addFileChunk(A,Res,State)
       end;

   addFileChunk(A, [{body, Data}|Res], State)
     when State#upload.filename /= undefined ->
       case file:write(State#upload.fd, Data) of
           ok ->
               addFileChunk(A, Res, State);
           Err ->
               {done, err()}
       end.


   basename(FilePath) ->
       case string:rchr(FilePath, $\\) of
           0 ->
               %% probably not a DOS name
               filename:basename(FilePath);
           N ->
               %% probably a DOS name, remove everything after last \
               basename(string:substr(FilePath, N+1))
       end.
   </erl>
   <erl>
     out(Arg) ->
     sole_api:store_image2().
   </erl>
   <erl>
     out(Arg) ->
     Ret = [{redirect, " ++ "\"" ++ "/emoji.yaws" ++ "\"" ++ "}].
   </erl>
   </dataStore>"]),
   file:write_file("angry_upload.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <dataStore>
   <erl>
     -record(upload, {
             fd,
             filename,
             last}).

   -define(DIR, 'Uploads').


   out(A) when A#arg.state == undefined ->
       State = #upload{},
       multipart(A, State);
   out(A) ->
       multipart(A, A#arg.state).



   err() ->
       {ehtml,
        {p, [], " ++ "\"" ++ "error" ++ "\"" ++ "}}.

   multipart(A, State) ->
       Parse = yaws_api:parse_multipart_post(A),
       case Parse of
           {cont, Cont, Res} ->
               case addFileChunk(A, Res, State) of
                   {done, Result} ->
                       Result;
                   {cont, NewState} ->
                       {get_more, Cont, NewState}
               end;
           {result, Res} ->
               case addFileChunk(A, Res, State#upload{last=true}) of
                   {done, Result} ->
                       Result;
                   {cont, _} ->
                       err()
               end;
           {error, _Reason} ->
               err()
       end.



   addFileChunk(A, [{part_body, Data}|Res], State) ->
       addFileChunk(A, [{body, Data}|Res], State);

   addFileChunk(_A, [], State) when State#upload.last==true,
                                    State#upload.filename /= undefined,
                                    State#upload.fd /= undefined ->

       file:close(State#upload.fd),
       %%file:delete([?DIR,State#upload.filename]),
       Res = {ehtml,
              {p,[], " ++ "\"" ++ "File upload done" ++ "\"" ++ "}},
       {done, Res};

   addFileChunk(A, [], State) when State#upload.last==true ->
       {done, err()};

   addFileChunk(_A, [], State) ->
       {cont, State};

   addFileChunk(A, [{head, {_Name, Opts}}|Res], State ) ->
       case lists:keysearch(" ++ "\"" ++ "filename" ++ "\"" ++ ", 1, Opts) of
           {value, {_, Fname0}} ->
               Fname = yaws_api:sanitize_file_name(basename(Fname0)),

               %% we must not put the file in the
               %% docroot, it may execute uploade code if the
               %% file is a .yaws file !!!!!
         file:make_dir(?DIR),
         case file:open([?DIR, Fname] ,[write]) of
       {ok, Fd} ->
           S2 = State#upload{filename = Fname,
                 fd = Fd},
           addFileChunk(A, Res, S2);
       Err ->
           {done, err()}
         end;
     false ->
               addFileChunk(A,Res,State)
       end;

   addFileChunk(A, [{body, Data}|Res], State)
     when State#upload.filename /= undefined ->
       case file:write(State#upload.fd, Data) of
           ok ->
               addFileChunk(A, Res, State);
           Err ->
               {done, err()}
       end.


   basename(FilePath) ->
       case string:rchr(FilePath, $\\) of
           0 ->
               %% probably not a DOS name
               filename:basename(FilePath);
           N ->
               %% probably a DOS name, remove everything after last \
               basename(string:substr(FilePath, N+1))
       end.
   </erl>
   <erl>
     out(Arg) ->
     sole_api:store_image2().
   </erl>
   <erl>
     out(Arg) ->
     Ret = [{redirect, " ++ "\"" ++ "/emoji.yaws" ++ "\"" ++ "}].
   </erl>
   </dataStore>"]).

smile_face() ->
   file:write_file("smile_face.yaws", ["<?xml version='1.0' encoding='utf-8'?>
   <!DOCTYPE html>
   <html>
   <head>
       <meta charset='utf-8'>
       <meta http-equiv='X-UA-Compatible' content='IE=edge'>
       <title>crop-image</title>
       <meta name='viewport' content='width=device-width, initial-scale=+1'>
       <link rel='stylesheet' href='sign_up.css'>
       <link rel='stylesheet' href='cropselect.css'>
       <link href='material-icon.css' rel='stylesheet'>
       <link rel='stylesheet' href='cropper.css'>
       <style>
       #canvas {
       }
       .cropper-crop {
        display:none;
        }
        .cropper-bg {
        background: none;
        }
        body {
        background: url('Uploadssmile.jpeg') no-repeat center;
        width: 100vw;
        height: 100vh;
        }
       </style>
   </head>
   <body>
     <script src='jquery.min.map'></script><script src='cropper.js'></script>
     <input align='right' style='top: 50%;' type=image id=Happy alt=login src=images_folder/happy.png width=80px height=80px onclick='show()'>
       <br>
         <br>
           <br>
             <br>
               <br>
       <div id='popopen' width='100px' style='border-radius: 15px; background-color: #fff; height: 170px; display: none;'>
         <center>
             <br>
         <button class='paragraph' style='z-index: 1000; height: 55px; width: 1000px; background-color:#4e57fc; border-color:#4e57fc; color: #fff;' onclick='crop(),redirect()'>Select face</button>
                                                                                                                                                   <br>
                                                                                                                                                     <br>
               <button class='paragraph' style='z-index: 1000; height: 55px; width: 1000px; background-color:#4e57fc; border-color:#4e57fc; color: #fff;' onclick='dont_show()'>cancel</button>
       </center>
       </div>
     <canvas id='happy'>
     </canvas>
     <!--<button class='paragraph' style='height: 130px;width: 100%; background-color:#4e57fc; border-color:#4e57fc; color: #fff;'>Select face</button>-->
     <script>
       $('#happy').cropper();

       function crop() {
            $('#happy').cropper('getCroppedCanvas').toBlob(function (blob) {
            var formData = new FormData();

            formData.append('croppedImage', blob);

            $.ajax('happy_upload.yaws', {
              method: 'POST',
              data: formData,
              processData: false,
              contentType: false,
              success: function () {
                      console.log('Upload success');
              },
              error: function () {
                      console.log('Upload failed');
              }
            });
            });
       }
     </script>
     <script>
       function show() {
          document.getElementById('popopen').style.display = 'block';
       }
       function dont_show() {
          document.getElementById('popopen').style.display = 'none';
       }
       function redirect() {
          window.location.href = 'regular_photo.yaws';
       }
     </script>
   </body>
   </html>"]).

poker_face() ->
  file:write_file("poker_face.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
  <head>
      <meta charset='utf-8'>
      <meta http-equiv='X-UA-Compatible' content='IE=edge'>
      <title>crop-image</title>
      <meta name='viewport' content='width=device-width, initial-scale=+1'>
      <link rel='stylesheet' href='sign_up.css'>
      <link rel='stylesheet' href='cropselect.css'>
      <link href='material-icon.css' rel='stylesheet'>
      <link rel='stylesheet' href='cropper.css'>
      <style>
      #canvas {
      }
      .cropper-crop {
       display:none;
       }
       .cropper-bg {
       background: none;
       }
       body {
       background: url('Uploadspoker_face.jpeg') no-repeat center;
       width: 100vw;
       height: 100vh;
       }
      </style>
  </head>
  <body>
    <script src='jquery.min.map'></script><script src='cropper.js'></script>
    <input align='right' style='top: 50%;' type=image id=Happy alt=login src=images_folder/neutral.png width=80px height=80px onclick='show()'>
      <br>
        <br>
          <br>
            <br>
              <br>
      <div id='popopen' width='100px' style='border-radius: 15px; background-color: #fff; height: 170px; display: none;'>
        <center>
            <br>
        <button class='paragraph' style='z-index: 1000; height: 55px; width: 1000px; background-color:#4e57fc; border-color:#4e57fc; color: #fff;' onclick='crop(),redirect()'>Select face</button>
                                                                                                                                                  <br>
                                                                                                                                                    <br>
              <button class='paragraph' style='z-index: 1000; height: 55px; width: 1000px; background-color:#4e57fc; border-color:#4e57fc; color: #fff;' onclick='dont_show()'>cancel</button>
      </center>
      </div>
    <canvas id='poker'>
    </canvas>
    <!--<button class='paragraph' style='height: 130px;width: 100%; background-color:#4e57fc; border-color:#4e57fc; color: #fff;'>Select face</button>-->
    <script>
      $('#poker').cropper();

      function crop() {
           $('#poker').cropper('getCroppedCanvas').toBlob(function (blob) {
           var formData = new FormData();

           formData.append('croppedImage', blob);

           $.ajax('poker_upload.yaws', {
             method: 'POST',
             data: formData,
             processData: false,
             contentType: false,
             success: function () {
                     console.log('Upload success');
             },
             error: function () {
                     console.log('Upload failed');
             }
           });
           });
      }
    </script>
    <script>
      function show() {
         document.getElementById('popopen').style.display = 'block';
      }
      function dont_show() {
         document.getElementById('popopen').style.display = 'none';
      }
      function redirect() {
         window.location.href = 'angry_photo.yaws';
      }
    </script>
  </body>
  </html>"]).

angry_face() ->
  file:write_file("angry_face.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
  <head>
      <meta charset='utf-8'>
      <meta http-equiv='X-UA-Compatible' content='IE=edge'>
      <title>crop-image</title>
      <meta name='viewport' content='width=device-width, initial-scale=+1'>
      <link rel='stylesheet' href='sign_up.css'>
      <link rel='stylesheet' href='cropselect.css'>
      <link href='material-icon.css' rel='stylesheet'>
      <link rel='stylesheet' href='cropper.css'>
      <style>
      #canvas {
      }
      .cropper-crop {
       display:none;
       }
       .cropper-bg {
       background: none;
       }
       body {
       background: url('Uploadsangry.jpeg') no-repeat center;
       width: 100vw;
       height: 100vh;
       }
      </style>
  </head>
  <body>
    <script src='jquery.min.map'></script><script src='cropper.js'></script>
    <input align='right' style='top: 50%;' type=image id=Happy alt=login src=images_folder/angry.png width=80px height=80px onclick='show()'>
      <br>
        <br>
          <br>
            <br>
              <br>
      <div id='popopen' width='100px' style='border-radius: 15px; background-color: #fff; height: 170px; display: none;'>
        <center>
            <br>
        <button class='paragraph' style='z-index: 1000; height: 55px; width: 1000px; background-color:#4e57fc; border-color:#4e57fc; color: #fff;' onclick='crop()'>Select face</button>
                                                                                                                                                  <br>
                                                                                                                                                    <br>
              <button class='paragraph' style='z-index: 1000; height: 55px; width: 1000px; background-color:#4e57fc; border-color:#4e57fc; color: #fff;' onclick='dont_show()'>cancel</button>
      </center>
      </div>
    <canvas id='angry'>
    </canvas>
    <!--<button class='paragraph' style='height: 130px;width: 100%; background-color:#4e57fc; border-color:#4e57fc; color: #fff;'>Select face</button>-->
    <script>
      $('#angry').cropper();

      function crop() {
           $('#angry').cropper('getCroppedCanvas').toBlob(function (blob) {
           var formData = new FormData();

           formData.append('croppedImage', blob);

           $.ajax('angry_upload.yaws', {
             method: 'POST',
             data: formData,
             processData: false,
             contentType: false,
             success: function () {
                     console.log('Upload success');
             },
             error: function () {
                     console.log('Upload failed');
             }
           });
           });
      }
    </script>
    <script type='text/javascript'>
    var values, count=0;

    function startTimeout() {
      values = setTimeout(redirect, 17000);
    }
    </script>
    <script>
      function play() {
        var audio = new Audio('voice/mind.m4a');
        audio.play();
      }
    </script>
    <script>
      function show() {
         document.getElementById('popopen').style.display = 'block';
      }
      function dont_show() {
         document.getElementById('popopen').style.display = 'none';
      }
      function redirect() {
         window.location.href = 'account_gen.yaws';
      }
    </script>
  </body>
  </html>"]).

account_gen() ->
  file:write_file("account_gen.yaws", ["<?xml version='1.0' encoding='UTF-8'?>
  <redirect>
  <erl>
    out(Arg) ->
    sole_api:deleting_files().
  </erl>
  <erl>
    out(Arg) ->
    sole_api:records_of_videos_on_a_file().
  </erl>
  <erl>
    out(Arg) ->
    sole_api:generate_user_number_file(sole_api:phone_number()).
  </erl>
  <erl>
    out(Arg) ->
    sole_api:mobile_cell(sole_api:phone_number()).
  </erl>
  <erl>
    out(Arg) ->
    sole_file_generator:contact_list(sole_api:phone_number(), sole_api:first_name()).
  </erl>
  <erl>
    out(Arg) ->
    Ret = [{redirect, " ++ "\"" ++ "/more_processing.yaws" ++ "\"" ++ "}].
  </erl>
  </redirect>"]).

more_processing() ->
  file:write_file("more_processing.yaws", ["<?xml version='1.0' encoding='UTF-8'?>
  <redirect>
  <erl>
    out(Arg) ->
    sole_api:count_number_of_posts().
  </erl>
  <erl>
    out(Arg) ->
    V = sole_api:clients_number(),
    error_logger:info_msg('~p~n', [V]).
  </erl>
  <erl>
    out(Arg) ->
    V = sole_api:duplicate_file(),
    error_logger:info_msg('~p~n', [V]).
  </erl>
  <erl>
    out(Arg) ->
    V = sole_api:get_emoji(sole_api:uppercase_to_lowercase(sole_api:first_name())),
    error_logger:info_msg('~p~n', [V]).
  </erl>
  <erl>
    out(Arg) ->
    V = sole_api:copy_emojis(),
    error_logger:info_msg('~p~n', [V]).
  </erl>
  <erl>
    out(Arg) ->
    error_logger:info_msg('~p~n', [sole_api:person_css()]).
  </erl>
  <erl>
    out(Arg) ->
    error_logger:info_msg('~p~n', [sole_api:username('user')]).
  </erl>
  <erl>
    out(Arg) ->
    Ret = [{redirect, " ++ "\"" ++ "/commercial5.yaws" ++ "\"" ++ "}].
  </erl>
  </redirect>"]).

commercial() ->
  file:write_file("commercial.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html lang='en'>

      <head>
       <title>your-post-feed</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='commercial.css'>
         <erl>
           out(Arg) ->
           {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
         </erl>
       <link rel='stylesheet' href='payment.css'>
       <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
       <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.13/css/all.css' integrity='sha384'  crossorigin='anonymous'>
       <link rel='stylesheet' href='video-controls.css'>
         <style>
           .paragraph { background-color: #fff; border-radius: 15px; width: 500px;}
           .Mouth { display: none; }
         </style>
      </head>
      <style>
        .overflow { height:1000px; overflow: auto; position: relative; }
        html { scroll-behavior: smooth; }
        .bar { display: none; position: absolute; }
        .window { position : relative; width : 200px; height : 100px; border-radius : 15px; background-color : #fff; display: none; }
      </style>
      <body>
        <br>
        <center><div class=dot0><br><img onclick='search_bar();' src=images_folder/comthru.png width=50% height=50%></div></center>


          <!-- Menu goes here -->
          <center align='center'>
            <table cellspacing='0' width='98%' style='bottom: 0px; position: absolute;'>
              <td>
            <div class='o'><br><img onclick='stop_stream()' src='images_folder/Personal_profile_icon.png' 'width=40px height=40px'></div> </td><td> <div class='o'><a href='save_posts.yaws'><br><img src='images_folder/Home.png' 'width=40px height=40px'></a></div>
            </td>
          </table>
          </center>
              <div class=bar><form action='user_accounts.yaws' method='POST'><input type='submit' style='color: #FFF; border-width: 0px; border-radius: 50%; height: 50px; width: 50px; position: relative; background-image: url(images_folder/search_icon.png); background-position: center; background-size: cover;'><input class=form name='user' type=text size=36% placeholder=Search...></form></div>
            <erl>
              out(Arg) ->
              avatar:out([]).
            </erl><div class='overflow'>
        <script src='jquery.min.map'></script>
        <script>
          var WebSocket = window.WebSocket || window.MozWebSocket;
          var socket = new WebSocket('wss://comthru.com/get_tokens.yaws');
          var socket2 = new WebSocket('wss://comthru.com/get_emoji.yaws');
          var socket3 = new WebSocket('wss://comthru.com/get_emojis2.yaws');
          var socket4 = new WebSocket('wss://comthru.com/get_emojis3.yaws');
        </script>

        <!-- id = 'Happy' -->

    <erl>
      out(Arg) ->
        sole_api:file_must_exists().
    </erl>
    <erl>
      out(Arg) ->
        sole_api:new_post_old_post().
      </erl>
      <erl>
        out(Arg) ->
        {ehtml, {p, [{id, sole_api:first_name()}, {style, 'color: #F5A9F2;'}], sole_api:email()}}.
      </erl>

  <script>
    Share = {
  facebook: function(purl, ptitle, pimg, text) {
  url = 'http://www.facebook.com/sharer.php?s=100';
  url += '&p[title]=' + encodeURIComponent(ptitle);
  url += '&p[summary]=' + encodeURIComponent(text);
  url += '&p[url]=' + encodeURIComponent(purl);
  url += '&p[images][0]=' + encodeURIComponent(pimg);
  Share.popup(url);
  },
  twitter: function(purl, ptitle) {
  url = 'http://twitter.com/share?';
  url += 'text=' + encodeURIComponent(ptitle);
  url += '&url=' + encodeURIComponent(purl);
  url += '&counturl=' + encodeURIComponent(purl);
  Share.popup(url);
  },
  popup: function(url) {
  window.open(url,'','toolbar=0,status=0,width=626, height=436');
  }
  };
  </script>
  <script>
    var video = document.querySelector('.video');
    var juice = document.querySelector('.orange-juice');
    var btn = document.getElementById('play-pause');

    function togglePlayPause() {
       if (video.paused) {
       btn.className = 'pause';
       video.play();
       } else {
       btn.className = 'play';
       video.pause();
       }
    }

    btn.onclick = function() {
       togglePlayPause();
    };

    video.addEventListener('timeupdate', function() {
       var juicePos = video.currentTime / video.duration;
       juice.style.width = juicePos * 100 + '%';
       if (video.ended) {
          btn.className = 'play';
       }
    });
  </script>


        <script>
        function play() {
          var audio = new Audio('voice/help.m4a');
          audio.play();
        }
        function display2() {
          var display = document.querySelector('.window2').style.display = 'block';
          var close = document.querySelector('.window').style.display = 'none';
        }
        function cancel() {
          var cancel = document.querySelector('.window2').style.display = 'none';
        }
        function search_bar() {
          var search_bar = document.querySelector('.bar').style.display = 'block';
        }
        </script>
        <script>
        const WebSocket = window.WebSocket || window.MozWebSocket;
          const br = new window.BroadcastChannel('send_numbr');
          const number = document.getElementsByTagName('p');

          function answer_call() {
            window.location.href = `${number[number.length - 1].innerHTML}.yaws`;
          }

          br.onmessage = (msg) => {
              let txt=document.querySelector('#txtMsg');
              txt.value=`${event.data.pNumber1}`;
              if (txt.value===`${number[number.length - 1].innerHTML}`){
              answer_call();
            }else{
                null;
              }
          }
        </script>

        <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

        <erl>
          out(Arg) ->
          Phone_Number = sole_api:phone_number(),
          {ehtml, {p, [{class, 'paragraphs'}, {style, 'background-color: #F5A9F2; color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
        </erl>


        <script src='face.js'></script>
        <script src='figure.js'></script>
        <erl>
          out(_Arg) ->
        {html, " ++ "\"" ++ "<audio id=adioPlay><script src='myAudio.js'></script></audio>" ++ "\"" ++ "}.
        </erl>

      </body>


  </html>"]),
  file:write_file("commercial.css", ["body{background-color:#F5A9F2 no-repeat; background-size:100%}
  .dot0 {
   height: 100px;
   width: 100px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
   position: relative;
  }
  @font-face {
    src: url(Open_Sans/OpenSans-Light.ttf);
    font-family: 'Open Sans', sans-serif;

  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
  }
  .form {
    border: 1px dotted #999;
    border-radius: 0;
    -webkit-appearance: none;
  }
  button, input, select, textarea {
    font-family: 'Open Sans', sans-serif;
    font-size: 25px;
    border-radius: 10px;
    border-color:#FFF;
    background-color:#FFF;
    border-width:1px;
  }
  .booth {
    width:100%;
    height:500px;
    background-color: black;
    border:10px solid black;
    margin:0 auto;
  }
  @media only screen and (min-width:300px){
    body {
      background-color:#F5A9F2;
    }
  }
  A {
    text-decoration:none;
    color:#FFF;
  }
  .circle {
   height: 60px;
   width: 65px;
   background-color: black;
   border-radius: 50%;
   display: inline-block;
  }
  .dot {
   height: 35px;
   width: 35px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }
  .dots {
   height: 35px;
   width: 35px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }
  .doto {
   height: 35px;
   width: 35px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }
  #bar {
    width: 100%;
    height:10%;
    display:inline-block;
    background-color: lightgreen;
  }
  #dynamic {
    height: 600px;
    overflow: auto;
  }
  #images {
    background-color: #fff;
    border-radius: 15px;
  }
  #opinions {
    background-color: #fff;
    border-radius: 15px;
  }
  .o {
   height: 80px;
   width: 80px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }
  .size {
    width: 100%;
  }
  .menus {
    width: 100%;
    height: 65px;
    bottom: 0px;
    position: absolute;
    background-color: #FFF;
  }
  .pop_up {
  width: 440px;
  height: 90px;
  color: #149505;
  border-radius: 15px;
  background-color: #FFF;
  border-color: #F5A9F2;
  border-width: 15px;
  position: absolute;
  display: none;

  }
  .pop_up2 {
  width: 440px;
  height: 90px;
  border-radius: 15px;
  background-color: #FFF;
  border-color: #F5A9F2;
  border-width: 15px;
  position: absolute;
  display: none;

  }
  .pop_up3 {
  width: 440px;
  height: 90px;
  color: #f0180b;
  border-radius: 15px;
  background-color: #FFF;
  border-color: #F5A9F2;
  border-width: 15px;
  position: absolute;
  display: none;

  }"]).

user_accounts() ->
  file:write_file("user_accounts.yaws", ["<?xml version='1.0' encoding='UTF-8'?>
  <user_accounts>
    <erl>
      out(Arg) ->
          L = yaws_api:parse_post(Arg),
          M = lists:nth(1,L),
          N = element(2, M),
          {ehtml, f('~p', [N])},
          user_func:check_to_see_if_user_exists(N).
   </erl>
  </user_accounts>"]).

user_no_exists() ->
  file:write_file("user_no_exists.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html lang='en'>

      <head>
       <title>your-post-feed</title>
       <meta charset='UTF-8'>
       <meta name='viewport' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='commercial.css'>
       <erl>
         out(Arg) ->
         {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
       </erl>
       <link rel='stylesheet' href='payment.css'>
       <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
       <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.13/css/all.css' integrity='sha384'  crossorigin='anonymous'>
       <link rel='stylesheet' href='video-controls.css'>
         <style>
           .paragraph { background-color: #fff; border-radius: 15px; width: 500px; font-size: 25px; line-height: 62px; font-family: 'Open Sans',sans-serif;}
           .Mouth { display: none; }
         </style>
      </head>
      <style>
        .overflow { height:1000px; overflow: auto; position: relative; }
        html { scroll-behavior: smooth; }
        .bar { display: none; position: absolute; }
        .window { position : relative; width : 200px; height : 100px; border-radius : 15px; background-color : #fff; display: none; }
      </style>
      <body>
        <br>
        <center><div class=dot0><br><img onclick='play(), search_bar();' src=images_folder/comthru.png width=50% height=50%></div></center>


          <!-- Menu goes here -->
          <center align='center'>
            <table cellspacing='0' width='98%' style='bottom: 0px; position: absolute;'>
              <td>
            <div class='o'><br><img onclick='stop_stream()' src='images_folder/Personal_profile_icon.png' 'width=40px height=40px'></div> </td><td> <div class='o'><a href='save_posts.yaws'><br><img src='images_folder/Home.png' 'width=40px height=40px'></a></div>
            </td>
          </table>
          </center>
              <div class=bar><form action='user_accounts.yaws' method='POST'><input type='submit' style='color: #FFF; border-width: 0px; border-radius: 50%; height: 50px; width: 50px; position: relative; background-image: url(images_folder/search_icon.png); background-position: center; background-size: cover;'><input class=form name='user' type=text size=36% placeholder=Search...></form></div>
            <erl>
              out(Arg) ->
              avatar:out([]).
            </erl><div class='overflow'>
        <script src='jquery.min.map'></script>
        <center>
      <erl>
        out(Arg) ->
        {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #101010;'}], 'Sorry, couldn't find what you're looking for'}}.
      </erl>
    </center>


        <script>
        function play() {
          var audio = new Audio('voice/help.m4a');
          audio.play();
        }
        function display2() {
          var display = document.querySelector('.window2').style.display = 'block';
          var close = document.querySelector('.window').style.display = 'none';
        }
        function cancel() {
          var cancel = document.querySelector('.window2').style.display = 'none';
        }
        function search_bar() {
          var search_bar = document.querySelector('.bar').style.display = 'block';
        }
        </script>


        <script src='face.js'></script>
        <script src='figure.js'></script>
        <erl>
          out(_Arg) ->
        {html, " ++ "\"" ++ "<audio id=adioPlay><script src='myAudio.js'></script></audio>" ++ "\"" ++ "}.
        </erl>

      </body>


  </html>"]).

save_posts() ->
  file:write_file("save_posts.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <save_posts>
  <erl>
    -define(CHECKFILE, sole_api:check_for_posted_files()).


    out(Arg) ->
    error_logger:info_msg('~p~n', [?CHECKFILE]).
  </erl>
  <erl>
    out(A) ->
      Ret = [{redirect, " ++ "\"" ++ "/commercial5.yaws" ++ "\"" ++ "}].
    </erl>
  </save_posts>"]).

user_home() ->
  file:write_file("user_home.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>edit-profile</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='edit.css'>
         <erl>
           out(Arg) ->
           {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
         </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
           .caption { position: absolute; bottom: 1100px; width: 500px; height: 55px; background-color: #fff; border-radius: 10px; display: none;}
         </style>
      </head>
      <body>
        <!-- UDP -->
          <erl>
            out(Arg) ->
            {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
          </erl><br>
            <br>
            <erl>
            out(Arg) ->
            avatar:out([]).
          </erl>
          <br>
            <center>
          <br>
          <br>
            <br>
              <center align='center'>
                <table cellspacing='0' width='100%'>
                  <td><!--
                <div class='white_dot'><br><img src='images_folder/photo_icon.png' 'width=40px height=40px'></div>--> </td><td> <div class='white_dot'><br><img src='images_folder/play_video_icon.png' 'width=40px height=40px'></div> </td><td> <!--<div class='white_dot'><br><img src='images_folder/film_icon.png' width='40px' height='40px'></div>-->
                </td>
              </table>
              </center>
              <br>
                <table cellspacing='0' width='100%'>
                  <td>
                <center><!--
                  <erl>
                    out(Arg) ->
                    {ehtml, {'div', [{class, words}], [{a, [{href, 'post_media_.yaws'}], [{p, [{class, 'paragraph'}, {style, 'color:#101010;'}], 'Post photo'}]}]}}.
                  </erl>-->
                </center> </td><td> <center>
                  <erl>
                    out(Arg) ->
                    {ehtml, {'div', [{class, words}], [{a, [{href, 'post_media.yaws'}], [{p, [{class, 'paragraph'}, {style, 'color:#101010;'}], 'Make video'}]}]}}.
                  </erl>

                </center> </td><td><!-- <center><erl>
                  out(Arg) ->
                  {ehtml, {'div', [{class, words}], [{a, [{href, 'post_media_live.yaws'}], [{p, [{class, 'paragraph'}, {style, 'color:#101010;'}], 'Stream live'}]}]}}.
                </erl></center>-->
                </td>
              </table>
        </center>
          <br>
            <br>
              <div class='caption'><form action='caption_for_stream.yaws' method='POST'><input type='text' name='caption_post' placeholder='type caption for live stream' size='30'><input type='submit'></form></div>

            <center>
            <br>
            <br>
            <br>
            <erl>
            out(Arg) ->
            {html," ++ "\"" ++ "<div class=sentence style='width: 500px;' align=center><br><div class=write><a href='update_profile.yaws' class='paragraph' style='color: #101010;'>profile_photo / name<img align='right' src='images_folder/Personal_profile_icon.png' 'width=40px height=40px'></a></div></div>" ++ "\"" ++ "}.
            </erl>
            </center>


            <table cellspacing='0' width='98.5%' style='bottom:0px; position: absolute;'>
              <td>
                <div class='words' style='background-color: #4e57fc;'><center><p class='paragraph'><a href='commercial5.yaws' style=color:#fff;>Back</a></p></center></div></td><td width='5%'><erl> out(Arg) -> {html," ++ "\"" ++ "<div class=words style='background-color: #4e57fc;'><center><p class=paragraph><a href='' style=color:#fff;>Delete Account</a></p></center></div>" ++ "\"" ++ "}. </erl>
                </td>
              </table>

              <script>
              function play() {
                var audio = new Audio('voice/help.m4a');
                audio.play();
              }
              function display() {
                var display = document.querySelector('.window').style.display = 'block';
              }
              function display2() {
                var display = document.querySelector('.window2').style.display = 'block';
                var close = document.querySelector('.window').style.display = 'none';
              }
              function cancel() {
                var cancel = document.querySelector('.window2').style.display = 'none';
              }
              </script>
              <script>
                function show_input() {
                  var display = document.querySelector('.caption').style.display = 'block';
                }
              </script>
              <script>
              function start_stream() {
                window.location.href = 'start_stream.yaws';
              }
              </script>
              <script>
              const WebSocket = window.WebSocket || window.MozWebSocket;
                const br = new window.BroadcastChannel('send_numbr');
                const number = document.getElementsByTagName('p');

                function answer_call() {
                  window.location.href = `${number[number.length - 1].innerHTML}.yaws`;
                }

                br.onmessage = (msg) => {
                    let txt=document.querySelector('#txtMsg');
                    txt.value=`${event.data.pNumber1}`;
                    if (txt.value===`${number[number.length - 1].innerHTML}`){
                    answer_call();
                  }else{
                      null;
                    }
                }
              </script>

              <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

              <erl>
                out(Arg) ->
                Phone_Number = sole_api:phone_number(),
                {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
              </erl>


        <script src='face.js'></script>
        <script src='figure.js'></script>


      </body>

  </html>"]).

start_stream() ->
  file:write_file("start_stream.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <start_stream>
  <erl>
    out(Arg) ->
    sole_api:video().
  </erl>
  <erl>
    out(Arg) ->
    Ret = [{redirect, " ++ "\"" ++ "/user_home.yaws" ++ "\"" ++ "}].
  </erl>
  </start_stream>"]).

face_js() ->
  file:write_file("face.js", ["var figure = document.querySelector('#Image');
  var web = document.querySelector('body');

  web.addEventListener('mousemove', getClickPosition, false);
  function getClickPosition(e) {
    var parentPosition = getPosition(web);
    var xPosition = e.clientX - parentPosition.x - (figure.offsetWidth /2);
    var yPosition = e.clientY - parentPosition.y - (figure.offsetHeight /2);

    var translate3dValue = 'translate3d(' + xPosition + 'px,' + yPosition + 'px, 0)';
    figure.style.transform = translate3dValue;
  }
  function getPosition(element) {
    var xPosition = 0;
    var yPosition = 0;

    while (element) {
      xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
      yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
      element = element.offsetParent;
    }
    return {
      x: xPosition,
      y: yPosition
    };
  }"]).

figure_js() ->
  file:write_file("figure.js", ["var individual = document.querySelector('#Gender');
  var web = document.querySelector('body');

  web.addEventListener('mousemove', getClickPosition, false);
  function getClickPosition(e) {
    var parentPosition = getPosition(web);
    var xPosition = e.clientX - parentPosition.x - (individual.offsetWidth / 2);
    var yPosition = e.clientY - parentPosition.y - (individual.offsetHeight / 2);

    var translate3dValue = 'translate3d(' + xPosition + 'px,' + yPosition + 'px, 0)';
    individual.style.transform = translate3dValue;
  }
  function getPosition(element) {
    var xPosition = 0;
    var yPosition = 0;

    while (element) {
      xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
      yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
      element = element.offsetParent;
    }
    return {
      x: xPosition,
      y: yPosition
    };
  }"]).

space_js() ->
  file:write_file("space.js", ["var web = document.querySelector('.over');
  var space = document.querySelector('.space');

  web.addEventListener('click', () => {
    space.classList.toggle('space');
  });"]).

speech_js() ->
  file:write_file("speech.js", ["var speaking = document.querySelector('.speech');
  var web = document.querySelector('.over');

  web.addEventListener('mousemove', getClickPosition, false);
  function getClickPosition(e) {
    var parentPosition = getPosition(web);
    var xPosition = e.clientX - parentPosition.x - (speaking.offsetWidth /2);
    var yPosition = e.clientY - parentPosition.y - (speaking.offsetHeight /2);

    var translate3dValue = 'translate3d(' + xPosition + 'px,' + yPosition + 'px, 0)';
    speaking.style.transform = translate3dValue;
  }
  function getPosition(element) {
    var xPosition = 0;
    var yPosition = 0;

    while (element) {
      xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
      yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
      element = element.offsetParent;
    }
    return {
      x: xPosition,
      y: yPosition
    };
  }"]).

talk_js() ->
  file:write_file("talk.js", ["var web = document.querySelector('.over');
  var talking = document.querySelector('.Mouth');

  web.addEventListener('click', () => {
    talking.classList.toggle('Mouth');
  });"]).

convo_js() ->
  file:write_file("convo.js", ["var web = document.querySelector('.over');
  var speech = document.querySelector('.speech');

  web.addEventListener('click', () => {
    speech.classList.toggle('speech');
  });"]).

post_media() ->
  file:write_file("post_media.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <stream>
  <html>
      <head>
       <title>option_page</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
         <link rel='stylesheet' href='commercial5.css'>
         <link rel='stylesheet' href='fake_page.css'>
           <erl>
             out(Arg) ->
             {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
           </erl>
           <link rel='stylesheet' href='sign_up.css'>
         <style>
           .Mouth { display: none; }
           .image { width: 100px; border-radius: 15px; height:100px; background-color: #FFF; }
           .sentence { width: 200px; border-radius: 15px; height:100px; background-color: #FFF; }
           .writing {
             font-size: 25px;
             line-height: 62px;
             font-family: 'Open Sans',sans-serif;
             border-radius: 15px;
             background-color: #FFF;
             width:500px;
           }
           .paragraph {
             font-size: 25px;
             line-height: 62px;
             font-family: 'Open Sans',sans-serif;
           }
         </style>
      </head>
      <body>
      <erl>
        out(Arg) ->
        {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
      </erl>
      <div class='over'>


      <erl>
        out(A) ->
        avatar:out([]).
      </erl>
      <br>


        <center>
        <div class=small_dot>
        <div class='image'>

          <center>
            <br><a href='make_video.yaws'>
        <erl>
          out(Arg) ->
          {ehtml, {img, [{src, 'images_folder/play_video_icon.png'}, {width, '50px'}, {height, '50px'}, {style, 'display: block;'}]}}.
        </erl></a>
        </center></div></div>
        <br>
          <br>
            <br>
              <div class='sentence'><p class='paragraph' style='color: #101010;'>Make videos</p></div>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <div class='sentence' style='width: 300px;'><p class='paragraph' style='color: #101010;'>Or upload video</p></div>
      </center>




        <script src='face.js'></script>
        <script src='figure.js'></script>
  </div>
  <erl>
  out(A) ->
  Form =
    {form, [{enctype, 'multipart/form-data'}, {class, words}, {align, left},
            {method, post},
            {action, 'upload_photo.yaws'}],
            [{input, [{type, submit}, {class, paragraph}, {style, 'width: 100%; height: 100px; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px; color: #fff;'}, {value, 'Upload video'}]},
             {input, [{type,file}, {accept, 'video/*'}, {style, 'width:50px;'}, {name, foo}]}]},
  {ehtml, {html,[], [{h2,[], ''},
  Form]}}.
  </erl>
      </body>


  </html>
  </stream>"]).

make_video() ->
  file:write_file("make_video.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <stream>
  <!DOCTYPE html>
  <html>
        <head>
          <meta charset='utf-8'>
          <meta http-equiv='X-UA-Compatible' content='IE=edge'>
          <title>webcam-js</title>
          <meta name='viewport' content='width=device-width, initial-scale=1'>
          <link rel='icon' href='data:;base64,iVBORw0KGgo='>
          <link rel='stylesheet' href='cropselect.css'>
          <link href='material-icon.css' rel='stylesheet'>
          <link rel='stylesheet' type='text/css' media='screen' href='webcam-demo.css'>
            <link rel='stylesheet' href='person.css'>
              <link rel='stylesheet' href='play.css'>
              <link rel='stylesheet' href='speech-bubble.css'>
          <script src='jquery-3.3.1.min.js'></script>
          <script src='webcam-easy-master/dist/webcam-easy.min.js'></script>
          <style>
            .rec { background-color: red; width: 50px; height: 50px; border-radius: 50%; box-shadow: 0px 0px 1px 1px #0000001a;  display: inline-block; }
            .position { float: left; bottom: 1050px; position: absolute; }
            .pulse { animation: pulse-animation 2s infinite; }
            @keyframes pulse-animation {
              0% {
                box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.2);
              }
              100% {
                box-shadow: 0 0 0 30px rgba(0, 0, 0, 0);
              }
            }
            .hidden {
            display: none;
            }
            #Person { z-index: 1000;}
            .paragraphs {
            display: block;
            }
            .dot {
             height: 95px;
             width: 95px;
             background-color: #FFF;
             border-radius: 50%;
             display: inline-block;
            }
          </style>
      </head>
      <body>
        <div class='over'>
        <main id='webcam-app'>
        <div id='webcam-container' class='webcam-container col-12 d-none p-0 m-0'>
          <video id='video' autoplay playsinline width='640' height='1000'></video>
          <canvas id='canvas' class='d-none'></canvas>
        <center>
        <div id='cameraControls' class='cameraControls'>
          <div id='window' class='hidden' style='width: 600px; height: 200px; background-color: #fff; border-radius: 15px;'><p class='paragraph'>To turn your live stream to interactive mode, click the red button. To keep your live stream in default mode, click the green button</p></div>
          <div class='bar' style='width: 600px; height: 80px; background-color: #fff; border-radius: 15px; position: absolute; top: 100%; display: none;'><p class='paragraph'>Click the Rec button for more details</p></div>
          <div class=dot><br><center><a href='video_stream_transmission.yaws'><img src=images_folder/comthru.png width='50px' height='50px' style='border-radius: 50%;'></a></center></div>
          <div id='user' style='position: absolute; bottom: 1050px;'><!--
          <erl>
            out(Arg) ->
            avatar:out([]).
          </erl>-->
        </div>
          <table class='position'><td><p class=paragraph style='color: #FFF;'>Rec</p></td><td><div class='rec pulse'></div></td><tr><center>
          <!--<a href='#' id='download-video' download='video.mp4' target='_blank' title='Save video' class='d-none'><i class='material-icons'>file_download</i></a>-->
              <button id='btn' style='background-color: #101010; border-width: 0px; border-radius: 15px;'><i class='material-icons' style='color: red;'>circle</i></button>
              <button id='stopbtn' style='background-color: #101010; border-width: 0px; border-radius: 15px;'><i class='material-icons' style='color: green;'>circle</i></button></center></tr></table>

          <!--<erl>
          out(A) ->
        Form =
            {form, [{enctype, 'multipart/form-data'}, {class, words}, {align, left},
                    {method, post},
                    {action, 'upload_photo.yaws'}],
                    [{input, [{type, submit}, {class, paragraph}, {style, 'position: fixed; width:100%; height:100px; bottom:0; background-color: #FFF; border-color: #FFF;'}, {value, 'Upload video'}]},
                     {input, [{type,file}, {accept, 'video/*'}, {style, 'width:500px;'}, {name, foo}]}]},
        {ehtml, {html,[], [{h2,[], ''},
        Form]}}.
      </erl>-->
      <script>
        window.onload = function () {
          const parts = [];
          let mediaRecorder;
          navigator.mediaDevices.getUserMedia({ audio: true, video: true }).then(stream => {
            document.getElementById('video').srcObject = stream;
            document.getElementById('video').muted = true;
            document.getElementById('btn').onclick = function () {
              mediaRecorder = new MediaRecorder(stream);

              mediaRecorder.start(1000);

              mediaRecorder.ondataavailable = function (e) {
                var formdata = parts.push(e.data);
              }
            }
          });



        document.getElementById('stopbtn').onclick = function () {
          mediaRecorder.stop();
          const blob = new Blob(parts, {
            type: 'live_video/mp4'
          });
          const url = URL.createObjectURL(blob);

          var formData = new FormData();

          formData.append('video', blob);

          $.ajax('video_stream_transmission.yaws', {
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function () {
                    console.log('Upload success');
            },
            error: function () {
                    console.log('Upload failed');
            }
          });
        }
        }
        // ctx is the plotting canvas' context
        // w is the width of the canvas
        ctx.translate(w, 0);
        ctx.scale(-1, 1);

      </script>
      <!--
      <script src='jquery.min.map'></script>
      <script src='socket.js'></script>
      <script>
        ws.addEventListener('open', e => {
        ws.send(JSON.stringify{
            x: 254,
            y: 100
        });
        });
      </script>

      <script>
        const heading = document.getElementById('window');
        const btn = document.querySelector('.rec' );
        btn.addEventListener('click', (e) => {
        heading.classList.toggle('hidden');
       });
     </script>-->

        </div>
      </center>
      </div>
    </main>
      <div class='md-overlay'></div>
  <script>
    var video = document.querySelector('#video');

                 if (navigator.mediaDevices.getUserMedia) {
                     navigator.mediaDevices.getUserMedia({ video: true, audio: true })
                              .then(function (stream) {
                         video.srcObject = stream;
                         video.muted = true;
                     })
                              .catch(function (err0r) {
                       console.log('Something went wrong!');
                    });
                    }


                    // ctx is the plotting canvas' context
                    // w is the width of the canvas
                    ctx.translate(w, 0);
                    ctx.scale(-1, 1);
  </script><!--
  <erl>
    out(Arg) ->
    sole_api:process_stream().
  </erl>
  <script src='face.js'></script>
  <script src='figure.js'></script>-->
  </div>
      </body>


  </html>
  </stream>"]).

update_profile() ->
  file:write_file("update_profile.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>edit-profile</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='edit.css'>
       <erl>
         out(Arg) ->
         {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
       </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
         </style>
      </head>
      <body>
        <!-- UDP -->
          <erl>
            out(Arg) ->
            {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
          </erl><br>
            <br>
            <erl>
            out(Arg) ->
            avatar:out([]).
          </erl>
          <br>
            <center>
              <div class='words' style='width: 500px;'><p class='paragraph' style='color: #101010;'>Update Profile Photo. Change username</p></div>
              <br>
            <br>
              <br>
                <br>
                  <br>
                    <br>
                      <br>
                        <br>
            <div class='white_dot'><br><a href='image.yaws'><center><img src='images_folder/photo_icon.png' 'width=40px height=40px'></center></a></div>
          <br>
            <br>
              <erl>
                out(A) ->
              Form =
                  {form, [{enctype, 'multipart/form-data'}, {class, words},
                          {method, post},
                          {action, 'upload_profile_photo.yaws'}],
                          [{input, [{type, submit}, {class, paragraph}, {style, 'color:#fff; background-color: #4e57fc;'}, {value, 'Upload Photo'}]},
                           {input, [{type,file}, {accept, 'image/*'}, {style, 'width:55px;'}, {style, 'color:black;'}, {name, foo}]}]},
              {ehtml, {html,[], [{h2,[], ''},
              Form]}}.
              </erl>
              <br>
                <br>
                  <erl module='profile'>
                    out(Arg) ->
                    {ehtml, {'div', [{class, 'white_dot'}, {style, 'height: 100px; width: 100px;'}], {center, [], {img, [{src, '/Uploads/' ++ sole_api:first_name() ++ " ++ "\"" ++ "_profile.png" ++ "\"" ++ "}, {align, 'center'}, {style, 'height: 100px; width: 100px; border-radius: 50%;'}]}}}}.
                  </erl>
                  <br>
                    <br>
                      <erl module='input_username'>
                        -export([display/0]).
                        -define(DISPLAY, display()).

                        display() ->
                          Username = sole_api:username(),
                          if Username =< []  ->
                               {value, ''};
                          true ->
                               {value, Username}
                          end.

                        out(A) ->
                      Form =
                          {form, [
                                  {method, post},
                                  {action, 'self.yaws'}],
                                  [{input, [{type, text}, {class, form}, {name, 'username'}, ?DISPLAY, {placeholder, 'type username'}, {size, '25%'}, {style, 'color:#101010;'}]},
                                   {input, [{type,submit}, {style, 'width:125px; color:#FFF; background-color: #4e57fc;'}]}]},
                      {ehtml, {html,[], [{h2,[], ''},
                      Form]}}.
                      </erl>
                      <erl>
                        out(Arg) ->
                        error_logger:info_msg('~p~n', [user_func:store_mnesia(sole_api:username(), 'commercial' ++ sole_api:first_name() ++ " ++ "\"" ++ ".yaws" ++ "\"" ++ ")]).
                      </erl>
                    </center>
                      <br>
                        <br><!--
                          <erl module='input_caption'>
                            -export([display/0]).
                            -define(DISPLAY, display()).

                            display() ->
                              Username = sole_api:caption(),
                              if Username =< []  ->
                                   {value, ''};
                              true ->
                                   {value, Username}
                              end.
                            out(A) ->
                          Form =
                              {form, [
                                      {method, post},
                                      {action, 'caption.yaws'}],
                                      [{input, [{type, text}, {class, form}, {name, 'caption'}, ?DISPLAY, {placeholder, 'type a short cation that represents you'}, {size, '55%'}, {style, 'color:#101010;'}]},
                                       {input, [{type,submit}, {style, 'width:125px; color:#FFF; background-color: #4e57fc;'}]}]},
                          {ehtml, {html,[], [{h2,[], ''},
                          Form]}}.
                        </erl>-->
                      <br>
                            <br>
                              <div><center><a href='user_home.yaws'><p class='paragraph' style='color:#fff; position: fixed; width:100%; height:100px; bottom:0; padding: 0px; margin: -8px; background-color: #4e57fc;'>Go Back</p></a></center></div>

              <script>
              function play() {
                var audio = new Audio('voice/help.m4a');
                audio.play();
              }
              function display() {
                var display = document.querySelector('.window').style.display = 'block';
              }
              function display2() {
                var display = document.querySelector('.window2').style.display = 'block';
                var close = document.querySelector('.window').style.display = 'none';
              }
              function cancel() {
                var cancel = document.querySelector('.window2').style.display = 'none';
              }
              </script>
              <script>
              const WebSocket = window.WebSocket || window.MozWebSocket;
                const br = new window.BroadcastChannel('send_numbr');
                const number = document.getElementsByTagName('p');

                function answer_call() {
                  window.location.href = `${number[number.length - 1].innerHTML}.yaws`;
                }

                br.onmessage = (msg) => {
                    let txt=document.querySelector('#txtMsg');
                    txt.value=`${event.data.pNumber1}`;
                    if (txt.value===`${number[number.length - 1].innerHTML}`){
                    answer_call();
                  }else{
                      null;
                    }
                }
              </script>

              <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

              <erl>
                out(Arg) ->
                Phone_Number = sole_api:phone_number(),
                {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
              </erl>


        <script src='face.js'></script>
        <script src='figure.js'></script>

      </body>

  </html>"]).

edit_css() ->
  file:write_file("edit.css", ["body{background-color:#F5A9F2 no-repeat; background-size:100%; border: 50px;}
  @font-face {
    src: url(Open_Sans/OpenSans-Light.ttf);
    font-family: 'Open Sans', sans-serif;

  }
  .over {
    height:900px;
    overflow: auto;
    position: relative;
  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
  }
  .words {
    width: 250px;
    border-radius: 15px;
    height:80px;
    background-color: #FFF;
  }
  .sentence {
    width: 700px;
    border-radius: 15px;
    height:100px;
    background-color: #FFF;
  }
  .phrase {
    width: 1000px;
    border-radius: 15px;
    height:100px;
    background-color: #FFF;
  }
  .text {
    width: 350px;
    border-radius: 15px;
    height:110px;
    background-color: #FFF;
  }
  .form {
    border: 1px dotted #999;
    border-radius: 0;
    -webkit-appearance: none;
    background-color: #FFF;
  }
  button, input, select, textarea {
    font-family: 'Open Sans', sans-serif;
    font-size: 25px;
    border-radius: 10px;
    background-color:#fff;
    border-width:0px;
  }
  .write {
    width:400px;
    height: 50px;
    background-color:#FFF;
    border-radius: 10px;
  }
  .writing {
    width:600px;
    height: 50px;
    background-color:#FFF;
    border-radius: 10px;
  }
  @media only screen and (min-width:300px){
    body {
      background-color:#F5A9F2;
      color: #F5A9F2;
    }
  }
  A {
    text-decoration:none;
    color:#F5A9F2;
  }
  input {
    text-decoration;
    color:black;
  }
  .dot {
   height: 100px;
   width: 100px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }
  .white_dot {
   height: 80px;
   width: 80px;
   background-color: #FFF;
   border-radius: 50%;
   display: inline-block;
  }"]).

payment_css() ->
  file:write_file("payment.css", [".window {
  width: 500px;
  height: 290px;
  border-radius: 15px;
  background-color: #FFF;
  border-color: #F5A9F2;
  border-width: 15px;
  position: absolute;
  display: none;

  }
  .window2 {
  width: 500px;
  height: 290px;
  border-radius: 15px;
  background-color: #FFF;
  border-color: #F5A9F2;
  border-width: 15px;
  position: absolute;
  display: none;

  }
  .button {
    width: 190px;
    height: 45px;
    border-radius: 5px;
    color: #FFF;
    background-color: #4e57fc;
  }"]).

image() ->
  file:write_file("image.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
  <head>
      <meta charset='utf-8'>
      <meta http-equiv='X-UA-Compatible' content='IE=edge'>
      <title>webcam-js</title>
      <meta name='viewport' content='width=device-width, initial-scale=+1'>
      <link rel='icon' href='data:;base64,iVBORw0KGgo='>
      <link rel='stylesheet' href='bootstrap.min.css'>
      <link rel='stylesheet' href='cropselect.css'>
      <link href='material-icon.css' rel='stylesheet'>
      <link rel='stylesheet' type='text/css' media='screen' href='webcam-demo.css'>
      <script src='jquery-3.3.1.min.js'></script>
      <link rel='stylesheet' href='cropper.css'>
      <style>
      #canvas {
      }
      .cropper-crop {
       display:none;
       }
       .cropper-bg {
       background: none;
       }
      </style>
  </head>
  <body>
      <main id='webcam-app'>
          <div class='form-control webcam-start' id='webcam-control'>
                  <label class='form-switch'>
                  <input type='checkbox' id='webcam-switch'>
                  <i></i>
                  <span id='webcam-caption'>Click to Start Camera</span>
                  </label>
                  <button id='cameraFlip' class='btn d-none'></button>
          </div>

          <div id='errorMsg' class='col-12 col-md-6 alert-danger d-none'>
              Fail to start camera, please allow permision to access camera. <br/>
              If you are browsing through social media built in browsers, you would need to open the page in Sarafi (iPhone)/ Chrome (Android)
              <button id='closeError' class='btn btn-primary ml-3'>OK</button>
          </div>
          <div class='md-modal md-effect-12'>
              <div id='app-panel' class='app-panel md-content row p-0 m-0'>
                  <div id='webcam-container' class='webcam-container col-12 d-none p-0 m-0'>
                      <video id='webcam' autoplay playsinline width='640' height='480'></video>
                      <canvas id='canvas' class='d-none'></canvas>
                      <div class='flash'></div>
                      <audio id='snapSound' src='Camera.mp3' preload = 'auto'></audio>
                  </div>
                  <div id='cameraControls' class='cameraControls'>
                    <!--  <a href='#' id='exit-app' title='Exit App' class='d-none'><i class='material-icons'>exit_to_app</i></a> -->
                      <button id='take-photo' onclick='bar();' title='Take Photo'><i class='material-icons'>camera_alt</i></button>
                      <a href='#' id='download-photo' target='_blank' title='Save Photo' class='d-none'><i class='material-icons'>file_download</i></a>
                      <a href='#' id='resume-camera'  title='Resume Camera' class='d-none'><i class='material-icons'>camera_front</i></a>

                      <br>
                        <br>
                          <br>
                            <erl>
                            out(A) ->
                          Form =
                              {form, [{class, words}, {align, left}, { action, 'update_profile.yaws'}],
                                      [{button, [{id, 'photoID'}, {class, paragraph}, {style, 'position: fixed; width:100%; height:100px; bottom:0; z-index: 10000; display: none;'}], 'Save photo'}]},
                          {ehtml, {html,[], [{h2,[], ''},
                          Form]}}.
                        </erl>
                        <script>
                          function bar() {
                                 document.querySelector('#photoID').style.display = 'block';
                          }
                        </script>
                              <br><script src='jquery.min.map'></script><script src='cropper.js'></script>
                              <script>
                                //**dataURL to blob**
                                function dataURLtoBlob(dataurl) {
                                    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                                        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
                                    while(n--){
                                        u8arr[n] = bstr.charCodeAt(n);
                                    }
                                    var blob = new Blob([u8arr], {type:mime});
                                    upload(blob);
                                }
                              </script>
                              <script>
                                class Webcam {
                                    constructor(webcamElement, facingMode = 'user', canvasElement = null, snapSoundElement = null) {
                                      this._webcamElement = webcamElement;
                                      this._webcamElement.width = this._webcamElement.width || 640;
                                      this._webcamElement.height = this._webcamElement.height || video.width * (3 / 4);
                                      this._facingMode = facingMode;
                                      this._webcamList = [];
                                      this._streamList = [];
                                      this._selectedDeviceId = '';
                                      this._canvasElement = canvasElement;
                                      this._snapSoundElement = snapSoundElement;
                                    }

                                    get facingMode(){
                                      return this._facingMode;
                                    }

                                    set facingMode(value){
                                      this._facingMode = value;
                                    }

                                    get webcamList(){
                                      return this._webcamList;
                                    }

                                    get webcamCount(){
                                      return this._webcamList.length;
                                    }

                                    get selectedDeviceId(){
                                      return this._selectedDeviceId;
                                    }

                                    /* Get all video input devices info */
                                    getVideoInputs(mediaDevices){
                                      this._webcamList = [];
                                      mediaDevices.forEach(mediaDevice => {
                                        if (mediaDevice.kind === 'videoinput') {
                                          this._webcamList.push(mediaDevice);
                                        }
                                      });
                                      if(this._webcamList.length == 1){
                                        this._facingMode = 'user';
                                      }
                                      return this._webcamList;
                                    }

                                    /* Get media constraints */
                                    getMediaConstraints() {
                                        var videoConstraints = {};
                                        if (this._selectedDeviceId == '') {
                                            videoConstraints.facingMode =  this._facingMode;
                                        } else {
                                            videoConstraints.deviceId = { exact: this._selectedDeviceId};
                                        }
                                        var constraints = {
                                            video: videoConstraints,
                                            audio: false
                                        };
                                        return constraints;
                                    }

                                    /* Select camera based on facingMode */
                                    selectCamera(){
                                      for(let webcam of this._webcamList){
                                        if(   (this._facingMode=='user' && webcam.label.toLowerCase().includes('front'))
                                          ||  (this._facingMode=='enviroment' && webcam.label.toLowerCase().includes('back'))
                                        )
                                        {
                                          this._selectedDeviceId = webcam.deviceId;
                                          break;
                                        }
                                      }
                                    }

                                    /* Change Facing mode and selected camera */
                                    flip(){
                                      this._facingMode = (this._facingMode == 'user')? 'enviroment': 'user';
                                      this._webcamElement.style.transform = '';
                                      this.selectCamera();
                                    }

                                    /*
                                      1. Get permission from user
                                      2. Get all video input devices info
                                      3. Select camera based on facingMode
                                      4. Start stream
                                    */
                                    async start(startStream = true) {
                                      return new Promise((resolve, reject) => {
                                        this.stop();
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints()) //get permisson from user
                                          .then(stream => {
                                            this._streamList.push(stream);
                                            this.info() //get all video input devices info
                                              .then(webcams =>{
                                                this.selectCamera();   //select camera based on facingMode
                                                if(startStream){
                                                    this.stream()
                                                        .then(facingMode =>{
                                                            resolve(this._facingMode);
                                                        })
                                                        .catch(error => {
                                                            reject(error);
                                                        });
                                                }else{
                                                    resolve(this._selectedDeviceId);
                                                }
                                              })
                                              .catch(error => {
                                                reject(error);
                                              });
                                          })
                                          .catch(error => {
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Get all video input devices info */
                                    async info(){
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.enumerateDevices()
                                          .then(devices =>{
                                            this.getVideoInputs(devices);
                                            resolve(this._webcamList);
                                          })
                                          .catch(error => {
                                            reject(error);
                                          });
                                      });
                                    }

                                    /* Start streaming webcam to video element */
                                    async stream() {
                                      return new Promise((resolve, reject) => {
                                        navigator.mediaDevices.getUserMedia(this.getMediaConstraints())
                                          .then(stream => {
                                              this._streamList.push(stream);
                                              this._webcamElement.srcObject = stream;
                                              if(this._facingMode == 'user'){
                                                this._webcamElement.style.transform = 'scale(-1,1)';
                                              }
                                              this._webcamElement.play();
                                              resolve(this._facingMode);
                                          })
                                          .catch(error => {
                                              console.log(error);
                                              reject(error);
                                          });
                                      });
                                    }

                                    /* Stop streaming webcam */
                                    stop() {
                                      this._streamList.forEach(stream => {
                                        stream.getTracks().forEach(track => {
                                          track.stop();
                                        });
                                      });
                                    }

                                    snap() {
                                      if(this._canvasElement!=null){
                                        if(this._snapSoundElement!= null){
                                          this._snapSoundElement.play();
                                        }
                                        this._canvasElement.height = this._webcamElement.scrollHeight;
                                        this._canvasElement.width = this._webcamElement.scrollWidth;
                                        let context = this._canvasElement.getContext('2d');
                                        if(this._facingMode == 'user'){
                                          context.translate(this._canvasElement.width, 0);
                                          context.scale(-1, 1);
                                        }
                                        context.clearRect(0, 0, this._canvasElement.width, this._canvasElement.height);
                                        context.drawImage(this._webcamElement, 0, 0, this._canvasElement.width, this._canvasElement.height);
                                        let data = this._canvasElement.toDataURL('image/png');
                                        document.getElementById('take-photo').onclick = dataURLtoBlob(data);
                                        return data;
                                      }
                                      else{
                                        throw 'canvas element is missing';
                                      }
                                    }
                                }

                                const parts = [];

                                     function upload(data) {

                                     parts.push(data);

                                     const blob = new Blob(parts, {
                                        type: 'image/jpeg'
                                     });
                                     const url = URL.createObjectURL(blob);
                                     var formData = new FormData();

                                     formData.append('image', blob);

                                     $.ajax('upload_profile_photo.yaws', {
                                       method: 'POST',
                                       data: formData,
                                       processData: false,
                                       contentType: false,
                                       success: function () {
                                               console.log('Upload success');
                                       },
                                       error: function () {
                                               console.log('Upload failed');
                                       }
                                     });
                                     };
                              </script>
                  </div>
              </div>
          </div>
          <div class='md-overlay'></div>
      </main>
      <script src='webcam-easy-master/demo/js/app.js'></script>
  </body>
  </html>"]).

log_out() ->
  file:write_file("log-out.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <log-out>
  <erl>
    out(Arg) ->
    yaws_api:print_cookie_sessions().
  </erl><!--
    <erl>
      out(A) ->
      yaws_api:delete_cookie_session(Cookie).
    </erl>-->
    <erl>
      out(Arg) ->
      sole_api:non_available().
    </erl>
    <erl>
      out(Arg) ->
      [{redirect, " ++ "\"" ++ "/log-in.yaws" ++ "\"" ++ "}].
    </erl>
  </log-out>"]).

likes() ->
  file:write_file("likes.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>likes</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='no_comment.css'>
         <erl>
           out(Arg) ->
           {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
         </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
           .overflow { height:800px; overflow: auto; position: relative; }
           #face {
             transform: translate3d(1/2px, 1/2px, 0);
             height: 100px;
             width: 100px;
             border-radius: 10%;
             background-size: contain;
             transition: transform .3s cubic-bezier(.29, .93, .29, .93);
             cursor: pointer;
             display: block;
             position: relative;
             z-index: 30;
             text-align: center;
           }
         </style>
      </head>
      <body>
        <!-- UDP -->
        <erl>
          out(Arg) ->
          {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
        </erl>
            <center>
              <table cellspacing='0' width='100%'>
                <td>
            <div class=sdot><center><br><img src='images_folder/happy.png' 'width=40px height=40px'></center></div>
          </td>
          <td width='10%'><div class='words'>
            <p align='right' class='paragraph'>
            <a href='commercial5.yaws'>Go back</a>
          </p></div>
        </td>
      </table>
    </center>

    <erl>
      out(Arg) ->
      avatar:out([]).
    </erl>
    <div class='overflow'>
      <erl>
        lists_of_likes() ->
           Read = file:read_file(sole_api:first_name() ++ " ++ "\"" ++ "_" ++ "\"" ++ " ++ " ++ "\"" ++ "happy.txt" ++ "\"" ++ "),
           Extract = element(2, Read),
           Convert = binary:bin_to_list(Extract),
           Convert.


        out(Arg) ->
           File = sole_api:first_name() ++ " ++ "\"" ++ "_" ++ "\"" ++ " ++ " ++ "\"" ++ "happy.txt" ++ "\"" ++ ",
           Check = filelib:is_file(File),
           if Check == false ->
                       {html, []};
                    true ->
                       {html, [lists_of_likes()]}
           end.
         </erl>

      <!--

          <erl>
            out(Arg) ->
            {html, " ++ "\"" ++ "<center><table id=lists cellspacing=0 width=100%><td>
            <table id=Person style=position:absolute; style=z-index:10;><tr><div id=Image><div id=Mouth></div></div></tr><tr><div id=Gender style=background-color:black></div></tr></table>
            </td>
            <td>
            <p align=right class=paragraph><a href=#><img src=images_folder/telephone.png width=12% height=12% class=imageWithText>call</a></p>
            </td>
            </table></center>" ++ "\"" ++ "}.
          </erl>-->
  </div>
          <script>
          function display2() {
            var display = document.querySelector('.window2').style.display = 'block';
            var close = document.querySelector('.window').style.display = 'none';
          }
          function cancel() {
            var cancel = document.querySelector('.window2').style.display = 'none';
          }
          </script>
          <script>
          const WebSocket = window.WebSocket || window.MozWebSocket;
            const br = new window.BroadcastChannel('send_numbr');
            const number = document.getElementsByTagName('p');

            function answer_call() {
              window.location.href = `${number[number.length - 1].innerHTML}.yaws`;
            }

            br.onmessage = (msg) => {
                let txt=document.querySelector('#txtMsg');
                txt.value=`${event.data.pNumber1}`;
                if (txt.value===`${number[number.length - 1].innerHTML}`){
                answer_call();
              }else{
                  null;
                }
            }
          </script>

          <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

          <erl>
            out(Arg) ->
            Phone_Number = sole_api:phone_number(),
            {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
          </erl>



        <script src='face.js'></script>
        <script src='figure.js'></script>


      </body>


  </html>"]).

no_comment() ->
  file:write_file("no_comment.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>neutral-opinion</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='no_comment.css'>
         <erl>
           out(Arg) ->
           {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
         </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
           .overflow { height:800px; overflow: auto; position: relative; }
           #face {
             transform: translate3d(1/2px, 1/2px, 0);
             height: 100px;
             width: 100px;
             border-radius: 10%;
             background-size: contain;
             transition: transform .3s cubic-bezier(.29, .93, .29, .93);
             cursor: pointer;
             display: block;
             position: relative;
             z-index: 30;
             text-align: center;
           }
         </style>
      </head>
      <body>
        <!-- UDP -->
        <erl>
          out(Arg) ->
          {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
        </erl>
            <center>
              <table cellspacing='0' width='100%'>
                <td>
            <div class=sdot><center><br><img src='images_folder/neutral.png' 'width=40px height=40px'></center></div>
          </td>
          <td width='10%'><div class='words'>
            <p align='right' class='paragraph'>
            <a href='commercial5.yaws'>Go back</a>
          </p></div>
        </td>
      </table>
    </center>

    <erl>
      out(Arg) ->
      avatar:out([]).
    </erl>
    <div class='overflow'><!--

          <erl>
            out(Arg) ->
            {html, " ++ "\"" ++ "<center><table id=lists cellspacing=0 width=100%><td>
            <table id=Person style=position:absolute; style=z-index:10;><tr><div id=Image><div id=Mouth></div></div></tr><tr><div id=Gender style=background-color:black></div></tr></table>
            </td>
            <td>
            <p align=right class=paragraph><a href=#><img src=images_folder/telephone.png width=12% height=12% class=imageWithText>call</a></p>
            </td>
            </table></center>" ++ "\"" ++ "}.
          </erl>-->
          <erl>
            lists_of_likes() ->
               Read = file:read_file(sole_api:first_name() ++ " ++ "\"" ++ "_" ++ "\"" ++ " ++ " ++ "\"" ++ "poker.txt" ++ "\"" ++ "),
               Extract = element(2, Read),
               Convert = binary:bin_to_list(Extract),
               Convert.


            out(Arg) ->
               File = sole_api:first_name() ++ " ++ "\"" ++ "_" ++ "\"" ++ " ++ " ++ "\"" ++ "poker.txt" ++ "\"" ++ ",
               Check = filelib:is_file(File),
               if Check == false ->
                           {html, []};
                        true ->
                           {html, [lists_of_likes()]}
               end.
             </erl>
  </div>
          <script>
          function display2() {
            var display = document.querySelector('.window2').style.display = 'block';
            var close = document.querySelector('.window').style.display = 'none';
          }
          function cancel() {
            var cancel = document.querySelector('.window2').style.display = 'none';
          }
          </script>
          <script>
          const WebSocket = window.WebSocket || window.MozWebSocket;
            const br = new window.BroadcastChannel('send_numbr');
            const number = document.getElementsByTagName('p');

            function answer_call() {
              window.location.href = `${number[number.length - 1].innerHTML}.yaws`;
            }

            br.onmessage = (msg) => {
                let txt=document.querySelector('#txtMsg');
                txt.value=`${event.data.pNumber1}`;
                if (txt.value===`${number[number.length - 1].innerHTML}`){
                answer_call();
              }else{
                  null;
                }
            }
          </script>

          <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

          <erl>
            out(Arg) ->
            Phone_Number = sole_api:phone_number(),
            {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
          </erl>



        <script src='face.js'></script>
        <script src='figure.js'></script>


      </body>


  </html>"]),
  file:write_file("no_comment.css", ["body{background-color:#F5A9F2 no-repeat; background-size:100%}
  .over {
    height:900px;
    overflow: auto;
    position: relative;
  }
  button, input, select, textarea {
    font-family: 'Open Sans', sans-serif;
    font-size: 25px;
    border-radius: 10px;
    background-color:#fff;
    border-width:0px;
  }
  .dot {
   height: 100px;
   width: 100px;
   background-color: white;
   border-radius: 50%;
   display: inline-block;
   position: relative;
  }
  .sdot {
   height: 75px;
   width: 75px;
   background-color: white;
   border-radius: 50%;
   display: inline-block;
   position: absolute;
  }
  #lists {
    background-color: #fff;
  }
  @font-face {
    src: url(Open_Sans/OpenSans-Light.ttf);
    font-family: 'Open Sans', sans-serif;

  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
  }
  .words {
    width: 150px;
    border-radius: 15px;
    height:50px;
    background-color: #FFF;
  }
  .form {
    border: 1px dotted #999;
    border-radius: 0;
    -webkit-appearance: none;
  }
  @media only screen and (min-width:300px){
    body {
      background-color:#F5A9F2;
    }
  }
  A {
    text-decoration:none;
    color:#F5A9F2;
  }"]).

dislikes() ->
  file:write_file("dislikes.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>dislike-content</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='dislikes.css'>
         <erl>
           out(Arg) ->
           {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
         </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
           .overflow { height:800px; overflow: auto; position: relative; }
           #face {
             transform: translate3d(1/2px, 1/2px, 0);
             height: 100px;
             width: 100px;
             border-radius: 10%;
             background-size: contain;
             transition: transform .3s cubic-bezier(.29, .93, .29, .93);
             cursor: pointer;
             display: block;
             position: relative;
             z-index: 30;
             text-align: center;
           }
         </style>
      </head>
      <body>
        <!-- UDP -->
        <erl>
          out(Arg) ->
          {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
        </erl>
          <center>
            <table cellspacing='0' width='100%'>
              <td>
          <div class=sdot><center><br><img src='images_folder/angry.png' 'width=40px height=40px'></center></div>
        </td>
        <td width='10%'><div class='words'>
          <p align='right' class='paragraph'>
          <a href='commercial5.yaws'>Go back</a>
        </p></div>
      </td>
    </table>
  </center>

  <erl>
    out(Arg) ->
    avatar:out([]).
  </erl>
  <div class='overflow'><!--

        <erl>
          out(Arg) ->
          {html, " ++ "\"" ++ "<center><table id=lists cellspacing=0 width=100%><td>
          <table id=Person style=position:absolute; style=z-index:10;><tr><div id=Image style=background-color:black><div id=Mouth></div></div></tr><tr><div id=Gender style=background-color:black></div></tr></table>
          </td>
          <td>
          <p align=right class=paragraph><a href=#><img src=images_folder/telephone.png width=12% height=12% class=imageWithText>call</a></p>
          </td>
          </table></center>" ++ "\"" ++ "}.
        </erl>-->
        <erl>
          lists_of_likes() ->
             Read = file:read_file(sole_api:first_name() ++ " ++ "\"" ++ "_" ++ "\"" ++ " ++ " ++ "\"" ++ "angry.txt" ++ "\"" ++ "),
             Extract = element(2, Read),
             Convert = binary:bin_to_list(Extract),
             Convert.


          out(Arg) ->
             File = sole_api:first_name() ++ " ++ "\"" ++ "_" ++ "\"" ++ " ++ " ++ "\"" ++ "angry.txt" ++ "\"" ++ ",
             Check = filelib:is_file(File),
             if Check == false ->
                         {html, []};
                      true ->
                         {html, [lists_of_likes()]}
             end.
           </erl>
  </div>
        <script>
        function display2() {
          var display = document.querySelector('.window2').style.display = 'block';
          var close = document.querySelector('.window').style.display = 'none';
        }
        function cancel() {
          var cancel = document.querySelector('.window2').style.display = 'none';
        }
        </script>
        <script>
        const WebSocket = window.WebSocket || window.MozWebSocket;
          const br = new window.BroadcastChannel('send_numbr');
          const number = document.getElementsByTagName('p');

          function answer_call() {
            window.location.href = `${number[number.length - 1].innerHTML}.yaws`;
          }

          br.onmessage = (msg) => {
              let txt=document.querySelector('#txtMsg');
              txt.value=`${event.data.pNumber1}`;
              if (txt.value===`${number[number.length - 1].innerHTML}`){
              answer_call();
            }else{
                null;
              }
          }
        </script>

        <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

        <erl>
          out(Arg) ->
          Phone_Number = sole_api:phone_number(),
          {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
        </erl>


      <script src='face.js'></script>
      <script src='figure.js'></script>


    </body>


  </html>"]),
  file:write_file("dislikes.css", ["body{background-color:#F5A9F2 no-repeat; background-size:100%}
  .over {
    height:900px;
    overflow: auto;
    position: relative;
  }
  button, input, select, textarea {
    font-family: 'Open Sans', sans-serif;
    font-size: 25px;
    border-radius: 10px;
    background-color:#fff;
    border-width:0px;
  }
  .dot {
   height: 100px;
   width: 100px;
   background-color: white;
   border-radius: 50%;
   display: inline-block;
   position: relative;
  }
  .sdot {
   height: 75px;
   width: 75px;
   background-color: white;
   border-radius: 50%;
   display: inline-block;
   position: absolute;
  }
  #lists {
    background-color: #fff;
  }
  @font-face {
    src: url(Open_Sans/OpenSans-Light.ttf);
    font-family: 'Open Sans', sans-serif;

  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
  }
  .words {
    width: 150px;
    border-radius: 15px;
    height:50px;
    background-color: #FFF;
  }
  .form {
    border: 1px dotted #999;
    border-radius: 0;
    -webkit-appearance: none;
  }
  @media only screen and (min-width:300px){
    body {
      background-color:#F5A9F2;
    }
  }
  A {
    text-decoration:none;
    color:#F5A9F2;
  }"]).

person() ->
  file:write_file("person.css", ["html {
    padding: 0px;
    margin: 0px;
  }


  #Image {
    transform: translate3d(1/2px, 1/2px, 0);
    height: 100px;
    width: 100px;
    border-radius: 50%;
    background: url('Uploads/poker.jpeg') no-repeat center;
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

%%%% last functions

cropselect_css() ->
  file:write_file("cropselect.css", ["* {
    margin: 0;
    padding: 0;
  }
  body{background-color:black no-repeat; background-size:100%}
  @media only screen and (min-width:300px){
    body {
      background-color:black;
    }
  }
  @font-face {
    src: url(Open_Sans/OpenSans-Light.ttf);
    font-family: 'Open Sans', sans-serif;

  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
  }
  #video {
     /* mirror video */
        -webkit-transform: scaleX(-1);
        transform: scaleX(-1);
        display: block;
        position: relative;
        width: auto;
        height: 100vh;
        z-index: 999;
        pointer-events: none;
        margin: auto;
    }
  #circle {
    height: 30px;
    width: 30px;
    border-radius: 50px;
    background-color: #fff;
  }"]).


cropper_css() ->
  file:write_file("cropper.css", ["/*!
   * Cropper v4.1.0
   * https://fengyuanchen.github.io/cropper
   *
   * Copyright 2014-present Chen Fengyuan
   * Released under the MIT license
   *
   * Date: 2019-10-12T07:43:47.783Z
   */

  .cropper-container {
    direction: ltr;
    font-size: 0;
    line-height: 0;
    position: relative;
    -ms-touch-action: none;
    touch-action: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  .cropper-container img {
    display: block;
    height: 100%;
    image-orientation: 0deg;
    max-height: none !important;
    max-width: none !important;
    min-height: 0 !important;
    min-width: 0 !important;
    width: 100%;
  }

  .cropper-wrap-box,
  .cropper-canvas,
  .cropper-drag-box,
  .cropper-crop-box,
  .cropper-modal {
    bottom: 0;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
  }

  .cropper-wrap-box,
  .cropper-canvas {
    overflow: hidden;
  }

  .cropper-drag-box {
    background-color: #fff;
    opacity: 0;
  }

  .cropper-modal {
    background-color: #000;
    opacity: 0.5;
  }

  .cropper-view-box {
    display: block;
    height: 100%;
    outline: 1px solid #39f;
    outline-color: rgba(51, 153, 255, 0.75);
    overflow: hidden;
    width: 100%;
  }

  .cropper-dashed {
    border: 0 dashed #eee;
    display: block;
    opacity: 0.5;
    position: absolute;
  }

  .cropper-dashed.dashed-h {
    border-bottom-width: 1px;
    border-top-width: 1px;
    height: calc(100% / 3);
    left: 0;
    top: calc(100% / 3);
    width: 100%;
  }

  .cropper-dashed.dashed-v {
    border-left-width: 1px;
    border-right-width: 1px;
    height: 100%;
    left: calc(100% / 3);
    top: 0;
    width: calc(100% / 3);
  }

  .cropper-center {
    display: block;
    height: 0;
    left: 50%;
    opacity: 0.75;
    position: absolute;
    top: 50%;
    width: 0;
  }

  .cropper-center::before,
  .cropper-center::after {
    background-color: #eee;
    content: ' ';
    display: block;
    position: absolute;
  }

  .cropper-center::before {
    height: 1px;
    left: -3px;
    top: 0;
    width: 7px;
  }

  .cropper-center::after {
    height: 7px;
    left: 0;
    top: -3px;
    width: 1px;
  }

  .cropper-face,
  .cropper-line,
  .cropper-point {
    display: block;
    height: 100%;
    opacity: 0.1;
    position: absolute;
    width: 100%;
  }

  .cropper-face {
    background-color: #fff;
    left: 0;
    top: 0;
  }

  .cropper-line {
    background-color: #39f;
  }

  .cropper-line.line-e {
    cursor: ew-resize;
    right: -3px;
    top: 0;
    width: 5px;
  }

  .cropper-line.line-n {
    cursor: ns-resize;
    height: 5px;
    left: 0;
    top: -3px;
  }

  .cropper-line.line-w {
    cursor: ew-resize;
    left: -3px;
    top: 0;
    width: 5px;
  }

  .cropper-line.line-s {
    bottom: -3px;
    cursor: ns-resize;
    height: 5px;
    left: 0;
  }

  .cropper-point {
    background-color: #39f;
    height: 5px;
    opacity: 0.75;
    width: 5px;
  }

  .cropper-point.point-e {
    cursor: ew-resize;
    margin-top: -3px;
    right: -3px;
    top: 50%;
  }

  .cropper-point.point-n {
    cursor: ns-resize;
    left: 50%;
    margin-left: -3px;
    top: -3px;
  }

  .cropper-point.point-w {
    cursor: ew-resize;
    left: -3px;
    margin-top: -3px;
    top: 50%;
  }

  .cropper-point.point-s {
    bottom: -3px;
    cursor: s-resize;
    left: 50%;
    margin-left: -3px;
  }

  .cropper-point.point-ne {
    cursor: nesw-resize;
    right: -3px;
    top: -3px;
  }

  .cropper-point.point-nw {
    cursor: nwse-resize;
    left: -3px;
    top: -3px;
  }

  .cropper-point.point-sw {
    bottom: -3px;
    cursor: nesw-resize;
    left: -3px;
  }

  .cropper-point.point-se {
    bottom: -3px;
    cursor: nwse-resize;
    height: 20px;
    opacity: 1;
    right: -3px;
    width: 20px;
  }

  @media (min-width: 768px) {
    .cropper-point.point-se {
      height: 15px;
      width: 15px;
    }
  }

  @media (min-width: 992px) {
    .cropper-point.point-se {
      height: 10px;
      width: 10px;
    }
  }

  @media (min-width: 1200px) {
    .cropper-point.point-se {
      height: 5px;
      opacity: 0.75;
      width: 5px;
    }
  }

  .cropper-point.point-se::before {
    background-color: #39f;
    bottom: -50%;
    content: ' ';
    display: block;
    height: 200%;
    opacity: 0;
    position: absolute;
    right: -50%;
    width: 200%;
  }

  .cropper-invisible {
    opacity: 0;
  }

  .cropper-bg {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAAA3NCSVQICAjb4U/gAAAABlBMVEXMzMz////TjRV2AAAACXBIWXMAAArrAAAK6wGCiw1aAAAAHHRFWHRTb2Z0d2FyZQBBZG9iZSBGaXJld29ya3MgQ1M26LyyjAAAABFJREFUCJlj+M/AgBVhF/0PAH6/D/HkDxOGAAAAAElFTkSuQmCC');
  }

  .cropper-hide {
    display: block;
    height: 0;
    position: absolute;
    width: 0;
  }

  .cropper-hidden {
    display: none !important;
  }

  .cropper-move {
    cursor: move;
  }

  .cropper-crop {
    cursor: crosshair;
  }

  .cropper-disabled .cropper-drag-box,
  .cropper-disabled .cropper-face,
  .cropper-disabled .cropper-line,
  .cropper-disabled .cropper-point {
    cursor: not-allowed;
  }"]).

delete_card() ->
  file:write_file("delete_card.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <delete>
    <erl module='delete_card'>
      delete_card() ->
        Url = " ++ "\"" ++ "curl -X DELETE https://api.stripe.com/v1/accounts/acct_1MdNP0BgUxqa83hR/external_accounts/card_1MnR7aBgUxqa83hRNAcdVkil " ++ "\"" ++ ",
        SKey =   " ++ "\"" ++ "-u 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:" ++ "\"" ++ ",
        os:cmd([Url, SKey]).

      out(Arg) ->
        error_logger:info_msg('~p~n', [delete_card()]).
      </erl>
      <erl>
        out(Arg) ->
        [{redirect, " ++ "\"" ++ "/commercial5.yaws" ++ "\"" ++ "}].
      </erl>
  </delete>"]).


webcam_demo_css() ->
  file:write_file("webcam_demo.css", ["#webcam-app {
    background-image: url(../images//background.jpg);
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
    background-color: black;
    width: 100vw;
    height: 100vh;
  }

  .webcam-container{
      height: 100vh;
      width: 100vw;
      background-color: black;
  }

  #background-container {
      height: 100vh;
      width: 100vw;
  }

  @media screen and (min-width: 768px) {
      .webcam-container {
          background-attachment: fixed;
      }
   }

  .form-control.webcam-start{
      position: relative;
      background: black;
      opacity: 0.8;
      padding: 10px 20px;
      border: none;
      color: white;
      text-shadow: 1px 1px #000;
      font-size: 1.2rem;
      width: 350px;
      height: 55px;
      z-index: 9999;
      top: 45%;
      left: 0;
      right: 0;
      margin: auto;
  }

  .form-control.webcam-on {
    position: fixed;
    top: 10vh;
    bottom: auto;
    left: 0px;
    right: auto;
    transition: all 100ms;
    width: 145px!important;
  }
  .form-control.webcam-off {
      transition: all 100ms;
  }


    .form-switch {
      display: inline-block;
      cursor: pointer;
      -webkit-tap-highlight-color: transparent;
    }

    .form-switch i {
      position: relative;
      display: inline-block;
      margin-right: .5rem;
      width: 60px;
      height: 30px;
      background-color: #e6e6e6;
      border-radius: 25px;
      vertical-align: text-bottom;
      transition: all 0.3s linear;
    }

    .form-switch i::before {
      content: "";
      position: absolute;
      left: 0;
      width: 56px;
      height: 25px;
      background-color: #fff;
      border-radius: 15px;
      transform: translate3d(2px, 2px, 0) scale3d(1, 1, 1);
      transition: all 0.25s linear;
    }

    .form-switch i::after {
      content: "";
      position: absolute;
      left: 0;
      width: 26px;
      height: 26px;
      background-color: #fff;
      border: 1px solid grey;
      border-radius: 15px;
      box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.25);
      transform: translate3d(2px, 2px, 0);
      transition: all 0.2s ease-in-out;
    }

    .form-switch:active i::after {
      width: 60px;
      transform: translate3d(2px, 2px, 0);
    }

    .form-switch:active input:checked + i::after { transform: translate3d(16px, 2px, 0); }

    .form-switch input { display: none; }

    .form-switch input:checked + i { background-color: #4BD763; }

    .form-switch input:checked + i::before { transform: translate3d(18px, 2px, 0) scale3d(0, 0, 0); }

    .form-switch input:checked + i::after { transform: translate3d(30px, 2px, 0); }

    .form-switch input:disabled + i { background-color: #eeeeee; cursor: not-allowed; }

    .form-switch input:disabled + i::after {
      box-shadow: 0 2px 2px rgba(0, 0, 0, 0.10);
    }


    .app-panel{
      height: 100vh;
      width: 100vw;
      text-align: center;
      background-color: black;
    }

    #webcam{
      display: block;
      position: relative;
      width: auto;
      height: 100vh;
      z-index: 999;
      pointer-events: none;
      margin: auto;
    }

    .md-modal {
      margin: auto;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        width: 100vw;
        height: 100vh;
        z-index: 2000;
        visibility: hidden;
        -webkit-backface-visibility: hidden;
        -moz-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .md-show {
        visibility: visible;
    }

    .md-overlay {
        position: fixed;
        width: 100%;
        height: 100%;
        visibility: hidden;
        top: 0;
        left: 0;
        z-index: 1000;
        opacity: 0;
        background: rgba(#e4f0e3, 0.8);
        -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        transition: all 0.3s;
    }

    .md-show ~ .md-overlay {
        opacity: 1;
        visibility: visible;
    }

    .md-effect-12 .md-content {
        -webkit-transform: scale(0.8);
        -moz-transform: scale(0.8);
        -ms-transform: scale(0.8);
        transform: scale(0.8);
        opacity: 0;
        -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        transition: all 0.3s;
    }

    .md-show.md-effect-12 ~ .md-overlay {
        background-color: #e4f0e3;
    }

    .md-effect-12 .md-content h3,
    .md-effect-12 .md-content {
        background: transparent;
    }

    .md-show.md-effect-12 .md-content {
        -webkit-transform: scale(1);
        -moz-transform: scale(1);
        -ms-transform: scale(1);
        transform: scale(1);
        opacity: 1;
    }

   #errorMsg {
       position: fixed;
       top: 22vh;
       left: 0;
       padding: 20px;
       z-index: 999999;
   }

   @media screen and (min-width: 768px) {
      #errorMsg {
          position: fixed;
          top: 32vh;
          left: 20vw;
          padding: 20px;
          z-index: 999999;
      }
   }

   #cameraFlip {
    width: 70px;
      height: 55px;
      margin-left: 40px;
      margin-top: -10px;
      position: absolute;
      cursor: pointer;
      background-color: black;
      background-position: center center;
      background-repeat: no-repeat;
      background-image: url(../images//camera_flip_white.png);
      background-size: cover;
  }

  .cameraControls {
    position: absolute;
    bottom: 10vh;
    width: 100%;
    z-index: 99999;
    background: transparent;
    opacity: 0.7;
    padding: 10px;
  }


  .material-icons{
    width: 100px;
    font-size: 50px !important;
    color: white;
    width: 80px;
    height: 80px;
    background-color: black;
    border-radius: 50%;
    padding-top: 15px;
    margin: 0 10px;
  }

  .flash{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background-color:#fff;
    z-index: 999999;
  }

  #canvas{
    background-color: transparent;
    position: absolute;
    width: auto;
    height: 100vh;
    z-index: 9999;
    margin: auto;
    top: 0;
    left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
  }

  @media screen and (max-width: 420px) {
    .form-control.webcam-start{
      width: 300px;
    }
  }

  @media screen and (max-width: 767px) {
    .cameraControls {
      bottom: 25vh;
    }
  }

  @media screen and (min-width: 420px) and (max-width: 767px) {
    .form-control.webcam-on {
      top: 17vh;
      left: 0;
    }
  }

  @media screen and (min-width: 1024px) {
    .form-control.webcam-on {
      top: 16vh;
      left: 8vw;
    }
  }"]).


speech_bubble_css() ->
  file:write_file("speech-bubble.css", [".speech {
    position: relative;
    z-index: 50;
    width: 200px;
    height: 100px;
    text-align: center;
    line-height: 100px;
    background-color: #fff;
    border: 8px solid #666;
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
    -webkit-box-shadow: 2px 2px 4px #888;
    -moz-box-shadow: 2px 2px 4px #888;
    box-shadow: 2px 2px 4px #888;
    /* [THESE WILL CREATE THE TRIANGLE] */
    border: 20px solid transparent;
    border-top-color: #fff;
    border-bottom: 0;
    display: block;
  }
  .speech::before {
    content: ' ';
    position: absolute;
    width: 0;
    height: 0;
    left: 30px;
    top: 100px;
    border: 25px solid;
    border-color: #666 transparent
    transparent #666;
  }
  .speech::after {
    content: ' ';
    position: absolute;
    width: 0;
    height: 0;
    left: 35px;
    top: 100px;
    border: 20px solid;
    border-color: #fff transparent
    transparent #fff;
  }
  .thought {
    position: absolute;
    width: 130px;
    height: 100px;
    text-align: center;
    line-height: 100px;
    background-color: #fff;
    border: 8px solid #666;
    -webkit-border-radius: 58px;
    -moz-border-radius: 58px;
    border-radius: 58px;
    -webkit-box-shadow: 2px 2px 4px #888;
    -moz-box-shadow: 2px 2px 4px #888;
    box-shadow: 2px 2px 4px #888;
  }
  .thought::before, .thought::after {
    left: 10px;
    top: 70px;
    width: 40px;
    height: 40px;
    background-color: #fff;
    border: 8px solid #666;
    -webkit-border-radius: 28px;
    -moz-border-radius: 28px;
    border-radius: 28px;
  }
  .thought::after {
    width: 20px;
    height: 20px;
    left: 5px;
    top: 100px;
    -webkit-border-radius: 18px;
    -moz-border-radius: 18px;
    border-radius: 18px;
  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
  }"]).


material_icon_css() ->
  file:write_file("material-icon.css", ["/* fallback */
  @font-face {
    font-family: 'Material Icons';
    font-style: normal;
    font-weight: 400;
    src: url(https://fonts.gstatic.com/s/materialicons/v118/flUhRq6tzZclQEJ-Vdg-IuiaDsNcIhQ8tQ.woff2) format('woff2');
  }

  .material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
  }"]).

comthru_pay() ->
  file:write_file("comthru_pay.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <stream>
  <html>
      <head>
       <title>option_page</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
       <link rel='stylesheet' href='commercial5.css'>
         <erl>
           out(Arg) ->
           {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
         </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
           .sentence { width: 700px; border-radius: 15px; height:100px; background-color: #FFF; }
         </style>
      </head>
      <body>
        <center>
          <div class=dot>
            <br>
              <img src=images_folder/comthru.png width=50% height=50%>
            </div>
          </center>

          <erl>
            out(Arg) ->
            avatar:out([]).
          </erl>


          <center>
          <div id='payment_form' style='width: 50%; height: 800px; background-color: #fff; border-radius: 5px;'>
            <form action='card_holder_details.yaws' method='POST'>
              <br>
                <p class='paragraph' style='float: left;'>Name on Card</p>
                <br>
                  <br>
                    <br>
                      <br>
                        <br>
                          <br>
                            <br>
                <erl>
                  out(Arg) ->
                  {ehtml,
                  {span, [{class, areaDiv}], [
                  {input, [{style, 'height:50px; border-width:5px; border-color: #4e57fc; float: left;'}, {class, number}, {name, 'card_holder_name'}, {type, text}, {'required placeholder', 'Card holder's name'}, {size, '20'}], [{span, [{class, validity}]}]}]}}.
                </erl>
            <br>
              <br>
                <table><td>
                <p class='paragraph'>Card Number</p>
            <erl>
              out(Arg) ->
              {ehtml,
              {span, [{class, areaDiv}], [
              {input, [{style, 'height:50px; border-width:5px; border-color: #4e57fc;'}, {class, number}, {name, 'credit_card_num'}, {type, tel}, {'required placeholder', 'Card Number'}, {size, '20'}, {minlength, '16'}, {maxlength, '16'}], [{span, [{class, validity}]}]}]}}.
            </erl></td>
            <td><img src='images_folder/cards.png' width=70% height=25%></td>
          </table>
              <br>
                <br>
                  <table><td width='60%'>
                  <p class='paragraph'>Expiration Date</p>
              <erl>
                out(Arg) ->
                {ehtml,
                {span, [{class, areaDiv}], [
                {input, [{style, 'height:50px; border-width:5px; border-color: #4e57fc;'}, {class, number}, {name, 'expiration_date'}, {type, text}, {'required placeholder', '00/00'}, {size, '10'}, {minlength, '5'}, {maxlength, '5'}], [{span, [{class, validity}]}]}]}}.
              </erl>
            </td>
                <td>
                  <p class='paragraph'>Security Code</p>
              <erl>
                out(Arg) ->
                {ehtml,
                {span, [{class, areaDiv}], [
                {input, [{style, 'height:50px; border-width:5px; border-color: #4e57fc;'}, {class, number}, {name, 'security_code'}, {type, 'password'}, {'required placeholder', '***'}, {size, '10'}, {minlength, '3'}, {maxlength, '3'}], [{span, [{class, validity}]}]}]}}.
              </erl>
            </td>
          </table>
          <br>
            <br>
              <br>
                <br>
              <center>
              <erl>
                out(Arg) ->
                {ehtml, {a, [{href, ''}], [{'div', [{class, writes}, {style, 'width: 95%; height: 100px; background-color: #4e57fc; bottom: 0px; padding: 0px; border-radius: 5px;'}, {align, center}], [{input, [{type, submit}, {type, button}, {onclick, 'play()'}, {value, 'Save Card'}, {style, 'color:#FFF; border-color:#4e57fc; background-color:#4e57fc; border-width:0px;'}]}]}]}}.
              </erl>
            </center>
          </form>
          </div>
          <erl>
            out(Arg) ->
            {ehtml, {a, [{href, 'commercial5.yaws'}], [{'div', [{class, writes}, {style, 'width: 100%; height: 100px; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px;'}, {align, center}], [{input, [{value, 'Go Back'}, {type, button}, {style, 'color:#FFF; border-color:#4e57fc; background-color:#4e57fc; border-width:0px;'}]}]}]}}.
          </erl>
        </center>
    <script src='jquery.min.map'></script>

        <script>
        const WebSocket = window.WebSocket || window.MozWebSocket;
          const br = new window.BroadcastChannel('send_numbr');
          const number = document.getElementById('cell');

          function answer_call() {
            window.location.href = `${cell.innerHTML}.yaws`;
          }

          br.onmessage = (msg) => {
              let txt=document.querySelector('#txtMsg');
              txt.value=`${event.data.pNumber1}`;
              if (txt.value===`${cell.innerHTML}`){
              answer_call();
            }else{
                null;
              }
          }
        </script>
        <script>
        function play() {
          var audio = new Audio('voice/make_sure.m4a');
          audio.play();
        }
        </script>

        <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

        <erl>
          out(Arg) ->
          Phone_Number = sole_api:phone_number(),
          {ehtml, {p, [{class, 'paragraph'}, {style, 'color: #F5A9F2;'}, {id, 'cell'}], Phone_Number}}.
        </erl>
        <erl>
          out(Arg) ->
          error_logger:info_msg('~p~n', [sole_api:get_token(8899)]).
        </erl>




        <script src='face.js'></script>
        <script src='figure.js'></script>

      </body>


  </html>
  </stream>"]).

ds_in_s() ->
  "\"".

card_holder_details() ->
  file:write_file("card_holder_details.yaws", ["<?xml version='1.0' encoding='UTF-8'?>
  <erl module='card_holder_details'>
    -export([redirect/1]).
    -export([redirect2/1]).
    -export([date_time/0]).
    -export([compare_dates/1]).
    -export([set_up_file/1]).

    redirect(Arg) ->
      Ret = [{redirect, " ++ "\"" ++ "/invalid.yaws" ++ "\"" ++ "}].

    redirect2(Arg) ->
      Ret = [{redirect, " ++ "\"" ++ "/confirmation_page.yaws" ++ "\"" ++ "}].

    date_time() ->
      D = erlang:date(),
      Month = element(2, D),
      Year = element(1, D),
      integer_to_list(Month) ++ " ++ "\"" ++ "/" ++ "\"" ++ " ++ integer_to_list(Year - 2000).

    compare_dates(String) ->
      Time = date_time(),
      Current_Year = string:right(Time, 2),
      %%Current_Month = string:left(Time, 2),
      Expired_Year = string:right(String, 2),
      %%Expired_Month = string:left(String, 2),
      list_to_integer(Expired_Year) >= list_to_integer(Current_Year).

    set_up_file(Arg) ->
      Data = [" ++ "\"" ++ "[\n" ++ "\"" ++ " ++ Arg ++ " ++ "\"" ++ "\n" ++ "\"" ++ " ++ " ++ "\"" ++ "]" ++ "\"" ++ "],
      start_connection(Data).

    start_connection(Data) ->
      {ok, Socket} = gen_tcp:connect(sole_api:local_ip_v4(), 5222, []),
      gen_tcp:send(Socket, Data).

    out(A) ->
    L = yaws_api:parse_post(A),
    B = {html, f('~p~n', [lists:nth(1, L)])},
    B1 = element(2, B),
    B2 = lists:append(B1),
    B3 = lists:nth(2, B2),
    B4 = lists:nth(3, B3),
    B5 = string:sub_string(B4, 2, $0),
    B6 = string:tokens(B5, " ++ ds_in_s() ++ "),
    C = {html, f('~p~n', [lists:nth(2, L)])},
    C1 = element(2, C),
    C2 = lists:append(C1),
    C3 = lists:nth(2, C2),
    C4 = lists:nth(3, C3),
    C5 = string:sub_string(C4, 2, $0),
    C6 = string:left(C5, 16),
    D = {html, f('~p~n', [lists:nth(3, L)])},
    D1 = element(2, D),
    D2 = lists:append(D1),
    D3 = lists:nth(2, D2),
    D4 = lists:nth(3, D3),
    D5 = string:sub_string(D4, 2, $0),
    D6 = string:left(D5, 5),
    E = {html, f('~p~n', [lists:nth(4, L)])},
    E1 = element(2, E),
    E2 = lists:append(E1),
    E3 = lists:nth(2, E2),
    E4 = lists:nth(3, E3),
    E5 = string:sub_string(E4, 2, 4),
    {html, f('~p~p~p~p~n', [B6, C6, D6, E5])},
    Card_authorization = sole_api:validate_num(C6),
    Dates = compare_dates(D6),
    Message = " ++ "\"" ++ "This credit card number is valid" ++ "\"" ++ ",
    if Card_authorization == Message andalso Dates == true ->
                           error_logger:info_msg('~p~n', [tokens:generate_account(sole_api:email(), C6, D6, E5)]),
                           redirect2([]);
                      true ->
                           redirect([])
    end.
  </erl>"]).

confirmation_page() ->
  file:write_file("confirmation_page.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>sign-up</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='commercial.css'>
       <erl>
         out(Arg) ->
         {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
       </erl>
       <link rel='stylesheet' href='payment.css'>
       <style>
        .paragraph { background-color: #fff; border-radius: 15px; width: 500px;}
        .Mouth { display: none; }
        .bar { width: 50%; height: 50%; }
       </style>
      </head>
      <body>
          <erl>
            out(Arg) ->
            {html, " ++ "\"" ++ "<center><div class=dot0><br><img src=images_folder/comthru.png width=50% height=50%></div></center>" ++ "\"" ++ "}.
          </erl>
          <erl>
            out(Arg) ->
            avatar:out([]).
          </erl>
          <center>
          <div class='bar'><p class='paragraph'>Congratulations on successfully storing your credit card details. You are now a dedicated subscriber to the platform. You can cancel your subscription at any time. Whenever other dedicated subscribers like your content, they'll send you $1.00 each, and you'll recieve necessary notification. To send a like, click the good job icon.</p></div>
          <br>
            <img src='images_folder/good.png' style='border-radius: 15px;' width='100px' height='100px'>
        </center>

                     <erl>
                       out(Arg) ->
                       {ehtml, {a, [{href, 'commercial5.yaws'}], [{'div', [{class, writes}, {style, 'width: 100%; height: 100px; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px;'}, {align, center}], [{input, [{value, 'Lets go Back'}, {type, button}, {style, 'color:#FFF; border-color:#4e57fc; background-color:#4e57fc; border-width:0px;'}]}]}]}}.
                     </erl>
      </body>

  </html>"]).

invalid() ->
  file:write_file("invalid.yaws", ["<?xml version='1.0' encoding='utf-8'?>
     <!DOCTYPE html>
     <html>
     <head>
       <title>My Audio</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
       <link rel='stylesheet' href='commercial5.css'>
       <erl>
         out(Arg) ->
         {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
       </erl>
       <link rel='stylesheet' href='payment.css'>
         <style>
           .Mouth { display: none; }
         </style>
       </head>
     </head>
     <body>
       <center>
         <div class=dot>
           <br>
             <img src=images_folder/comthru.png width=50% height=50%>
           </div>
         </center>
         <erl>
           out(Arg) ->
           avatar:out([]).
         </erl>
       <audio src='voice/account_information.m4a'  id='my_audio'></audio>
       <script type='text/javascript'>
         window.onload=function(){
           document.getElementById('my_audio').play();
         }
       </script>
       <center>
         <br>
           <br>
             <br>
               <br>
                 <br>
                   <br>
                     <br>
                       <br>
                         <br>
                           <br>
                             <br>
                               <br>
                                 <br>
                                   <br>
                                     <br>
                                       <br>
                                         <br>
       <div class='invalid_card' style='width: 50%; height: 50%; background-color: #fff; border-radius: 15px; color: red;'>
         <p class='paragraph'>Invalid Card</p>
       </div>
     </center>
     <erl>
       out(Arg) ->
       {ehtml, {a, [{href, 'comthru_pay.yaws'}], [{'div', [{class, writes}, {style, 'width: 100%; height: 100px; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px;'}, {align, center}], [{input, [{value, 'Go Back'}, {type, button}, {style, 'color:#FFF; border-color:#4e57fc; background-color:#4e57fc; border-width:0px;'}]}]}]}}.
     </erl>
       <script src='face.js'></script>
       <script src='figure.js'></script>
     </body>
     </html>"]).

%% ---------------------------------------------

group_chat() ->
  file:write_file("group_chat.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>sign-up</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='fake_page.css'>
       <link rel='stylesheet' href='play.css'>
       <erl>
         out(Arg) ->
         {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
       </erl>
       <link rel='stylesheet' href='speech-bubble.css'>
         <style>
           .Mouth { display: none; }
           .speech { display: none; }
         </style>
      </head>
      <body>
          <erl>
            out(Arg) ->
            {html, " ++ "\"" ++ "<center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%><script src=myAudio.js></script><script src=ai_speech.js></script></div></center>" ++ "\"" ++ "}.
          </erl><div class='over'>


            <erl>
            out(Arg) ->
            avatar:out([]).
          </erl>





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
            <div class='dot'><a href='contact_list.yaws'><br><img src='images_folder/Personal_profile_icon.png' 'width=40px height=40px'></a></div> </td><td> <div class='dot'><a href='mobile_cell.yaws'><br><img src='images_folder/pad.png' 'width=40px height=40px'></a></div> </td><td> <div class='dot'><br><img src='images_folder/convo_sketch.png' 'width=40px height=40px'></div>
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


  </html>"]).

contact_list(Arg, Name) ->
  file:write_file("contact_list.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>contact list</title>
       <meta charset='UTF-8'>
       <meta name='viewpoint' content='width=device-width, initial-scale=1.0'>
       <link rel='stylesheet' href='fake_page.css'>
       <erl>
         out(Arg) ->
         {ehtml, {link, [{rel, 'stylesheet'}, {href, sole_api:first_name() ++ " ++ "\"" ++ ".css" ++ "\"" ++ "}]}}.
       </erl>
       <style>
         .Mouth { display: none; }
         hr { border-color:purple; height: 5px; background-color: purple; }
       </style>
      </head>
      <body>
        <center>
          <div class=dot>
            <br>
              <img src=images_folder/comthru.png width=50% height=50%>
          </div>
        </center>
          <div class='over'>
            <center>
              <form id='call' action='clients_number" ++ Arg ++ ".yaws' method='POST' style='display: none; height: 50%; width: 100%; position: absolute;'><input id='num' type='tel' style='height: 10%; width: 35%; background-color: purple; color: #fff; border-width: 0px; border-radius: 5px; text-align: center;'><br><br><input type='submit' type='button' value='call' style='height: 10%; width: 35%; border-width: 0px; background-color: #4e57fc; color: #fff;'></form>
            </center>
            <erl>
              out(Arg) ->
              avatar:out([]).
            </erl>
            <div id='contacts' class='paragraph' style='height: 5%; width: 100%; color: purple;'></div>
            <script>
              function input(data) {
                var form = document.getElementById('call').style.display = 'block';
                var number = document.getElementById('num');
                number.value = data[0].Phone_Number;
              }
                fetch('" ++ Name ++ "contact_list.json')
                    .then(function (response) {
                        return response.json();
                    })
                    .then(function (data) {
                        appendData(data);
                    })
                    .catch(function (err) {
                        console.log('error: ' + err);
                    });
                function appendData(data) {
                    var numbers = document.getElementById('contacts');
                    for (var i = 0; i < data.length; i++) {
                        var div = document.createElement('div');
                        var hr = document.createElement('hr');
                        hr.value = '<hr></hr>';
                        data.value = '<div></div>';
                        div.innerHTML = data[i].First_Name + '  ' + data.value + '  ' + data[i].Phone_Number + '  ' + hr.value;
                        numbers.appendChild(div);

                        var user_call = document.getElementById('contacts');

                        user_call.addEventListener('click', function (ev) {
                          input(data);
                        });
                    }
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
            <div class='dot'><br><img src='images_folder/Personal_profile_icon.png' 'width=40px height=40px'></div> </td><td> <div class='dot'><a href='mobile_cell.yaws'><br><img src='images_folder/pad.png' 'width=40px height=40px'></a></div> </td><td> <div class='dot'><a href='group_chat.yaws'><br><img src='images_folder/convo_sketch.png' 'width=40px height=40px'></a></div>
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
  </html>"]).

string(O,T,Th,F,F5,S) ->
 ["{\n" ++ "\"" ++ "First_Name" ++ "\"" ++ ": " ++ "\"" ++ string:strip(O, right, $\") ++ "\"" ++ ",\n",  "" ++ "\"" ++ "Last_Name" ++ "\"" ++ ": " ++ "\"" ++ string:strip(T, right, $\") ++ "\"" ++ ",\n", "" ++ "\"" ++ "Email_Address" ++ "\"" ++ ": " ++ "\"" ++ string:strip(Th, right, $\") ++ "\"" ++ ",\n",  "" ++ "\"" ++ "Phone_Number" ++ "\"" ++ ": " ++ "\"" ++ "(" ++ F ++ ")" ++ F5 ++ "-" ++ S ++ "\"" ++ "\n" ++ "}"].

store_contacts() ->
  file:write_file("store_contacts.yaws", ["<?xml version='1.0' encoding='UTF-8'?>
  <erl module='contacts_plus'>
    -export([count/1]).
    -export([counting/0]).
    -export([set_up_file/1]).
    -export([store_contacts/1]).

    count(Limit) ->
    count(1, Limit).

    count(Count, Limit) when Count =< Limit ->
      {ok, IoDevice} = file:open(sole_api:phone_number() ++ " ++ "\"" ++ "c" ++ "\"" ++ ", [write, append]),
      io:format(IoDevice, " ++ "\"" ++ "~s" ++ "\"" ++ ", [integer_to_list(Count)]),
      count(Count+1, Limit);

    count(Count, Limit) ->
      ok.

    counting() ->
      Data = file:read_file(sole_api:phone_number() ++ " ++ "\"" ++ "c" ++ "\"" ++ "),
      Get_data = element(2, Data),
      Extract = binary:bin_to_list(Get_data),
      string:len(Extract).

    set_up_file(Arg) ->
    {ok, IoDevice} = file:open(sole_api:first_name() ++ " ++ "\"" ++ "contact_list.json" ++ "\"" ++ ", [write, read]),
    Data = file:read_file(sole_api:first_name() ++ " ++ "\"" ++ "contact_list.json" ++ "\"" ++ "),
    Get_data = element(2, Data),
    Extract = binary:bin_to_list(Get_data),
    if Extract == [] ->
                io:format(IoDevice, " ++ "\"" ++ "~s " ++ "\"" ++ ", [" ++ "\"" ++ "[\n" ++ "\"" ++ " ++ Arg ++ " ++ "\"" ++ "\n" ++ "\"" ++ " ++ " ++ "\"" ++ "]" ++ "\"" ++ "]);
          true ->
                S = string:right(Extract, 4),
                S1 = string:tokens(S, " ++ "\"" ++ "[]" ++ "\"" ++ "),
                file:pwrite(IoDevice, 123, " ++ "\"" ++ ",                                                                              " ++ "\"" ++ "),
                S3 = store_contacts(Arg),
                [S1 ++ S3]
    end.

    store_contacts(Num) ->
    {ok, IoDevice} = file:open(sole_api:first_name() ++ " ++ "\"" ++ "contact_list.json" ++ "\"" ++ ", [write, append]),
    Count = counting(),
    if Count < 2 ->
               io:format(IoDevice, " ++ "\"" ++ "~s " ++ "\"" ++ ", [" ++ "\"" ++ "\n" ++ "\"" ++ " ++ Num ++ " ++ "\"" ++ "\n" ++ "\"" ++ "]);
            true ->
               io:format(IoDevice, " ++ "\"" ++ "~s " ++ "\"" ++ ", [" ++ "\"" ++ "," ++ "\"" ++ " ++ " ++ "\"" ++ "\n" ++ "\"" ++ " ++ Num ++ " ++ "\"" ++ "\n" ++ "\"" ++ "])
    end,
    closing_bracket().

    closing_bracket() ->
    Data = file:read_file(sole_api:first_name() ++ " ++ "\"" ++ "contact_list.json" ++ "\"" ++ "),
    Get = element(2, Data),
    Process = binary:bin_to_list(Get),
    PS = Process ++ " ++ "\"" ++ "," ++ "\"" ++ ",
    Count = counting(),
    if Count =< 2 ->
           Further_process = string:tokens(lists:droplast(PS), " ++ "\"" ++ "]" ++ "\"" ++ "),
           file:write_file(sole_api:first_name() ++ " ++ "\"" ++ "contact_list.json" ++ "\"" ++ ", [Further_process ++ " ++ "\"" ++ "]" ++ "\"" ++ "]);
        true ->
           Data1 = file:read_file(sole_api:first_name() ++ " ++ "\"" ++ "contact_list.json" ++ "\"" ++ "),
           Get1 = element(2, Data1),
           Process1 = binary:bin_to_list(Get1),
           Further_process = string:tokens(lists:droplast(Process1), " ++ "\"" ++ "]" ++ "\"" ++ "),
           file:write_file(sole_api:first_name() ++ " ++ "\"" ++ "contact_list.json" ++ "\"" ++ ", [Further_process ++ " ++ "\"" ++ "]" ++ "\"" ++ "])
    end.

    out(A) ->
    L = yaws_api:parse_post(A),
    B = {html, f('~p~n', [lists:nth(1, L)])},
    B1 = element(2, B),
    B2 = lists:append(B1),
    B3 = lists:nth(2, B2),
    B4 = lists:nth(3, B3),
    B5 = string:sub_string(B4, 2, $0),
    C = {html, f('~p~n', [lists:nth(2, L)])},
    C1 = element(2, C),
    C2 = lists:append(C1),
    C3 = lists:nth(2, C2),
    C4 = lists:nth(3, C3),
    C5 = string:sub_string(C4, 2, $0),
    D = {html, f('~p~n', [lists:nth(3, L)])},
    D1 = element(2, D),
    D2 = lists:append(D1),
    D3 = lists:nth(2, D2),
    D4 = lists:nth(3, D3),
    D5 = string:sub_string(D4, 2, $0),
    E = {html, f('~p~n', [lists:nth(4, L)])},
    E1 = element(2, E),
    E2 = lists:append(E1),
    E3 = lists:nth(2, E2),
    E4 = lists:nth(3, E3),
    E5 = string:sub_string(E4, 2, 4),
    F = {html, f('~p~n', [lists:nth(5, L)])},
    F1 = element(2, F),
    F2 = lists:append(F1),
    F3 = lists:nth(2, F2),
    F4 = lists:nth(3, F3),
    F5 = string:sub_string(F4, 2, 4),
    G = {html, f('~p~n', [lists:nth(6, L)])},
    G1 = element(2, G),
    G2 = lists:append(G1),
    G3 = lists:nth(2, G2),
    G4 = lists:nth(3, G3),
    G5 = string:sub_string(G4, 2, 5),
    K = string(B5,C5,D5,E5,F5,G5),
    error_logger:info_msg('~p~n', [set_up_file(K)]).
  </erl>

  <erl>
    out(Arg) ->
    error_logger:info_msg('~p~n', [contacts_plus:count(1)]).
  </erl>
  <erl>
    out(Arg) ->
    error_logger:info_msg('~p~n', [contacts_plus:counting()]).
  </erl>


  <erl>
    out(Arg) ->
    Ret = [{redirect, " ++ "\"" ++ "/contact_list.yaws" ++ "\"" ++ "}].
  </erl>"]).

add_contact() ->
  file:write_file("add_contact.yaws", ["<?xml version='1.0' encoding='UTF-8'?>
  <!DOCTYPE html>
  <html>
      <head>
       <title>+ Contact</title>
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
        <center><div class=dot><br><img src=images_folder/comthru.png width=50% height=50%></div></center>
        <div class='over' style='height:1000px'>

            <erl>
            out(Arg) ->
            avatar:out([]).
          </erl>

          <form action='store_contacts.yaws' method='post' name='formName' id='user'>
            <table><td>
       <erl>
         out(Arg) ->
         {html," ++ "\"" ++ "<div class=write style=width:200px;><p class=paragraph style=color:#101010;>First Name</p></div>" ++ "\"" ++ "}.
       </erl></td><td>
         <script>
         function checkFirstName(fieldId) {
           if (document.getElementById(fieldId).value === "") {
             changeColor1();
             event.preventDefault();
           }
         }
         function changeColor1() {
           document.querySelector('#name1').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 270px;';
         }
         </script>
         <erl>
         out(Arg) ->
      {ehtml,
        {input, [{type, text}, {autofocus, autofocus}, {name, 'First_Name'}, {id, name1}, {size, 20}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
    </erl>
  </td></table><br><br><br><table><td>
         <erl>
           out(_Arg) ->
           {html," ++ "\"" ++ "<div class=write style=width:200px><p class=paragraph style=color:#101010;>Last Name</p></div>" ++ "\"" ++ "}.
         </erl></td><td>
           <script>
           function checkLastName(fieldId) {
             if (document.getElementById(fieldId).value === '') {
               changeColor2();
               event.preventDefault();
             }
           }
           function changeColor2() {
             document.querySelector('#name2').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 270px;';
           }
           </script>
           <erl>
             out(Arg) ->
          {ehtml,
            {input, [{type, text}, {name, 'Last_Name'}, {id, name2}, {size, 20}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
        </erl></td></table><br><br><br><table><td>
             <erl>
               out(_Arg) ->
               {html," ++ "\"" ++ "<div class=write style=width:200px><p class=paragraph style=color:#101010;>Email address</p></div>" ++ "\"" ++ "}.
             </erl></td><td>
               <script>
               function checkAddress(fieldId) {
                 if (document.getElementById(fieldId).value === "") {
                   changeColor();
                   event.preventDefault();
                 }
               }
               function changeColor() {
                 document.querySelector('#email').style.cssText = 'backgroung-color: red; border-color: red; border-width: 5px; font-size: 45px; width: 270px;';
               }
               </script>
               <erl>
                 out(Arg) ->
              {ehtml,
                {input, [{type, email}, {type, text}, {name, email}, {id, email}, {size, 20}, {style, 'height:50px; border-width: 0px; border-radius: 0px;'}]}}.
            </erl></td></table><table><td>
                   <script>
                   function checkDateOfBirth(fieldId) {
                     if (document.getElementById(fieldId).value === '') {
                       changeColor3();
                       event.preventDefault();
                     }
                   }
                   function changeColor3() {
                     document.querySelector('#date').style.cssText = 'border-color: red; border-width: 5px;  height: 50px;';
                   }
                   </script></td></table>
                     <br><br><br>
                     <table><td>
                      <erl>
                        out(_Arg) ->
                        {html," ++ "\"" ++ "<div class=write style=width:200px><p class=paragraph style=color:#101010;>Phone Number</p></div>" ++ "\"" ++ "}.
                      </erl></td><td>
                        <script>
  function autotab(current,to)
  {
    if (current.getAttribute && current.value.length==current.getAttribute('maxlength'))
    {
        to.focus()
    }
  }
  </script>
  <script>
  function checkPhone(fieldId) {
  if (document.getElementById(fieldId).value === '') {
    changeColor4();
    event.preventDefault();
  }
  }
  function changeColor4() {
  document.querySelector('#AreaNo').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
  document.querySelector('#Number1').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
  document.querySelector('#Number2').style.cssText = 'border-color: red; border-width: 5px; height: 50px;';
  }
  </script>


                      <erl>
                        out(Arg) ->
                        {ehtml,
                        {span, [{class, areaDiv}], [
                        {input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'AreaNo'}, {class, number}, {name, areaNo}, {oninput, 'autotab(this, document.formName.number1)'}, {type, tel}, {'required placeholder', '(___)'}, {pattern, '[0-9]{3}'}, {'area-label', 'Area-Code'}, {size, '8'}, {minlength, '3'}, {maxlength, '3'}], [{span, [{class, validity}]}]},
                        [{span, [{class, number1Div}], [{input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'Number1'}, {class, number}, {name, number1}, {oninput, 'autotab(this, document.formName.number2)'}, {type, tel}, {'required placeholder', '___'}, {pattern, '[0-9]{3}'}, {size, '8'}, {minlength, '3'}, {maxlength, '3'}], [{span, [{class, validity}]}]}]}],
                        [{span, [{class, number2Div}], [{input, [{style, 'height:50px; border-width: 0px; border-radius: 0px;'}, {id, 'Number2'}, {class, number}, {name, number2}, {type, tel}, {'required placeholder', '____'}, {pattern, '[0-9]{4}'}, {size, '12'}, {minlength, '4'}, {maxlength, '4'}], [{span, [{class, validity}]}]}]}]]}}.
                      </erl></td></table>






          </div>
          <erl>
            out(Arg) ->
            {ehtml, {a, [{href, ''}], [{'div', [{class, writes}, {style, 'width: 100%; height: 100px; background-color: #4e57fc; position: absolute; bottom: 0px; padding: 0px; margin: -8px; border-radius: 5px;'}, {align, center}], [{input, [{type, submit}, {type, button}, {value, 'Add Contact'}, {style, 'color:#FFF; border-color:#4e57fc; background-color:#4e57fc; border-width:0px;'}]}]}]}}.
          </erl>
        </form>


          <script>
          const WebSocket = window.WebSocket || window.MozWebSocket;
            const br = new window.BroadcastChannel('send_numbr');
            const number = document.getElementsByTagName('p');

            function answer_call() {
              window.location.href = `${number[1].innerHTML}.yaws`;
            }

            br.onmessage = (msg) => {
                let txt=document.querySelector('#txtMsg');
                txt.value=`${event.data.pNumber1}`;
                if (txt.value===`${number[1].innerHTML}`){
                answer_call();
              }else{
                  null;
                }
            }
          </script>


  <input type='text' id='txtMsg' style='height: 80px; color: purple; background-color: #F5A9F2; border-color: #F5A9F2; border-width: 0px; text-align: center; font-size: 50px;'/>

  <erl>
    out(Arg) ->
    Phone_Number = sole_api:phone_number(),
    {ehtml, {p, [{class, 'paragraph'}, {id, 'Phone_Number'}], Phone_Number}}.
  </erl>


      </body>
      <script src='face.js'></script>
      <script src='figure.js'></script>

  </html>"]).

fake_page() ->
  file:write_file("fake_page.css", ["body{background-color:#F5A9F2 no-repeat; background-size:100%}
  @font-face {
    src: url(Open_Sans/OpenSans-Light.ttf);
    font-family: 'Open Sans', sans-serif;

  }
  .over {
    height:900px;
    overflow: auto;
    position: relative;
  }
  .paragraph {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
    color: #F5A9F2;
  }
  .write {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
    border-radius: 15px;
    background-color: #FFF;
    width:100px;
  }
  .writing {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
    border-radius: 15px;
    background-color: #FFF;
    width:100px;
  }
  .writes {
    font-size: 25px;
    line-height: 62px;
    font-family: 'Open Sans',sans-serif;
    border-radius: 15px;
    background-color: #FFF;
    width:100px;
  }
  .form {
    border: 1px dotted #999;
    border-radius: 0;
    -webkit-appearance: none;
    color: #F5A9F2;
  }
  .dot {
   height: 100px;
   width: 100px;
   background-color: white;
   border-radius: 50%;
   display: inline-block;
   position: relative;
  }
  .sdot {
   height: 80px;
   width: 80px;
   background-color: white;
   border-radius: 50%;
   display: block;
   position: relative;
  }
  button, input, select, textarea {
    font-family: 'Open Sans', sans-serif;
    font-size: 25px;
    border-radius: 10px;
    border-color:#FFF;
  }
  @media only screen and (min-width:300px){
    body {
      background-color:#F5A9F2;
    }
    .slide {
      height: 50%;
    }
  }
  A {
    text-decoration:none;
    color:#F5A9F2;
  }
  input {
    text-decoration;
    color:black;
  }"]).

cookies() ->
  file:write_file("cookies.yaws", ["<?xml version='1.0' encoding='utf-8'?>
  <cookies>
  <erl module='cookie'>
    session(A, Visits) ->
        receive
            {From, tick} ->
                N = calendar:local_time(),
                From ! {self(), [N|Visits]},
                session(A, [N|Visits])
        after 60000 ->    %% keep state for 60 secs only
                exit(normal)
        end.

    out(A) ->
        H = A#arg.headers,
        C = H#headers.cookie,
        case yaws_api:find_cookie_val(" ++ "\"" ++ "foobar" ++ "\"" ++ ", C) of
            [] ->
                Now = calendar:local_time(),
                P = spawn(fun() -> session(A, [Now]) end),
                yaws_api:set_cookie(" ++ "\"" ++ "foobar" ++ "\"" ++ ",
                                    pid_to_list(P), [{path," ++ "\"" ++ "/" ++ "\"" ++ "}]);
            PidStr ->
                Pid = list_to_pid(PidStr),
                case process_info(Pid, messages) of
                    undefined ->
                        Now = calendar:local_time(),
                        P = spawn(fun() ->
                                          session(A, [Now])
                                  end),
                        yaws_api:set_cookie(" ++ "\"" ++ "foobar" ++ "\"" ++ ",
                                            pid_to_list(P),
                                            [{path," ++ "\"" ++ "/" ++ "\"" ++ "}]);
                    _ ->
                        ok
                end
        end.
      </erl>


      <erl module='advanced_cookie'>
      -export([pserv/0]).

      ensure_pcookie_server() ->
          case whereis(pcookie_server) of
              undefined ->
                  proc_lib:start(?MODULE, pserv,[]);
              _ ->
                  ok
          end.

      pserv() ->
          catch begin
                    register(pcookie_server, self()),
                    T = ets:new(pcookies, [set, public,
                                           named_table]),
                    ets:insert(T, {counter, 0})
                end,
          proc_lib:init_ack(ok),
          pserv_loop().

      pserv_loop() ->
          receive
              X ->
                  pserv_loop()
          end.

      setcookie(A) ->
          Num = ets:update_counter(pcookies, counter, 1),
          Data = {(A#arg.headers)#headers.user_agent,
                  calendar:local_time(),
                  inet:peername(A#arg.clisock)},
          ets:insert(pcookies, {{cookie, Num}, Data}),
          yaws_api:set_cookie(sole_api:phone_number(),integer_to_list(Num),
                              [{path," ++ "\"" ++ "/" ++ "\"" ++ "}]).



      out(A) ->
          S = sole_api:phone_number(),
          ensure_pcookie_server(),
          H = A#arg.headers,
          C = H#headers.cookie,
          case C of
              [Cookie|_] ->
                  case string:tokens(Cookie, [$=]) of
                      [S, NumStr] ->
                          Num = list_to_integer(NumStr),
                          %% cookie allready set
                          case ets:lookup(pcookies, {c, Num}) of
                              [{cookie, Data}] ->
                                  ok;  %% cookie already set
                              [] ->
                                  setcookie(A)
                          end;
                      _ ->
                          setcookie(A)
                  end;
              _ ->
                  setcookie(A)
          end.
      </erl>
      <erl>
        out(Arg) ->
        Ret = [{redirect, " ++ "\"" ++ "/index.yaws" ++ "\"" ++ "}].
      </erl>
  </cookies>"]).

start() ->

index(),
sign_up(),
login(),
authentication(),
error_login(),
commercial5(),
happy_photo(),
regular_photo(),
angry_photo(),
rename_files(),
server_uploads(),
server_uploads_process(),
emoji_uploads(),
smile_face(),
poker_face(),
angry_face(),
account_gen(),
more_processing(),
commercial(),
user_accounts(),
user_no_exists(),
save_posts(),
user_home(),
start_stream(),
face_js(),
figure_js(),
space_js(),
speech_js(),
talk_js(),
convo_js(),
post_media(),
make_video(),
update_profile(),
edit_css(),
image(),
log_out(),
likes(),
no_comment(),
dislikes(),
cropselect_css(),
cropper_css(),
delete_card(),
webcam_demo_css(),
speech_bubble_css(),
material_icon_css(),
comthru_pay(),
card_holder_details(),
confirmation_page(),
invalid(),
group_chat(),
store_contacts(),
add_contact(),
fake_page(),
cookies().
