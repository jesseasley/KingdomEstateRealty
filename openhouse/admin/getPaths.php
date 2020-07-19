<?php
    $dir = scandir("../data");
    $paths = "";
    $paths = "[";
    for ($x = 1; $x < count($dir);$x++){
      if ($dir[$x] > ""){
        if ($dir[$x] != "."){
          if ($dir[$x] != ".."){
            if (strpos($dir[$x], ".json") == 0){
              $paths .= "{'path': '" . $dir[$x] . "', 'exists': 'false', 'active': 'false', 'name': ''},";
            }
          }
        }
      }
    }
    $paths .= "]";
    $paths = str_replace(",]", "]", $paths);

    echo $paths;
?>