<?php 
/*
    Copyright (C) 2007 - 2008  Nicaw

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
include ("include.inc.php");

$account = new Account();
if (!$account->load($_SESSION['account'])){
	$_SESSION['account'] = '';
	header('location: login.php?redirect=account.php');
	die();
}else{
$ptitle="$cfg[server_name]";
include ("header.inc.php");
?>
<div id="content">
    <div class="top">
        <h1>Welcome to your Account</h1>
    </div>
    <div class="mid wrapper-section">

        <h3>Select your action</h3>
        <div class="column py-child">
            <button class="btn-secondary" onclick="ajax('acc-creation','modules/character_create.php','',true)">Create a character</button>
            <button class="btn-secondary" onclick="ajax('acc-creation','modules/character_delete.php','',true)">Delete a character</button>
            <button class="btn-secondary" onclick="ajax('acc-creation','modules/account_password.php','',true)">Change Password</button>
            <div class="divider top-auto"></div>
            <button class="btn-secondary" onclick="window.location.href='login.php?logout&amp;redirect=account.php'">Logout</button>

        </div>
        <!-- <ul class="task-menu" style="width: 200px;">
            <li onclick="ajax('form','modules/character_create.php','',true)" >Criar Personagens</li>
            <li onclick="ajax('form','modules/character_delete.php','',true)" >Deletar Personagens</li>
            <?php if ($cfg['char_repair']){?>
            <li onclick="ajax('form','modules/character_repair.php','',true)" >Reparar Personagens</li>
            <?php }?>
            <li onclick="ajax('form','modules/account_password.php','',true)" >Mudar Senha</li>
            <li onclick="ajax('form','modules/account_comments.php','',true)" >Editar Comentarios</li>
            <li onclick="ajax('form','modules/guild_create.php','',true)" >Criar Guild</li>
            <li onclick="window.location.href='login.php?logout&amp;redirect=account.php'">Sair da Conta</li>
        </ul> -->

    </div>

</div>
<!-- Character creation form. -->
<div class="wrapper-common" id="acc-creation">
  <form id="character"
    action="javascript:ajax('wrapper-register','/modules/character_create.php',getParamsByName('createchar'),true)"
    method="post">
    <h1>Create Character</h1>
    <div class="wrapper-form">
      <label for="character__name">Name</label>
      <input class="textfield" id="character__name" name="createchar" type="text" maxlength="100" value="">
    </div>
    <div class="wrapper-form">
        <label>Sex</label>        
        <select id="character__sex" name="createchar">
          <option value="1">Male</option>
          <option value="0">Female</option>
        </select>
    </div>
    <div class="wrapper-form">
        <label for="character__vocation">- Vocation</label>
        <select id="character__vocation" name="createchar">
          <option value="1">Goku</option>
          <option value="6">Gohan</option>
          <option value="76">Goten</option>
          <option value="2">Vegeta</option>
          <option value="7">Trunks</option>
          <option value="78">Chibi Trunks</option>
          <option value="12">Brolly</option>
          <option value="3">NamekJin</option>
          <option value="5">Android</option>
          <option value="13">Android</option>
          <option value="9">Freeza</option>
          <option value="8">Cell</option>
          <option value="10">Buu</option>
          <option value="11">Tsuful</option>
          <option value="91">Cooler</option>
          <option value="100">Bardock</option>
          <option value="105">Uub</option>
          <option value="109">Dende</option>
        </select>
    </div>
    <div class="wrapper-form">
        <label for="character__residence">Residence</label>
        <select id="character__residence" name="createchar">
          <option value="1">Small city</option>
        </select>
    </div>
    <div class="divider"></div>
    <!-- <input style="width: 100px; height: 25px;"
      onclick="document.getElementById('iobox').style['visibility'] = 'hidden'" type="button" value="Cancel"> -->
    <div class="wrapper-actions">
      <button class="btn-secondary" type="submit" name="character__character">Next</button>
    </div>
  </form>
</div>


<div class="wrapper-common left-auto">
<?php 
        if (isset($account->players)){
            echo '<h1>Characters</h1>'."\n";
            echo '<div class="wrapper-character">';
            foreach ($account->players as $player){
                $nameVoc = $cfg['vocations'][$player['vocation']]['name'];
                echo '
                <div class="row box-character" onclick="window.location.href=\'characters.php?player_id='.htmlspecialchars($player['id']).'\'">
                <img src="Fotos/vocs/'.$nameVoc.'.gif"/>
                <div class="column">
                  <p>'.htmlspecialchars($player['name']).'</p>
                  <p class="sub-text">'.$nameVoc.'</p>
                </div>
                </div>';
            }
            echo '</div>';
        }
        ?>

</div>
<div id="ajax"></div>
<div class="bot">
    <?php include ("footer.inc.php");?>
    <?php 
}
?>