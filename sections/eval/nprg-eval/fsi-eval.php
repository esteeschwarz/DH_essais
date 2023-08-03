<?php
$txt = "";
$ref = "self";
$arg = "";
$arg = $_REQUEST["arg"];//$rout = array();
$txt = $_REQUEST["v"];
$ref = $_REQUEST["ref"];
$myfile = fopen("../../pings/pingdata.csv", "a") or die("FUCT! I forgot to tie my shoes!");
$force="\n";
$date=date("Ymd(H:i:s)");
$write="$date,$txt,$ref\n";
fwrite($myfile, $write);
//fwrite($myfile, $force);
//sleep(1);
#echo($write);
fclose($myfile);

//exec("R < shellessai.R -s -q",$rout);
//echo("knitting....$id");
set_time_limit(200); //to infinity
//exec('R -e knitr::knit("knite.Rmd",output="knitob.html")');

#exec('R < knitex.R '.' > /dev/null &');
#exec('R < testwrite.R -s -q'.' > /dev/null &');
//--vanilla 2>&1

$knit = 'fsi-knit.R';
//$call = 'R < fsi-knit.R --vanilla 2>&1'.' >/dev/null&'; //wks.

/////$call = 'R < '.$knit.' --vanilla 2>&1'.' >/dev/null&';
$call = 'Rscript '.$knit.' '.$ref.' '.$txt.' '.$arg.' --vanilla 2>&1'.' > /dev/null &';

// $uber=$txt;
if ($txt!=""){
  $call = 'Rscript '.$knit.' '.$ref.' '.$txt.' '.$arg.' --vanilla 2>&1'.' > /dev/null &';
}
//$call = 'Rscript '.$knit.' '.$txt.' '.$arg.' '.$ref.' --vanilla 2>&1'.' > /dev/null &';

// $call = 'Rscript fsi-knit.R '.$arg.' --vanilla 2>&1'.' > /dev/null &';
//exec('R < k002.R --vanilla 2>&1'.' > /dev/null &',$rout);

//exec($call . '> /dev/null &',$rout);
//echo("calculating...");

//MAIN////////////
//echo($call);
exec($call,$rout);
//////////////////

//exec('R')
#2>&1

#$rout=ini_get('max_execution_time'); 
//print_r($rout[0]);
//print_r($rout[1]);
#var_dump($rout);
#echo($call);
#var_dump($rout);
$src="fsi_eval/fsi-eval".$txt.".html";
//$src="fsi-eval.html";
$file=fopen($src,"r");
$srcbyte=filesize($src);
$stat=stat($src);
//echo readfile($src); 

echo fread($file,$srcbyte);



//echo($status);
/*echo ("compiling...");
if (array_key_exists(2,$rout))
  {
    echo('finished...');
    print_r($rout[2]);
  }
  */
/*else
  {
  echo "Key does not exist!";
  }
*/
//$rout="dreimalschwarz";
//echo($rout);
#print_r($rout[0]);
//echo ("space");
//print_r(array_map(null,$rout));
#print_r($rout[1]);
//echo('finished...');
?>