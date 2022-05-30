<?php 
include ("include.inc.php");
$ptitle="Downloads - $cfg[server_name]";
include ("header.inc.php");
include ("extensions/download_zip.php");
?>

<style>
    button,
button::after {
 margin-right: auto;
 margin-left: auto;
 display: block;
 margin-top: 30px;
 cursor: pointer;
 padding: 16px 60px;
 font-size: 28px;
 background: linear-gradient(45deg, transparent 5%, #000000 5%);
 border: 0;
 color: #fff;
 letter-spacing: 3px;
 line-height: 1;
 box-shadow: 6px 0px 0px #00e6f6;
 outline: transparent;
 position: relative;
}

button::after {
 --slice-0: inset(50% 50% 50% 50%);
 --slice-1: inset(80% 6px 0 0);
 --slice-2: inset(50% 6px 30% 0);
 --slice-3: inset(10% 6px 85% 0);
 --slice-4: inset(40% 6px 43% 0);
 --slice-5: inset(80% 6px 5% 0);
 content: "DRAGON BALL Z";
 display: block;
 position: absolute;
 top: 0;
 left: 0;
 right: 0;
 bottom: 0;
 background: linear-gradient(45deg, transparent 3%, #00FFFF 3%, #00FFFF 5%, #00FFFF 5%);
 text-shadow: 3px 3px 0px #f8f005, 23px 23px 0px #00e6f6;
 clip-path: var(--slice-0);
}

button:hover::after {
animation: 1s glitch;
animation-timing-function: steps(2, end);
}
.none{
   background: transparent;
   color: transparent;
   background-color: transparent;
}

@keyframes glitch {
 0% {
  clip-path: var(--slice-1);
  transform: translate(40px, -10px);
 }

 10% {
  clip-path: var(--slice-3);
  transform: translate(20px, 10px);
 }

 20% {
  clip-path: var(--slice-1);
  transform: translate(20px, 10px);
 }

 30% {
  clip-path: var(--slice-3);
  transform: translate(0px, 5px);
 }

 40% {
  clip-path: var(--slice-2);
  transform: translate(25px, 0px);
 }

 50% {
  clip-path: var(--slice-3);
  transform: translate(25px, 0px);
 }

 60% {
  clip-path: var(--slice-4);
  transform: translate(25px, 10px);
 }

 70% {
  clip-path: var(--slice-2);
  transform: translate(20px, 10px);
 }

 80% {
  clip-path: var(--slice-5);
  transform: translate(40px, -10px);
 }

 90% {
  clip-path: var(--slice-1);
  transform: translate(20px, 0px);
 }

 100% {
  clip-path: var(--slice-1);
  transform: translate(0);
 }
}
.fade {
  animation: fadeIn 3s;
  -webkit-animation: fadeIn 3s;
  -moz-animation: fadeIn 3s;
  -o-animation: fadeIn 3s;
  -ms-animation: fadeIn 3s;
}
@keyframes fadeIn {
  0% {opacity:0;}
  100% {opacity:1;}
}

@-moz-keyframes fadeIn {
  0% {opacity:0;}
  100% {opacity:1;}
}

@-webkit-keyframes fadeIn {
  0% {opacity:0;}
  100% {opacity:1;}
}

@-o-keyframes fadeIn {
  0% {opacity:0;}
  100% {opacity:1;}
}

@-ms-keyframes fadeIn {
  0% {opacity:0;}
  100% {opacity:1;}
}
.slide{
    animation: slide 2s;
}
@keyframes slide{
    0%{margin-left: 200px;}
    100%{margin-left: 20px;}
}
.colors{
color: #ff0000;
animation: colors 2s infinite;
}
@keyframes colors{
    0%{color: rgb(255, 0, 0);}
    100%{color: #FFA500;}
}


</style>

<div id="content" style="width: 100%;">
    <img class="top fade" src="./img/2bfaf53cf6ceac24efcb61844f62c267.png" style="width:300px; margin-left: auto; margin-right: auto; display: block;"></img>
<div class="mid">
   <div style="display:grid;">
     <div class="fade" style="display:flex;">
         <button type="submit" onclick="window.open('dbko_client.zip')">
             <div style="display:flex">
                 <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/bfcca197-3578-4aac-affa-0f78c0bac51c/detjt52-fd0e1703-e28e-4cc4-9125-902e94d670a5.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2JmY2NhMTk3LTM1NzgtNGFhYy1hZmZhLTBmNzhjMGJhYzUxY1wvZGV0anQ1Mi1mZDBlMTcwMy1lMjhlLTRjYzQtOTEyNS05MDJlOTRkNjcwYTUuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lWj3fT_-PSKiKkz8Y_W9esdIDtVs_EaHGUf0mHGnWA0" style="max-width: 70px;  display: block; margin-right: 0; border-radius: 10px;;"></img>
                 <span class="slide" style="margin-top:5%; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">DOWNLOAD</span>
                 <span class="colors" style="margin-top:5%; margin-left: 20px;  font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;">DBKO CLIENT</span>
             </div>
         </button>
     </div>
     <div class="fade" style="display:flex;">
         <button type="submit" onclick="window.open('ipchanger.exe')">
             <div style="display:flex">
                 <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/bfcca197-3578-4aac-affa-0f78c0bac51c/detjt52-fd0e1703-e28e-4cc4-9125-902e94d670a5.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2JmY2NhMTk3LTM1NzgtNGFhYy1hZmZhLTBmNzhjMGJhYzUxY1wvZGV0anQ1Mi1mZDBlMTcwMy1lMjhlLTRjYzQtOTEyNS05MDJlOTRkNjcwYTUuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lWj3fT_-PSKiKkz8Y_W9esdIDtVs_EaHGUf0mHGnWA0" style="max-width: 70px;  display: block; margin-right: 0; border-radius: 10px;;"></img>
                 <span class="slide" style="margin-top:5%; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">DOWNLOAD</span>
                 <span class="colors" style="margin-top:5%; margin-left: 20px;  font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;">IP CHANGER</span>
             </div>
         </button>
     </div>
   </div>
</div>

