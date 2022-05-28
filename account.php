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
$ptitle="Conta - $cfg[server_name]";
include ("header.inc.php");
?>
<div id="content">
<div class="top">
    <h1>Bienvenido!</h1>
</div>
<div class="mid">

<h3>Escolha oque Fazer</h3>
    <button class="btn-primary" onclick="ajax('form','modules/character_create.php','',true)">Create a character</button>
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
<?php 
if (isset($account->players)){
	echo '<h3>Characters</h3>'."\n";
	echo '<ul class="task-menu">';
	foreach ($account->players as $player){
		echo '<li style="background-image: url(ico/user.png);" onclick="window.location.href=\'characters.php?player_id='.htmlspecialchars($player['id']).'\'">'.htmlspecialchars($player['name']).'</li>';
	}
	echo '</ul>';
}
?>
</td></tr>
</table>
</div>
<div id="ajax"></div>
<div class="bot">
<?php include ("footer.inc.php");?>
<?php 
}
?>