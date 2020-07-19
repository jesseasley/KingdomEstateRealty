<script>
    $(document).ready(function () {
        $("#name").focus();
    });
    function submitBuyer(){
        error = "";
        if ($("#name").val() == "")
            error = "Name is required\n";
        if ($("#email").val() == "")
            error += "Email is required\n";
        if ($("#phone").val() == "")
            error += "Phone is required\n";
        if (error > ""){
            alert(error);
        }
        else{
            var parms = "A buyer expressed interest on the Buyer's page of the website.<br /><br />" +
                "The fields passed in were:<br /><br />" +
                "Name = '" + $("#name").val() + "'<br />" +
                "Email = '" + $("#email").val() + "'<br />" +
                "Phone = '" + $("#phone").val() + "'<br />" +
                "How long have you looked? = '" + $("#one").val() + "'<br />" +
                "Who else is moving in? = '" + $("#two").val() + "'<br />" +
                "How do you hear about us? = '" + $("#three").val() + "'<br />" +
                "Working with another agent? = '" + $("input[name='four']:checked").val() + "'<br />" +
                "Working with a Lender? = '" + $("input[name='five']:checked").val() + "'<br />" +
                "Credit score = '" + $("#six").val() + "'<br />" +
                "Home price range = '" + $("#seven").val() + "'<br />" +
                "Down payment budget = '" + $("#eight").val() + "'<br />" +
                "What Cities = '" + $("#nine").val() + "'<br />" +
                "Bedrooms = '" + $("#buybedrooms").val() + "'<br />" +
                "Bathrooms = '" + $("#bathrooms").val() + "'<br />" +
                "Square Footage = '" + $("#sqft").val() + "'<br />" +
                "Year Built = '" + $("#year").val() + "'<br />" +
                "Other criteria = '" + $("#other").val() + "'<br />";
            $.ajax(
            {
                type: "POST",
                url: "email.php",
                data: {
                    name: $("#name").val(),
                    phone: $("#phone").val(),
                    email: $("#email").val(),
                    subject: "Buyer Interested",
                    body: parms
                },
                success: function (data) {
                    $("#content").html(data);
                }
            });
        }
    }
    function checkValid(name){
        if ($("#" + name).val() == ""){
            $("#" + name + "Parent").addClass("has-error");
            $("#" + name + "Parent").removeClass("has-success");
            $("#" + name + "Icon").addClass("glyphicon-remove");
            $("#" + name + "Icon").removeClass("glyphicon-ok");
        }
        else{
            $("#" + name + "Parent").removeClass("has-error");
            $("#" + name + "Parent").addClass("has-success");
            $("#" + name + "Icon").removeClass("glyphicon-remove");
            $("#" + name + "Icon").addClass("glyphicon-ok");
        }
    }
</script>
<div>
    <span class="pageheading">Buying...</span>
    <br /><br />
    Whether you are buying your first home, second home or investment property, you have come to right site. <b>We can help you!</b>
    <br /><br />
    Just follow the two Simple Steps below and we will help you get started:
    <br /><br />
    <h4>Step 1:</h4> To help us understand your real needs, please fill up following quick info:
    <br /><br />
    <form id="NameGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-1">
                <label class="control-label" for="name">Name:</label>
            </div>
            <div id="nameParent" class="col-lg-5 has-error">
                <input type="text" id="name" class="form-control" onchange="checkValid('name');" 
                        placeholder="..so we could address you properly" value="" />
                <span id="nameIcon" class="glyphicon glyphicon-remove form-control-feedback"></span>
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="EmailGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-1">
                <label class="control-label" for="email">Email:</label>
            </div>
            <div id="emailParent" class="col-lg-5 has-error">
                <input type="email" id="email" class="form-control" onchange="checkValid('email');" 
                       placeholder="yourname@domain.com" value="" />
                <span id="emailIcon" class="glyphicon glyphicon-remove form-control-feedback"></span>
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="PhoneGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-1">
                <label class="control-label" for="phone">Phone:</label>
            </div>
            <div id="phoneParent" class="col-lg-5 has-error">
                <input type="tel" id="phone" class="form-control" onchange="checkValid('phone');" 
                       placeholder="Phone number with no dashes (1234567890)" value="" />
                <span id="phoneIcon" class="glyphicon glyphicon-remove form-control-feedback"></span>
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="OneGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-3">
                <label class="control-label" for="one">1.	How long have you been looking?</label>
            </div>
            <div class="col-lg-3">
              <input type="text" id="one" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="TwoGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-3">
                <label class="control-label" for="two">2.	Who else is moving in with you?</label>
            </div>
            <div class="col-lg-5">
              <input type="text" id="two" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="ThreeGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-3">
                <label class="control-label" for="three">3.	How do you hear about us?</label>
            </div>
            <div class="col-lg-5">
              <input type="text" id="three" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="FourGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-4">
                <label class="control-label" for="four">4.	Are you working with any other real estate agent?</label>
            </div>
            <div class="col-lg-2">
                <label class="radio-inline">
                    <input type="radio" name="four" value="Yes" />Yes
                </label>
                <label class="radio-inline">
                    <input type="radio" checked name="four" value="No" />No
                </label>
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="FiveGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-4">
                <label class="control-label" for="five">5.	Are you working with any Loan Officer/Lender? </label>
            </div>
            <div class="col-lg-2">
                <label class="radio-inline">
                    <input type="radio" name="five" value="Yes" />Yes
                </label>
                <label class="radio-inline">
                    <input type="radio" checked name="five" value="No" />No
                </label>
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="SixGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-4">
                <label class="control-label" for="six"> 6.	What is your credit score (if known)? </label>
            </div>
            <div class="col-lg-2">
                <input type="text" id="six" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="SevenGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-4">
                <label class="control-label" for="seven"> 7.	Price range of home (Minimum to Maximum)? </label>
            </div>
            <div class="col-lg-3">
                <input type="text" id="seven" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="EightGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-7">
                <label class="control-label" for="eight">8.	How much do you budget for down payment (i.e. typically 20% of Sale Price) $
                </label>
            </div>
            <div class="col-lg-2">
                <input type="text" id="eight" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="NineGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-4">
                <label class="control-label" for="nine">9.	What Cities? (list them in order of importance)</label>
            </div>
            <div class="col-lg-8">
                <input type="text" id="nine" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="TenGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-2">
                <label class="control-label" for="">10.	Specific criteria: </label>
            </div>
            <div class="col-lg-1">
                <label class="control-label" for="buybedrooms">Bedrooms: </label>
            </div>
            <div class="col-lg-2">
                <select class="form-control" id="buybedrooms" style="width:60px">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3" selected>3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                </select>
            </div>
            <div class="col-lg-2 hidden-xs" style="text-align:right">
                <label class="control-label" for="bathrooms">Bathrooms: </label>
            </div>
            <div class="col-lg-2 hidden-lg hidden-md hidden-sm">
                <label class="control-label" for="bathrooms">Bathrooms: </label>
            </div>
            <div class="col-lg-2">
                <select class="form-control" id="bathrooms" style="width:100px">
                    <option value="1">1</option>
                    <option value="1+">1.5</option>
                    <option value="2">2</option>
                    <option value="2+" selected>2.5</option>
                    <option value="3">3</option>
                    <option value="3+">3.5</option>
                    <option value="4">4</option>
                </select>
            </div>
        </div>
        <div class="row" style="height:5px" />
        <div class="row">
            <div class="col-lg-3 hidden-xs" style="text-align:right">
                <label class="control-label" for="sqft">Square footage: </label>
            </div>
            <div class="col-lg-3 hidden-lg hidden-md hidden-sm">
                <label class="control-label" for="sqft">Square footage: </label>
            </div>
            <div class="col-lg-2">
                <input type="text" id="sqft" class="form-control" />
            </div>
            <div class="col-lg-3 hidden-xs" style="text-align:right">
                <label class="control-label" for="year">Year Built: </label>
            </div>
            <div class="col-lg-3 hidden-lg hidden-md hidden-sm">
                <label class="control-label" for="year">Year Built: </label>
            </div>
            <div class="col-lg-2">
                <input type="text" id="year" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:5px" />
    <form id="OtherGroup" class="form-horizontal">
        <div class="row">
            <div class="col-lg-2">
                <label class="control-label" for="other">Any other criteria:</label>
            </div>
            <div class="col-lg-10">
                <input type="text" id="other" class="form-control" />
            </div>
        </div>
    </form>
    <div class="row" style="height:15px" />
    <form id="SubmitButton" class="form-horizontal">
        <div class="row">
            <div class="col-lg-12" style="text-align:center">
                <a href="#Home">
                    <button class="btn btn-primary" onclick="submitBuyer();">Send Answers</button>
                </a>
                <a href="#Home" class="btn btn-default" onclick="showHome();">Cancel</a>
            </div>
        </div>
    </form>

    <h4>Step 2:</h4> 
    Begin your House Search by clicking
    <a target="_blank" href="http://www.immobel.com/kingdomestaterealty/">
        <u>HERE</u>
    </a> and tap into one of the most powerful Real Estate Database in North Texas. 
    <br /><br />
    Find the one you like, save it and send it to us! We will help you acquire it!
    <br /><br />
    Just as simple as that, look forward to hearing from you!
    <hr />
    <a href="#Email" onclick='showPage("email_html.php","stub");' >
        <u>Email us today</u>
    </a> or Call/Text: 972-742-9575
    <br /><br />
</div>