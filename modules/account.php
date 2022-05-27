<?php 
// echo json_encode(($_POST));
// Submit register.
if (isset($_POST)){
  // $account = new Account();

  $obj->name = $_POST;
  header('Content-Type: application/json; charset=utf-8');
  // foreach ($_POST as $param_name => $param_val) {
  //   echo "Param: $param_name; Value: $param_val<br />\n";
  // }
  echo json_encode($obj);
}
?>