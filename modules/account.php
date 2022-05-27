<?php 
// Submit register.
if (isset($_POST['register_submit'])){
  $account = new Account();
  echo $_POST["newaccount__email"];
  echo $_POST["newaccount__password"];
  // echo $_POST;
}

echo "em tring";
foreach ($_POST as $param_name => $param_val) {
  echo "Param: $param_name; Value: $param_val<br />\n";
}
// echo $_POST["newaccount__email"];
// echo $_POST["newaccount__password"];

?>