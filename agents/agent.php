	<script>
		var agents;
		readAgentFile();

        $(document).ready(function () {
			$("#register").hide(0);
			$("#invalidLogin").hide();
			$("#accountDisabled").hide();
            if (location.toString().indexOf("#Login") > 0){
                openLogin();
			}
			else{
				openRegistration();
			}
			$("#loginEmail").focus();
		});
		function agentSubmit(){
//alert("entered submit");
			readAgentFile();
        }

        function readAgentFile() {
            $.ajax(
            {
                type: "GET",
                url: "agents/readAgentJSON.php",
                success: function (data) {
                    agents = eval("(" + data + ")");
                }
            });
        }

		function saveAgentFile() {
			agents.agents.push({"name":$("#name").val(),
				"address":$("#address").val(),
				"email":$("#email").val(),
				"password":$("#pwd").val(),
				"work":$("#work").val(),
				"home":$("#homePhone").val(),
				"cell":$("#cell").val(),
				"pref":$("#pref").val(),
				"title":$("#title").val(),
				"enabled":"No"});
            $.ajax(
            {
                type: "POST",
                url: "agents/saveAgentJSON.php",
                data: { json: JSON.stringify(agents) },
                success: function (data) {
					$("#loginEmail").val($("#email").val());
					$("#loginPwd").val($("#pwd").val());
					openLogin();
                }
            });
        }
		function Login(){
			for (var i=0;i < agents.agents.length;i++){
				if ((agents.agents[i].email == $("#loginEmail").val() ) && ( agents.agents[i].password == $("#loginPwd").val() )){
					if (agents.agents[i].enabled == "No"){
						$("#user").html("");
						$("#accountDisabled").show();
						$("#accountDisabled").fadeOut(4000);
					}
					else{
						$("#user").html(agents.agents[i].name);
						i = agents.agents.length;
						showHome();
					}
				}
				else{
					$("#user").html("");
					$("#invalidLogin").show();
					$("#invalidLogin").fadeOut(4000);
				}
			}
		}
		function openRegistration(){
			$("#logon").slideUp("slow", function(){
				$("#register").slideDown("slow", function(){
					$("#name").focus();
				});
			});
		}
		function openLogin(){
			$("#register").slideUp("slow", function(){
				$("#logon").slideDown("slow", function(){
					$("#loginEmail").focus();
				});
			});
		}
    </script>
    <div id="logon" class="">
		<div class="row">
            <div class="col-lg-6">
				<div class="row">
					<div class="col-lg-12">
						Hi Dear Agent,
						<br /><br />
						Yes, we, the KER (Kingdom Estate Realty) Team, are expanding…
						<br /><br />
						I am glad you found us, if you are looking for the following:
						<br /><br />
						<table>
							<tr>
								<td valign="top">1.&nbsp;</td>
								<td>An Independent brokerage firm that cares about you as a person, and wants you to be successful!</td>
							</tr>
							<tr>
								<td valign="top">2.&nbsp;</td>
								<td>An Independent brokerage firm that enables you to build your own real estate business and 
									allow you to keep most of your commissions.</td>
							</tr>
							<tr>
								<td valign="top">3.&nbsp;</td>
								<td>Provide a people oriented, friendly, supportive environment and empower you to making a lot 
									of money while having fun as a team!</td>
							</tr>
						</table>
						<br />
						Then, you have found the right place to call home (for your business), Just  
						<a href="#Email" onclick='showPage("email_html.php","stub");' >
							<u>contact us</u>
						</a> or 
						call/text us 972-742- 9575 today and let’s begin the dialogue...
						<br />
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8"></div>
					<div class="col-lg-4">
						With the very best,<br />
						Chris Ho<br />
						President/Broker<br />
						The KER Team<br />
						Kingdom Estate Realty<br /><br />
					</div>
				</div>
			</div>
            <div class="col-lg-5 well">
                <div class="row">
                    <div class="col-lg-12" style="text-align:center">
                        <h3>Agent Login</h3>
						<br /><br />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <label for="email">Email</label>
                    </div>
                    <div class="col-lg-9">
                        <input type="email" class="form-control" id="loginEmail" value="">
                    </div>
                </div>
                <div class="row">
					&nbsp;
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <label for="pwd">Password:</label>
                    </div>
                    <div class="col-lg-9">
                        <input type="password" class="form-control" id="loginPwd" value="">
                    </div>
                </div>
                <div class="row">
                    &nbsp;
                </div>
                <div class="row">
                    <div class="col-lg-7" style="text-align:right">
						<span id="accountDisabled" style="color:red">Account disabled.</span>
						<span id="invalidLogin" style="color:red">Username and password match were not found.</span>
                    </div>
                    <div class="col-lg-5" style="text-align:right">
                        <a href="#Home"><button class="btn btn-primary" onclick="Login();">Login</button></a>
                        <a href="#Home" class="btn btn-default" onclick="showHome();">Cancel</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12" style="text-align:center">
						<br />
						<br />
						Don't have an account?  Register <a href="#ForAgents#Registration" onclick="openRegistration();"><u>HERE</u></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div id="register" class="">
		<div class="row">
			<div class="col-lg-2">
			</div>
            <div class="col-lg-8 well">
				<div class="row">
					<div class="col-lg-12" style="text-align:center">
						<h3>Agent Registration</h3>
						<br />
					</div>
				</div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="email">Name:</label>
                            <input type="text" class="form-control" id="name" value="">
                        </div>
                        <div class="form-group">
                            <label for="email">Address:</label>
                            <input type="text" class="form-control" id="address" value="">
                        </div>
                        <div class="form-group">
                            <label for="email">Email: (also your login user name)</label>
                            <input type="email" class="form-control" id="email" value="">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" value="">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="email">Work Phone:</label>
                            <input type="number" class="form-control" id="work" value="">
                        </div>
                        <div class="form-group">
                            <label for="email">Home Phone:</label>
                            <input type="number" class="form-control" id="homePhone" value="">
                        </div>
                        <div class="form-group">
                            <label for="email">Cell Number:</label>
                            <input type="number" class="form-control" id="cell" value="">
                        </div>
                        <div class="form-group">
                            <label for="email">Preference:</label>
                            <select class="form-control" id="pref">
                                <option></option>
                                <option>Work</option>
                                <option>Home</option>
                                <option selected>Cell</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
						<a href="#ForAgents#Login" onclick="openLogin();"><u>Back to Login</u></a>
                    </div>
                    <div class="col-lg-3">
                        <div class="checkbox">
                            <label><input type="checkbox"> Remember me</label>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group" style="text-align:right">
                            <button class="btn btn-primary" onclick="saveAgentFile();">Register</button>
	                        <a href="#Home" class="btn btn-default" onclick="showHome();">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
			<div class="col-lg-2">
			</div>
		</div>
    </div>
