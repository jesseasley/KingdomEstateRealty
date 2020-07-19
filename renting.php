<script>
    $(document).ready(function () {
        $("#name").focus();
    });
    function submitRenter(){
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
            var parms = "A renter expressed interest on the Renter's page of the website.<br /><br />" +
                "The fields passed in were:<br /><br />" +
                "Name = '" + $("#name").val() + "'<br />" +
                "Email = '" + $("#email").val() + "'<br />" +
                "Phone = '" + $("#phone").val() + "'<br />" +
                "Credit score = '" + $("#creditScore").val() + "'<br />" +
                "Monthly income = '" + $("#monthlyIncome").val() + "'<br />" +
                "Home many people = '" + $("#people").val() + "'<br />" +
                "Move-in date = '" + $("#moveInDate").val() + "'<br />" +
                "Pet info = '" + $("#pets").val() + "'<br />" +
                "Do you rent/own = '" + $("#rentOrOwn").val() + "'<br />" +
                "Can we contact landlord = '" + $("#contactLandlord").val() + "'<br />" +
                "Landlord's contact info = '" + $("#landlordInfo").val() + "'<br />" +
                "Other criteria = '" + $("#other").val() + "'<br />";
            $.ajax(
            {
                type: "POST",
                url: "email.php",
                data: {
                name: $("#name").val(),
                phone: $("#phone").val(),
                email: $("#email").val(),
                subject: "Renter Interested",
                body: parms
                },
                success: function (data) {
                    $("#content").html(data);
                },
                error: function (j, err) {
                    alert(j.status);
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
<div class="row">
    <div class="col-lg-12">
        <span class="pageheading">Renting...</span>
        <br /><br />

        Either you are <b><u>looking for house to RENT “Fast”</u></b> or you want <b><u>to LEASE your properties “Quickly”.</u> 
    <br /><br />
        We can definitely help you!</b>
    <br /><br />
   
        Just follow the two Simple Steps below and we will help you get started:
    <br /><br />
        <h4>[1] For RENTER:</h4>
        <h5>Step 1:</h5> To help us understand your real needs, please fill up following quick info:
    <br /><br />
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
    <div class="row" style="height:5px" />
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
    <div class="row" style="height:5px" />
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
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six"> 1. Please state your credit score </label>
        </div>
        <div class="col-lg-2">
            <input type="text" id="creditScore" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six"> 2. Average Monthly household income? </label>
        </div>
        <div class="col-lg-2">
            <input type="text" id="monthlyIncome" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="two">3. Total # people moving in and age</label>
        </div>
        <div class="col-lg-3">
            <input type="text" id="people" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six">4. Your planning date to move in?</label>
        </div>
        <div class="col-lg-2">
            <input type="text" id="moveInDate" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six">5. How many pets and what is their weight?</label>
        </div>
        <div class="col-lg-4">
            <input type="text" id="pets" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six">6. Are you currently renting or owning a house? </label>
        </div>
        <div class="col-lg-2">
            <input type="text" id="rentOrOwn" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six"> 7. Could we contact your landlord for reference?</label>
        </div>
        <div class="col-lg-2">
            <input type="text" id="contactLandlord" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six">8. Landlord's name, email and phone:</label>
        </div>
        <div class="col-lg-4">
            <input type="text" id="landlordInfo" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:5px" />
    <div class="row">
        <div class="col-lg-4">
            <label class="control-label" for="six">9. Other important info we need to know? </label>
        </div>
        <div class="col-lg-7">
            <input type="text" id="other" class="form-control" />
        </div>
    </div>
    <div class="row" style="height:15px" />
    <div class="row">
        <div class="col-lg-12" style="text-align:center">
            <a href="#Home">
                <button class="btn btn-primary" onclick="submitRenter();">Send Answers</button>
            </a>
            <a href="#Home" class="btn btn-default" onclick="showHome();">Cancel</a>
        </div>
    </div>
    <br /><br />
        <h4>Step 2:</h4> Begin your House Search by clicking 
<a target="_blank" href="http://www.immobel.com/kingdomestaterealty/">
    <u>HERE</u>
  </a> and tap into one of the most powerful Real Estate Database in North Texas. 
    <br /><br />
  Find the one you like, save it and send it to us! We will help you acquire it!
    <br /><br />

        <h4>[2] FOR LANDLORD</h4>Just contact us directly with Email or Call us at the number below!
    <br /><br />
    Just as simple as that, look forward to hearing from you!
    <hr />
    <a href="#Email" onclick='showPage("email_html.php","stub");' >
        <u>Email us today</u>
    </a> or Call/Text: 972-742-9575
    <br /><br />

    </div>
</div>