<?php
	$l = setcookie("Loggedin", $_REQUEST['Loggedin'], time()+3600);
	$t = setcookie("type", $_REQUEST['type'], time()+3600);
	$u = setcookie("username", $_REQUEST['username'], time()+3600);
	$c = setcookie("calendar", $_REQUEST['calendar'], time()+3600);
echo $_REQUEST['Loggedin'] . " - " . $l . ", " . $t . ", " . $u . ", " . $c . "<br>";
echo "Loggedin: " . $_COOKIE['Loggedin'] . "<br>";
echo "type: " . $_COOKIE['type'] . "<br>";
echo "username: " . $_COOKIE['username'] . "<br>";
echo "calendar: " . $_COOKIE['calendar'] . "<br>";
//	header("location:tools/admin.asp");
?>