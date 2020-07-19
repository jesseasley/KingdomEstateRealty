<script>
    $(document).ready(function () {
        $("#name").focus();
    });
    function checkRequired(){
        error = "";
        if ($("#nameText").val() == ""){
            error = "Name is required\n";
        }
        if ($("#emailText").val() == ""){
            error += "Email is required\n";
        }
        if ($("#phoneText").val() == ""){
            error += "Phone is required\n";
        }

        if (error > ""){
            alert(error);
        }
        else{
            $.ajax(
            {
                type: "POST",
                url: "email.php",
                data: {
                    name: $("#nameText").val(),
                    phone: $("#phoneText").val(),
                    email: $("#emailText").val(),
                    subject: $("#subjectText").val(),
                    body: $("#bodyTextArea").val()
                },
                success: function (data) {
                    $("#content").html(data);
                },
                error: function (jqXHR, status, err) {
                    $("#content").html("AJAX call failed! Error returned: " + err);
                }
            });
        }
    }
    function checkValid(name){
        if ($("#" + name + "Text").val() > ""){
            $("#" + name + "Parent").removeClass("has-error");
            $("#" + name + "Parent").addClass("has-success");
            $("#" + name + "Icon").removeClass("glyphicon-remove");
            $("#" + name + "Icon").addClass("glyphicon-ok");
        }
        else{
            $("#" + name + "Parent").removeClass("has-success");
            $("#" + name + "Parent").addClass("has-error");
            $("#" + name + "Icon").removeClass("glyphicon-ok");
            $("#" + name + "Icon").addClass("glyphicon-remove");
        }
    }
</script>
<div>
    <div id="introGroup">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <span class="pageheading">Contact Us...</span>
                <br /><br />
                Please let us know what you are looking for below, so we could help you soon!
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-3">
            </div>
            <div class="col-lg-4 col-md-4">
                With Regards<br />The KER (Kingdom Estate Realty) Team
            </div>
        </div>
        <br /><br />
    </div>
    <div class="row">
        <div class="col-lg-12">
            <form action="checkRequired();" onsubmit="return false;">
                <div class="form-group">
                    <div id="nameGroup">
                        <div class="row">
                            <div class="col-lg-12">
                                <label for="nameText">Name: </label>
                            </div>
                        </div>
                        <div class="row">
                            <div id="nameParent" class="col-lg-12 has-error">
                                <input type="text" id="nameText" class="form-control" placeholder="Tell us your name" onchange="checkValid('name');" value="" />
                                <span id="nameIcon" class="glyphicon glyphicon-remove form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <div id="emailGroup">
                        <div class="row">
                            <div class="col-lg-12">
                                <label for="emailText">Email: </label>
                            </div>
                        </div>
                        <div class="row">
                            <div id="emailParent" class="col-lg-12 has-error">
                                <input type="email" id="emailText" class="form-control" placeholder="yourname@domain.com" onchange="checkValid('email');" value="" />
                                <span id="emailIcon" class="glyphicon glyphicon-remove form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <div id="phoneGroup">
                        <div class="row">
                            <div class="col-lg-12">
                                <label for="phoneText">Phone: </label>
                            </div>
                        </div>
                        <div class="row">
                            <div id="phoneParent" class="col-lg-12 has-error">
                                <input type="tel" id="phoneText" class="form-control" placeholder="Phone number with no dashes (1234567890)" onchange="checkValid('phone');" value="" />
                                <span id="phoneIcon" class="glyphicon glyphicon-remove form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <div id="subjectGroup">
                        <div class="row">
                            <div class="col-lg-12">
                                <label for="subjectText">Subject: </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" id="subjectText" class="form-control" placeholder="You can specify a subject line for the email" value="" />
                            </div>
                        </div>
                    </div>
                    <div id="bodyGroup">
                        <div class="row">
                            <div class="col-lg-12">
                                <label for="bodyTextArea">Message: </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <textarea rows="5" id="bodyTextArea" class="form-control" placeholder="Tell us what's on your mind"></textarea>
                            </div>
                        </div>
                    </div>
                    <div id="buttonsGroup">
                        <div class="row">
                            <div class="col-lg-12">
                                <center>
                                    <br />
                                    <a href="#Home">
                                        <button type="submit" class="btn btn-primary" onclick="checkRequired();">Send</button>
                                    </a>
                                    <a href="#Home">
                                        <a class="btn btn-default" href="#Home" onclick="showHome();">Cancel</a>
                                    </a>
                                </center>
                            </div>
                        </div>
                        <br /><br />
                    </div>
                </div>
            </form>
            <hr />
            Call or Text today: 972-742-9575
            <br /><br />
        </div>
    </div>
</div>