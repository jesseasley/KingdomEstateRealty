<?php
    file_put_contents("data/" . $_POST["fileType"] . ".json", $_POST["json"]);
    echo "success";
?>