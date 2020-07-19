<script>
    $(document).ready(function () {
        $.ajax(
            {
                type: "POST",
                url: "active_listings.php",
                data: "city=dallas&minprice=1500000&maxprice=3000000&type=4",
                success: function (data) {
                    $('#CommercialProperties').html(data);
                    $('.carousel').carousel({
						cycle: true
                    });
                }
            });
    });
</script>
<div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-12">
                            <span class="pageheading">In Our Commercial Space...</span>
                            <br />
                            <br />
                            Welcome to the world of commercial Real Estate! The KER Team (Kingdom Estate Realty) has experience dealing buy/sell/lease
                            Commercial properties that fit your special needs,
                            <a href="#Email" onclick='showPage("email_html.php","stub");' >
                                <u>Contact us</u>
                            </a>today! We are standing by..<br /><br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8"></div>
                        <div class="col-lg-4">
                            Sincerely,<br />
                            The KER Team<br />
                            Joseph G<br />
                            Chris H<br />
                            <br /><br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            Feel free to click on interested property below and 
                            <a href="#Email" onclick='showPage("email_html.php","");' >
                                <u>contact us</u>
                            </a>
                            <br />
                        </div>
                    </div>
                    <div id="CommercialProperties">Loading Commercial properties...</div>
                </div>
                <div class="col-lg-6 col-md-5 col-sm-5">
                    <center>
                    <h4>A sample of involved properties</h4>
                    <br />
                    <div id="CommercialCarousel" class="carousel slide carousel-fade" data-ride="carousel" data-interval="12500">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#CommercialCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#CommercialCarousel" data-slide-to="1"></li>
                            <li data-target="#CommercialCarousel" data-slide-to="2"></li>
                            <li data-target="#CommercialCarousel" data-slide-to="3"></li>
                            <li data-target="#CommercialCarousel" data-slide-to="4"></li>
                            <li data-target="#CommercialCarousel" data-slide-to="5"></li>
                            <li data-target="#CommercialCarousel" data-slide-to="6"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="images/commercial/1.jpg" />
                            </div>
                            <div class="item">
                                <img src="images/commercial/2.jpg" />
                            </div>
                            <div class="item">
                                <img src="images/commercial/3.jpg" />
                            </div>
                            <div class="item">
                                <img src="images/commercial/4.jpg" />
                            </div>
                            <div class="item">
                                <img src="images/commercial/5.jpg" />
                            </div>
                            <div class="item">
                                <img src="images/commercial/6.jpg" />
                            </div>
                            <div class="item">
                                <img src="images/commercial/7.jpg" />
                            </div>
                        </div>

                        <!-- Left and right controls-->
                        <a class="left carousel-control" href="#CommercialCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#CommercialCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    </center>
                </div>
            </div>
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