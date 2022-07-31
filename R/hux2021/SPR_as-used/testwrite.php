<?php
$txt = $_POST["data"]; //request-  mit q funktioniert, duck wird geschrieben
$myfile = fopen("sprdata.csv", "a+") or die("Unable to open file!");

fwrite($myfile, $txt);
//sleep(1);

fclose($myfile);


?>