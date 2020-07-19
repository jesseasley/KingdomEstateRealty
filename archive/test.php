<?php

	if (isset($_REQUEST['submit']))
	{
		$f = setcookie("cval", $_POST['cval'], time()+3600);
		echo "cookie value '" . $_COOKIE["cval"] . "'<br><br>";
		echo "<form method=post>";
		echo "<input type=text name=cval>";
		echo "<input type=submit name=submit value=Submit>";
		echo "<br><br>went into form code: '" . $f . "' - '" . $_POST['cval'] . "'";
		echo "<br><br><a href=\"test.php\">re-run form</a>";
		echo "</form>";
	}
	else
	{
		echo "cookie value '" . $_COOKIE["cval"] . "'<br><br>";
		echo "<form method=post>";
		echo "<input type=text name=cval>";
		echo "<input type=submit name=submit value=Submit>";
		echo "<br><br>went into form code: '" . $f . "' - '" . $_POST['cval'] . "'";
		echo "<br><br><a href=\"test.php\">re-run form</a>";
		echo "</form>";
	}
?>


