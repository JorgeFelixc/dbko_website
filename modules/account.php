<?php 
// Submit register.
if (isset($_POST['register_submit'])){
  $account = new Account();
  echo $_POST["newaccount__email"];
  echo $_POST["newaccount__password"];
  // echo $_POST;
}

echo "em tring";

echo $_POST["newaccount__email"];
echo $_POST["newaccount__password"];

?>