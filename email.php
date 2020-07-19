<?php
include "includes/functions.php";

if (valueOf("post", "name") > ""){
    if (valueOf("post", "phone") > ""){
        if (valueOf("post", "email") > ""){
            $body = "Sent by: " . valueOf("post", "name") . "<br><br>";
	        $body .= "Phone: " . valueOf("post", "phone") . "<br><br>";
	        $body .= "Email: " . valueOf("post", "email") . "<br><br>";
	        $body .= "Their message: ". valueOf("post", "body");
	        SendSingleEmail(valueOf("post", "subject"), $body);
	        $body = "Thank you for contacting us.";
	        $body .= "&nbsp;&nbsp;Someone will get back to you shortly.<br /><br />";
            echo $body;
        }
        else{
            echo "Email missing";
        }
    }
    else{
        echo "Phone missing";
    }
}
else{
    echo "Name missing";
}

?>