<?php
include "../includes/functions.php";
if ($_POST["action"] == "read"){
    $file = str_replace("..", "", $_POST["filename"]);
    $file = str_replace("/", "", $file);
    $file = str_replace("\\", "", $file);
    echo file_get_contents("staging/pages/" . $file);
}
if ($_POST["action"] == "write"){
    //$html = file_get_contents($_POST["filename"]);
    //file_put_contents($_POST["filename"], $html);
    $file = str_replace("..", "", $_POST["filename"]);
    $file = str_replace("/", "", $file);
    $file = str_replace("\\", "", $file);
    file_put_contents("staging/pages/" . $file, $_POST["content"]);
    echo "";
    $post = "The \"" . "staging/pages/" . $file;
    $post .= "\" page has been updated.  Please review the change on the <a href='http://waterfordparkestates.com/admin/staging'>staging server</a>.<br><br>";
    $post .= "This page was updated by:<br>";
    $post .= "<table border='1'><tr><td><b>Name:       </td><td>" . valueOF("post", "nameText") . "</td></tr>";
    $post .= "<tr><td><b>Street address:  </td><td>" . valueOF("post", "addressText") . "</td></tr>";
    $post .= "<tr><td><b>Email:           </td><td>" . valueOF("post", "emailText") . "</td></tr>";
    $post .= "<tr><td><b>Home phone:      </td><td>" . valueOF("post", "homePhoneText") . "</td></tr>";
    $post .= "<tr><td><b>Work phone:      </td><td>" . valueOF("post", "workPhoneText") . "</td></tr>";
    $post .= "<tr><td><b>Cell phone:      </td><td>" . valueOF("post", "cellPhoneText") . "</td></tr>";
    $post .= "<tr><td><b>Preferred phone: </td><td>" . valueOF("post", "preferredphoneSelect") . "</td></tr></table>";
    PageUpdateEmail("Website Update", $post);
    $email = valueOF("post", "nameText") . "<" . valueOF("post", "emailText") . ">";
    $post = "Your changes to the \"" . "staging/pages/" . $file . "\" file have been submitted for review.<br>Either your changes will appear on the site";
    $post .= " soon or someone will contact you to discuss the change.<br><br>Thank you for your submission.<br><br>Waterford Park Estates HOA";
    PageUpdateCustomerEmail($email, "Proposed Changes", $post);
}
?>