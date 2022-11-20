function import_zt(block_id,api){
var xhttp = new XMLHttpRequest();
  xhttp.open("GET", api, false);
  xhttp.send();
  document.getElementById(block_id).innerHTML = xhttp.responseText;
}