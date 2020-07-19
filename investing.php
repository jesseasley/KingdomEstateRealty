<div>
    <script>
            $(document).ready(function () {
                $.ajax(
                {
                    type: "Get",
                    url: "active_listings.php",
                    data: "city=Plano&minprice=100000&maxprice=300000&type=1",
                    success: function (data) {
                        $('#InvestingPlanoProperties').html(data);
                        $('.carousel').carousel({
						    cycle: true
                        });
                    }
                });
                $.ajax(
                {
                    type: "Get",
                    url: "active_listings.php",
                    data: "minprice=100000&maxprice=300000&city=Dallas&type=1",
                    success: function (data) {
                        $('#InvestingDallasProperties').html(data);
                        $('.carousel').carousel({
						    cycle: true
                        });
                    }
                });
            });
    </script>
	<div class="row">
		<div class="col-lg-11">
            <span class="pageheading">Investing...</span>
            <br /><br />
            <span class="pageheading">"FREE One Hour Planning Session for Investors!"</span>
			<br /><br />

			If you are real estate investor, you have come to the right place! We have served many investor
			clients for last ten years. We help investors from strategy session to actual renting out the
			property, and collecting that first rent/deposit check is a sweet experience!
			<br /><br />

			Let us help you by kicking off with a 
			<b><u>FREE one hour session of investment strategy planning </u></b>
			with you to identify your goal, your strengths &amp; weaknesses as well as the dos and
			don'ts of investment. Then, formulating your next steps to help you to be successful!
			<br /><br />

			If are experienced investor, we could brainstorm with you and help you to be more successful
			going forward!
			<br /><br />

			Either way, please feel free to check out the listings below by clicking on any of the
			pictures which will take you to more comprehensive search page.
			<br /><br />

			So, happy searching and do 
			<a href="#Email" onclick='showPage("email_html.php","stub");'>
			  <u>contact us</u>
			</a> today!
			<br /><br />
		</div>
	</div>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-5">
            <center>
                <br />
                <div id="InvestingPlanoProperties">Loading Plano properties...</div>
            </center>
            <br />
        </div>
        <div class="col-lg-5">
            <center>
                <br />
                <div id="InvestingDallasProperties">Loading Dallas properties...</div>
            </center>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <hr />
            <a href="#Email" onclick='showPage("email_html.php","stub");' >
                <u>Email us today</u>
            </a> or Call/Text: 972-742-9575
            <br /><br />
        </div>
    </div>
    <br />
    <br />
</div>
