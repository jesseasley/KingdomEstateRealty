<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://malsup.github.com/jquery.cycle.all.js"></script>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
  width: 100%;
  margin: auto;
  }


  .carousel-fade .carousel-inner .item {
  opacity: 0;
  transition-property: opacity;
  }

  .carousel-fade .carousel-inner .active {
  opacity: 1;
  }

  .carousel-fade .carousel-inner .active.left,
  .carousel-fade .carousel-inner .active.right {
  left: 0;
  opacity: 0;
  z-index: 1;
  }

  .carousel-fade .carousel-inner .next.left,
  .carousel-fade .carousel-inner .prev.right {
  opacity: 1;
  }

  .carousel-fade .carousel-control {
  z-index: 2;
  }

  /*
  WHAT IS NEW IN 3.3: "Added transforms to improve carousel performance in modern browsers."
  Need to override the 3.3 new styles for modern browsers & apply opacity
  */
  @media all and (transform-3d), (-webkit-transform-3d) {
  .carousel-fade .carousel-inner > .item.next,
  .carousel-fade .carousel-inner > .item.active.right {
  opacity: 0;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  }
  .carousel-fade .carousel-inner > .item.prev,
  .carousel-fade .carousel-inner > .item.active.left {
  opacity: 0;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  }
  .carousel-fade .carousel-inner > .item.next.left,
  .carousel-fade .carousel-inner > .item.prev.right,
  .carousel-fade .carousel-inner > .item.active {
  opacity: 1;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  }
  }


  #nav ul li {
  list-style-type: none;
  text-align: center;
  float: left;
  margin: 0px;
  }
  #nav ul li a {
  text-decoration: none;
  color: #000;
  text-align: center;
  display: block;
  padding: 10px;
  margin: 0px;
  }
  #nav ul li a:hover {
  color: #CD0000;
  }
  #nav ul li a.active{
  color: red;
  }
  a.visited{
  color:red;

  }
</style>
<script>
        $(document).ready(function () {
            $.ajax(
            {
                type: "POST",
                url: "active_listings.php",
                data: {
                    "featured": "1",
                    "type": "1"
                },
                success: function (data) {
                    $('#OurSales').html(data);
                    $('.carousel').carousel({
                        interval: 5000,
						            cycle: true
                    });
                }
            });
            $.ajax(
            {
                type: "POST",
                url: "active_listings.php",
                data: {
                    "featured": "1",
                    "type": "2"
                },
                success: function (data) {
                    $('#OurLeases').html(data);
                    $('.carousel').carousel({
                        interval: 5000,
						            cycle: true
                    });
                }
            });
        });
</script>
<div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <span class="pageheading">Our Listings, we can help you purchase fast..</span>
            <br />
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-lg-5">
            <center>
                <h4>Our Homes For Sale</h4>
                <br />
                <div id="OurSales">Loading properties...</div>
            </center>
            <br />
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-5">
            <center>
                <h4>Our Homes For Lease</h4>
                <br />
                <div id="OurLeases">Loading properties...</div>
            </center>
            <br />
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <hr />
            <a href="#Email" onclick='showPage("email_html.php","stub");' >
                <u>Email us today</u>
            </a> or Call/Text: 972-742-9575
            <br /><br />
        </div>
    </div>
</div>