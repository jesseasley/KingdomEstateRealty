<?php
include "../includes/functions.php";

  $path = "staging/pages";

  //define the path as relative
  //using the opendir function
  $dir_handle = @opendir($path) or die("Unable to open $path");

  //running the while loop
  echo "<table cellpadding='0' cellspacing='0' border='0' width='100%'>";
  $cnt = 1;
  while ($file = readdir($dir_handle)) 
  {
    if (($file != ".") && ($file != "..") && (substr($file,0,1) != " ") && (strpos($file, ".") > 1) && ($file != "cookie.php")){
  //    if ($cnt == 1)
        echo "<tr>";
      echo "<td><a href=\"#\" onclick=\"pageChange('" . $file . "')\">" . $file . "</a></td>";
      $cnt += 1;
  //    if ($cnt == 6){
  //      $cnt = 1;
        echo "</tr>";
  //    }
    }
  }
  echo "</table><br>";
  //closing the directory
  closedir($dir_handle);

?>
