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

########################## LOGIN ############################
if (isset($_POST['login_submit'])){
	$account = new Account();
	if ($account->load($_POST['account'])){
		if ($account->checkPassword($_POST['password']) || !$cfg['secure_session'] && (string)$_POST['password'] == sha1($account->getAttr('password').$_SERVER['HTTP_HOST'])){
			$_SESSION['account']=$account->getAttr('accno');
			$_SESSION['remote_ip']=$_SERVER['REMOTE_ADDR'];
			if (!empty($_COOKIE['remember'])){
				setcookie('account',$account->getAttr('accno'),time() + (30*24*3600),'/');
				setcookie('password',sha1($account->getAttr('password').$_SERVER['HTTP_HOST']),time() + (30*24*3600),'/');
			}
			if (!empty($_GET['redirect'])) {
				header('location: '.$_GET['redirect']);
				die('Redirecting to <a href="'.$_GET['redirect'].'>'.$_GET['redirect'].'</a>');
			}
		}else{$error = 'Account and password don\'t match.';}
	}else{$error = 'Account and password don\'t match. ';}
}

########################## LOGOUT ###########################
elseif (isset($_GET['logout'])){
	$_SESSION['account'] = false;
}
elseif (!empty($_SESSION['account']) && !empty($_GET['redirect'])){
	header('location: '.$_GET['redirect']);
	die('Redirecting to <a href="'.$_GET['redirect'].'>'.$_GET['redirect'].'</a>');
}
########################## LOGIN FORM #######################
$ptitle="Account - $cfg[server_name]";
include ("header.inc.php");
?>
<script language="javascript" type="text/javascript">
//<![CDATA[
	function remember_toggle(node)
	{
		if (node.checked){
			Cookies.create('remember','yes',30);
		}else{
			Cookies.erase('account');
			Cookies.erase('password');
			Cookies.erase('remember');
			document.getElementById('account').value = '';
			document.getElementById('password').value = '';
		}
	}

	
//]]>
</script>
<div id="content">
<div class="mid wrapper-account">
		<!-- Login part -->

		<div class="wrapper-login">
		<h1>Account Login</h1>
		<form id="login" action="login.php?redirect=<?php echo htmlspecialchars($_GET['redirect'])?>" method="post">
				<div class="wrapper-form">
					<label>Account Id</label>
					<input id="account" name="account" type="password" class="textfield" maxlength="8" size="10" tabindex="101" value="<?php echo htmlspecialchars($account);?>"/>
				</div>
				<div class="wrapper-form">
					<label>Password</label>
					<input id="password" name="password" type="password" class="textfield" maxlength="100" size="10" tabindex="102" value="<?php echo htmlspecialchars($password);?>"/>
				</div>
				<div class="wrapper-actions">
					<div class="wrapper-remember">
						<?php if ($cfg['secure_session']) echo ' style="visibility: hidden"';?>&nbsp;<input id="remember" name="remember" type="checkbox" tabindex="103" onclick="remember_toggle(this)"<?php if (!empty($_COOKIE['remember'])) echo ' checked="checked"';?>/>&nbsp;<label for="remember">Remember Me?</label>
					</div>
					<input class="btn-primary" type="submit" name="login_submit" value="Sign in" tabindex="104"/>
					<div class="divider"></div>
					<?php if($cfg['Email_Recovery']){?>
						<button class="btn-primary" onclick="ajax('form','modules/account_recover.php','',true)" >Forgot your password?</button>
					<?php }?>
				</div>
				<?php
						if (isset($_POST['login_submit'])) {
							$account = $_POST['account'];
							$password = $_POST['password'];
						}elseif (!empty($_COOKIE['remember'])){
							$account = $_COOKIE['account'];
							$password = $_COOKIE['password'];
						}
						?>
			</form>
		</div>
		<div id="wrapper-register" class="wrapper-login">
			<!-- <h1>Want a new account?</h1>
			<button class="btn-primary" onclick="javascript:ajax('wrapper-register','/modules/account_create.php', '' ,true)">Create a new account</button> -->
			
			<h1>Create Account</h1>
			<form id="newaccount" action="javascript:ajax('wrapper-register','/modules/account_create.php',getParamsByName('createacc'),true)" method="post">
				<div class="wrapper-form">
					<label>Name</label>			
					<input class="textfield" id="newaccount__name" name="createacc" type="text" maxlength="100" value="">
				</div>	
			<div class="wrapper-form">
				<label>Email</label>			
				<input class="textfield" id="newaccount__email" name="createacc" type="text" maxlength="100" value="">
			</div>	
			<div class="wrapper-form">
				<label>Password</label>
				<input class="textfield" id="newaccount__password" name="createacc" type="password" maxlength="100" value="">
			</div>	
			<div class="wrapper-form">
				<label>Confirm your Password</label>
				<input class="textfield" id="newaccount__confirm" name="createacc" type="password" maxlength="100" value="">
			</div>
			<div class="wrapper-actions">
				<input class="btn-primary"  type="submit" name="register_submit" value="Next >>"> 
			</div>
			</form>

			<!-- FETCJH?? -->
			<!-- <h1>Create Account</h1>
			<form id="createacc">
			<div class="wrapper-form">
				<label>Email</label>			
				<input class="textfield" id="newaccount__email" name="create_acc" type="text" maxlength="100" value="">
			</div>	
			<div class="wrapper-form">
				<label>Password</label>
				<input class="textfield" id="newaccount__password" name="create_acc" type="password" maxlength="100" value="">
			</div>	
			<div class="wrapper-form">
				<label>Confirm your Password</label>
				<input class="textfield" id="newaccount__confirm" name="create_acc" type="password" maxlength="100" value="">
			</div>
			<div class="wrapper-actions">
				<input class="btn-primary" type="button"  name="register_submit" onclick="javascript:postForm('/modules/account.php?', 'create_acc')"  value="Next >>"> 
			</div>
			</form> -->
		</div>
			<!-- <fieldset>
				<legend>More Options</legend>
					<ul class="task-menu" style="width: 200px;">
						<li onclick="ajax('form','modules/account_create.php','',true)" >New Account</li>
						<?php if($cfg['Email_Recovery']){?><li onclick="ajax('form','modules/account_recover.php','',true)" >Recover Account</li><?php }?>
					</ul>
				</fieldset> -->
			</div>
		<div class="bot">
<?php include ("footer.inc.php");?>
