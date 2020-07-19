<?php
for ($j = 0;$j < 4;$j++){
	$url = "http://www.ntreis.immobel.com/personal/1/searchResults.do";
	$url .= "?glexMarket=&la=EN&per=JessEasley&shcu=&mode=std&rpp=15&c_sort=li_sort_priced&cu=USD";
	$url .= "&minsurface=&maxsurface=&c_surface_mu=1&minlsurface=&maxlsurface=&c_lsurface_mu=1&c_mls=";
	$url .= "&c_location=flower+mound&c_itype=1&minprice=100000&minbedroom=3&minbathroom=2";
	if ($j == 0)
		$url .= "&maxprice=1000000";
	if ($j == 1)
		$url .= "&maxprice=800000";
	if ($j == 2)
		$url .= "&maxprice=600000";
	if ($j == 3)
		$url .= "&maxprice=400000";
	$curl = curl_init($url); 
	curl_setopt($curl, CURLOPT_FAILONERROR, true); 
	curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true); 
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); 
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   
	$result = curl_exec($curl); 
  //$result = "";

  $pos = 0;
	for ($i = 0; $i < 5; $i++) {
		$pos = strpos($result,"var listing = new Object", $pos);
    $listing = substr($result, $pos, strpos($result, "addCoordinates", $pos) - $pos);
		$addr = getField($listing, "fullAddress");
		$sqft = getField($listing, "houseSize") . " " . getField($listing, "houseSizeUnit");
		$lot = getField($listing, "landSize") . " " . getField($listing, "landSizeUnit");
		$price = "Price: $" . getField($listing, "price");
		$bed = getField($listing, "beds") . " bedrooms";
		$bath = getField($listing, "bathsFull") . " baths";
		$half = getField($listing, "bathsHalf") . " half baths";
		$mls = "MLS#: " . getField($listing, "mls");
    $url = "http://www.ntreis.immobel.com/personal/1/listingDetails.do?per=JessEasley&c_mls=" . getField($listing, "mls");
		$img = "http://www.ntreis.immobel.com/img/" . getField($listing, "pict");
    if ((strlen($img) < 100) && (substr($img, strlen($img)-4, 4) == ".jpg") && (strlen($mls) == 14)){
		  $html .= "<table cellspacing=\"2\" cellpadding=\"5\" border=\"0\" style=\"width:440px\">";
        $html .= "<tr align=\"center\">";
          $html .= "<td colspan=\"2\" width=\"440px\">";
            $html .= "<a href=\"" . $url . "\" target=_empty>" . $addr . "</a><hr>";
          $html .= "</td>";
        $html .= "</tr>";
        $html .= "<tr>";
          $html .= "<td>";
            $html .= "<a href=\"" . $url . "\" target=_empty><img src=\"" . $img . "\" width=250></a>";
          $html .= "</td>";
          $html .= "<td class=\"text-centered\">";
            $html .= $bed . "<br>" . $bath . "<br>" . $half . "<br><br>" . $sqft . "<br>" . $lot . "<br><br>" . $mls;
		      $html .= "</td>";
        $html .= "</tr>";
        $html .= "<tr>";
          $html .= "<td colspan=2 align=\"center\" class=\"text\">";
          $html .= "<hr>" . $price;
          $html .= "</td>";
        $html .= "</tr>";
      $html .= "</table>";
    }
    $pos = $pos + 20;
	}
echo $html;
}
echo $html;

function getField($source, $fName){
  //echo $source;
  $res = "";
  $start = strpos($source, $fName);
  if ($start > 1){
    $start = strpos($source, "'", $start) + 1;
    $end = strpos($source, "'", $start);
    $res = substr($source, $start, $end - $start);
    $res = str_replace("\\r\\n", "", $res);
    $res = str_replace("USA", "", $res);
    $res = str_replace("Texas,", "", $res);
    $res = str_replace("<,", "", $res);
    $res = str_replace(">,", "", $res);
    if (strlen($res) > 100)
      $res = "";
  }
  return $res;
}





?>
