<?php 
// Submit register.
if (isset($_POST['register_submit'])){
  $account = new Account();
  foreach ($_POST as $param_name => $param_val) {
    echo "Param: $param_name; Value: $param_val<br />\n";
  }
}


?>