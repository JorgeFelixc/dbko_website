<?php
include ("../include.inc.php");

//retrieve post data
$form = new Form('character');
//check if any data was submited
if ($form->exists()){
	//load account if loged in
	$account = new Account();
	($account->load($_SESSION['account'])) or die('You need to login first. '.$account->getError());
	//create new player object
	$form->attrs['name'] = ucfirst($form->attrs['name']);
	$newplayer = new Player();
	//check for correct parameters
	if ($cfg['temple'][$form->attrs['residence']]['enabled'] && $cfg['vocations'][(int)$form->attrs['vocation']]['enabled'] && preg_match("/^[01]$/",$form->attrs['sex'])){
	
		//check character number
		if (count($account->players) < $cfg['maxchars']){
			//check for valid name
			$accValidator = new AAC();
			if ($accValidator->ValidPlayerName($form->attrs['name'])){
				$newplayer->setAttr('name',(string)$form->attrs['name']);
				//player name must not exist
				if (!$newplayer->exists()){
					//set attributes for new player
					$newplayer->setAttr('vocation',(int)$form->attrs['vocation']);
					$newplayer->setAttr('account',(int)$_SESSION['account']);
					$newplayer->setAttr('sex',(int)$form->attrs['sex']);
					$newplayer->setAttr('city',(int)$form->attrs['residence']);
					//create character and add it to account
					if ($newplayer->create()){
						$account->logAction('Created character: '.$form->attrs['name']);
						//create new message
						$msg = new IOBox('message');
						$msg->addMsg('Your character was successfuly created.');
						$msg->addRefresh('Finish');
						$msg->show();
					}else{$error = 'Error. '.$newplayer->getError();}
				}else{$error = "This name is already taken.";}
			}else{$error = "<b>Not a valid name:</b><br/><ul><li>First letter capital</li><li>At least 4 characters, at most 25</li><li>No capital letters in midlle of word</li><li>Letters A-Z, -' and spaces</li><li>Monster names not allowed</li></ul>";}
		}else{$error = "You can't have more than $cfg[maxchars] characters on your account";}
	}else{$error = "Invalid parameters.";}
	if (!empty($error)){
		//create new message
		$msg = new IOBox('message');
		$msg->addMsg($error);
		$msg->addReload('<< Back');
		$msg->addClose('OK');
		$msg->show();
	}
}else{
	//make a list of valid vocations
	while ($vocation = current($cfg['vocations'])) {
		if (isset($vocation['enabled']) && $vocation['enabled'])
			$vocations[key($cfg['vocations'])] = $vocation['name'];
		next($cfg['vocations']);
	}
	//make a list of valid spawn places
	while ($spawn = current($cfg['temple'])) {
		if (isset($spawn['enabled']) && $spawn['enabled']){
			$spawns[key($cfg['temple'])] = $spawn['name'];
		}
	    next($cfg['temple']);
	}
	//create new form
	$form = new IOBox('character');
	$form->target = $_SERVER['PHP_SELF'];
	$form->addLabel('Create Character');
	$form->addInput('name');
	$form->addSelect('sex',array(1 => 'Male', 0 => 'Female'));
	$form->addSelect('vocation',$vocations);
	$form->addSelect('residence',$spawns);
	$form->addClose('Cancel');
	$form->addSubmit('Next >>');
	$form->show();
}
?>