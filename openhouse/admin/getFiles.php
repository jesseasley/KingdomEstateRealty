<?php
$log_directory = "../data/" . $_GET["path"];

$results_array = array();

if (is_dir($log_directory))
{
        if ($handle = opendir($log_directory))
        {
                //Notice the parentheses I added:
                while(($file = readdir($handle)) !== FALSE)
                {
                        $results_array[] = $file;
                }
                closedir($handle);
        }
}
//echo count($results_array) . " files found";
//Output findings
echo "{\"files\":[";
$str = "";
for ($i = 0; $i < count($results_array);$i++){
    if ($results_array[$i] != "."){
      if ($results_array[$i] != ".."){
        if ($results_array[$i] != "registrations.json"){
          if (strlen($str)>0){
            $str .= ",";
          }
          $str .= "\"" . $results_array[$i] . "\"";
        }
      }
    }
}
echo $str . "]}";

?>