<?php 
	$account = new Account();
	$account->setAttr('accno', $_SESSION['account']);
	if (!in_array($_SESSION['account'],$cfg['admin_accounts']) || !$account->exists()){
		$_SESSION['account'] = '';
		header('location: login.php?redirect=admin.php');
		die();

}
?>