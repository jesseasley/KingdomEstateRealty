<?php
include "../../includes/functions.php";
if ((valueOf("post", "userName") == "Kingdom") && (valueOf("post", "password") == "Chris")){
  echo "success";
  $l = setcookie("userName", valueOF("post", "userName"), time()+60*60*24*30*12*5);
  $a = setcookie("password", valueOF("post", "password"), time()+60*60*24*30*12*5);
}
else{
  echo "Incorrect username or password";
  //echo "<br>Username entered: " . valueOf("post", "userName") . "<br>Password entered: " . valueOf("post", "password");
}
?>