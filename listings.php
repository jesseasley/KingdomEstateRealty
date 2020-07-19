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
					if (data == "No listings found for Plano")
						$('#OurLeases').html("No properties for rent at the moment");
					else
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
        <div class="col-lg-1"></div>
        <div class="col-lg-5">
            <center>
                <h4>Our Homes For Sale</h4>
                <br />
                <div id="OurSales">Loading properties...</div>
            </center>
            <br />
        </div>
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