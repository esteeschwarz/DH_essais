<?php

$myfile = fopen("data1005es01.csv", "a+") or die("Unable to open file!");
$txt = $_POST["data"]; //request-  mit q funktioniert, duck wird geschrieben
fwrite($myfile, $txt);
//sleep(1);

fclose($myfile);


?>