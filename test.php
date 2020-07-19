<?php
//inspection optional parameters

//1 = residential sale, 2 = residential lease, 4 = commercial sale, 5 = commercial lease, 6 = land
$type = $_REQUEST["type"];
if ($type == "")
  $type = "1";
  
$featured = $_REQUEST["featured"];
$mls = $_REQUEST["mls"];
$city = $_REQUEST["city"];
if ($city == "")
  $city = "flower+mound";
$minimum_bedrooms = $_REQUEST["minbeds"];
if ($minimum_bedrooms == "")
  $minimum_bedrooms = "3";
$minimum_bathrooms = $_REQUEST["minbaths"];
if ($minimum_bathrooms == "")
  $minimum_bathrooms = "1";
$minimum_price = $_REQUEST["minprice"];
if ($minimum_price == "")
  $minimum_price = "100000";
$maximum_price = $_REQUEST["maxprice"];
$active = "";

$k = 4;
$l = 5;
$m = 1;
if (($maximum_price > "") || ($featured > "") || ($mls > "")){
    $k = 1;
    $l = 10;
}
$html ="<div id='" . str_replace(" ", "", $city . $type) . "Carousel' class='carousel slide carousel-fade col-lg-12 col-md-12 col-sm-12 col-xs-12' data-ride='carousel' data-interval='5000'>";
$html .= "<div class='carousel-inner' role='listbox'>";
for ($j = 0;$j < $k;$j++){
    //build URL to call
    if ($featured > ""){
        $url = "http://www.immobel.com/kingdomestaterealty/searchResults.do?featured=" . $featured;
        if ($_REQUEST["type"] > "")
            $url .= "&c_itype=" . $type;
    }
    else{
        if ($mls > ""){
            $url = "http://www.immobel.com/kingdomestaterealty/searchResults.do";
	        $url .= "?c_mls=" . $mls;
        }
        else{
            $url = "http://www.immobel.com/kingdomestaterealty/searchResults.do?";
            if ($type > "1"){
                $url .= "c_itype=" . $type . "&minprice=" . $minimum_price;
            }
            else{
	            $url .= "glexMarket=&la=EN&per=kingdomestaterealty&shcu=&mode=std&rpp=15&c_sort=li_sort_priced&cu=USD";
	            $url .= "&minsurface=&maxsurface=&c_surface_mu=1&minlsurface=&maxlsurface=&c_lsurface_mu=1&c_mls=";
	            $url .= "&c_location=" . $city . "&";
                $url .= "&minbedroom=" . $minimum_bedrooms . "&minbathroom=" . $minimum_bathrooms . "";
            }

            //search four different price categories
            if ($j == 0)
              if ($maximum_price > "")
		            $url .= "&maxprice=" . $maximum_price;
              else
		            $url .= "&maxprice=550000";
	          if ($j == 1)
		          $url .= "&maxprice=450000";
	          if ($j == 2)
		          $url .= "&maxprice=400000";
	          if ($j == 3)
		          $url .= "&maxprice=350000";
        }
    }

//echo $url . "<br>";

    //initialize the connection
    $curl = curl_init($url); 
    curl_setopt($curl, CURLOPT_FAILONERROR, true); 
	curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true); 
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); 
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   

    //get the results of the api call
    $result = curl_exec($curl); 

    $pos = 0;
    //get the first five listings in the price category
    //if a max price is included, we won't go through four price ranges.  this reduces our result set count, so bump the return up to 10
    for ($i = 0; $i < $l; $i++) {
        if (strlen($result) > 20){
            $pos = strpos($result,"listing_content_box_wrapper", $pos);

            if (strpos($result, "listing_box_wrapper ", $pos)){
                $listing_end = strpos($result, "listing_box_wrapper ", $pos);
            }
            else{
                $listing_end = strpos($result, "search_result_after", $pos);
                if ($i == 0)
                    $active = "active";
                $i = $l;
            }
            $listing = substr($result, $pos, $listing_end - $pos);
        }
        else{
            $listing = "";
        }
	    if (strlen($listing) > 0){
            //get the address
            $addr = getField($listing, "address");
		    $start = strpos($listing, "House size: ") + 12;
            $end = strpos($listing, "<", $start);
      
            //get the square feet
            $sqft = substr($listing, $start, $end - $start);
            if (strpos($sqft, "box_wrapper") > 1)
                $sqft = "";
		    $start = strpos($listing, "Lot size: ") + 10;
            $end = strpos($listing, "<", $start);
      
            //get the lot size
            $lot = substr($listing, $start, $end - $start);
            if (strpos($lot, "box_wrapper") > 1)
                $lot = "";
		    $start = strpos($listing, "Price:") + 8;
            $end = strpos($listing, "<", $start);
      
            //get the price
            $price = substr($listing, $start, $end - $start);
            if (strpos($price, "box_wrapper") > 1)
                $price = "";
		    $start = strpos($listing, "Bedrooms:") + 10;
            $end = strpos($listing, "<", $start);
      
            //get the number of bedrooms
            $bed = "Bedrooms: " . substr($listing, $start, $end - $start);
            if (strpos($bed, "box_wrapper") > 1)
                $bed = "";
		    $start = strpos($listing, "Bathrooms:") + 11;
            $end = strpos($listing, "<", $start);
      
            //get the number of bathrooms
            $bath = "Bathrooms: " . substr($listing, $start, $end - $start);
            if (strpos($bath, "box_wrapper") > 1)
                $bath = "";
		    $start = strpos($listing, "Half baths:") + 12;
            $end = strpos($listing, "<", $start);
      
            //get the number of half-baths
            $half = "Half baths: " . substr($listing, $start, $end - $start);
            if (strpos($half, "box_wrapper") > 1)
                $half = "";
		    $start = strpos($listing, "MLS#:") + 6;
            $end = strpos($listing, "<", $start);
      
            //get the MLS number
            $mls = substr($listing, $start, $end - $start);
            $url = "http://www.ntreis.immobel.com/personal/1/listingDetails.do?per=kingdomestaterealty&c_mls=" . $mls;
		    $start = strpos($listing, "img src") + 9;
            $end = strpos($listing, "\"", $start);
      
            //get the link to the picture of the house
            $img = "http://www.ntreis.immobel.com" . substr($listing, $start, $end - $start);
		  
            //create the structure that's returned as the call result 
echo "i = " . $i . "<br>";
echo "j = " . $j . "<br>";
echo "active = " . $active . "<br>";

            if ((($i == 0) && ($j == 0)) || ($active > "")){
                $html .= "<div class='item active'>";
                $active = "";
            }
            else
                $html .= "<div class='item'>";
                    $html .= "<div>";
                        $html .= "<div class='row'>";
                            $html .= "<div class='col-lg-12'>";
                                $html .= "<center><a href=\"" . $url . "\" target=_empty>" . $addr . "</a></center><hr>";
                            $html .= "</div>";
                        $html .= "</div>";
                        $html .= "<div class='row'>";
                            $html .= "<div class='col-lg-7'>";
                                $html .= "<center><a href=\"" . $url . "\" target=_empty><img src=\"" . $img . "\" width=200></a></center>";
                            $html .= "</div>";
                            $html .= "<div class='col-lg-5'>";
                                $html .= $bed . "<br>" . $bath . "<br>" . $half . "<br><br>" . $sqft . "<br>" . $lot . "<br><br>" . $mls;
		                    $html .= "</div>";
                        $html .= "</div>";
                        $html .= "<div class='row'>";
                            $html .= "<div class='col-lg-12'>";
                                $html .= "<hr><center>" . $price . "</center>";
                            $html .= "</div>";
                        $html .= "</div>";
                    $html .= "</div>";
                $html .= "</div>";
        }
        $pos = $pos + 20;
    }
}
$html .= "</div>";
$html .= "<a class='left carousel-control' href='#" . str_replace(" ", "", $city) . "Carousel' data-slide='prev'>";
    $html .= "<span class='glyphicon glyphicon-chevron-left'></span>";
    $html .= "<span class='sr-only'>Previous</span>";
$html .= "</a>";
$html .= "<a class='right carousel-control' href='#" . str_replace(" ", "", $city) . "Carousel' data-slide='next'>";
    $html .= "<span class='glyphicon glyphicon-chevron-right'></span>";
    $html .= "<span class='sr-only'>Next</span>";
$html .= "</a>";
$html .= "</div>";

if (strpos($html, "img") == 0)
  $html = "No listings found for " . $city;
echo $html;

function getField($source, $fName){
    //echo $source;
    $res = "";
    $start = strpos($source, $fName);
    if ($start > 1){
        $start = strpos($source, "false;", $start) + 8;
        $end = strpos($source, "<", $start);
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
