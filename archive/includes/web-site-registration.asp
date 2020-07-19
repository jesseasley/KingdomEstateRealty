<!--#include file="connection.asp"-->    
<!--#include file="validate-email.asp"-->    
<!--#include file="sendmail.asp"-->    
<%
Set rs = Server.CreateObject("ADODB.Recordset")
set cn = server.createobject("adodb.connection")
cn.Mode = 3
cn.open sConnection
sql = "select requires_registration from advice_articles where Article_location = '" & Request.ServerVariables("url") & "'"
set rs = cn.Execute(sql)
show_page = false
if rs.Fields(0) = true then 
	sEmail = Request.Cookies("Email")
	if sEmail = "" then
		bCollect = true
	else
		sql = "select count(*) from OptInOut where Email = '" & replace(sEmail, "'", "''") & "'"
		set rs = cn.Execute(sql)
		if rs.Fields(0) > 0 then
			bCollect = false
			show_page = true
		else
			bCollect = true
		end if
	end if

	if bCollect = true then
		bValid = 0
		if request.form("SubmitType") = "WebSiteRegistration" then
			'validate opt-in fields
			if request.form("txtFirstName") = "" or _
			   request.form("txtLastName") = "" or _
			   request.form("txtPhoneNumber") = "" or _
			   request.form("txtEmail") = "" then
			   		bValid = 1
			end if
			if bValid = 0 then
				If Not isValidEmail(request.form("txtEmail")) Then
				    bValid = 1
				End If    
			end if
		end if
		if request.form("SubmitType") > "" and bValid > 0 then
	%>
		                  		<tr>
		                  			<td width=20>&nbsp;</td>
		                  			<td colspan=2><font color="#FF0000"><b>Some fields failed validation.  Please check below and make the necessary 
		                  			corrections.  When you're finished, press the Save button to save your changes.</font><br><br></td>
		                  		</tr>
	<%
		end if
		if request.form("SubmitType") = "" or bValid > 0 then
	%>
	                  	<form method=post action="advice.asp" id=form1 name=form1>
		                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">
		                  		<tr>
		                  			<td width=7>&nbsp;</td>
		                  			<td colspan=2 height="152" valign=top>
		                  				<font size="3"><b>Web Site Registration</b><br><br>
										Viewing portions of the informational on-line advice topics requires a one time registration.  Please fill in 
										the fields below and press the Save button to complete registration.<br><br><br>
		                  			</td>
								</tr>
		                  		<tr>
		                  			<td width=7>&nbsp;</td>
		                  			<td width="18%"<% if bValid = 1 and request.form("txtFirstName") = "" then %> bgcolor="#FF0000" <% end if %>>
										<% if bValid = 1 and request.form("txtFirstName") = "" then %><b><% end if %>First Name: </b>
		                  			</td>
		                  			<td width="81%">
										<input type=text name="txtFirstName" size="40" value="<%=replace(request.form("txtFirstName"), """", "")%>">
										<font color="#FF0000">*</font>
		                  			</td>
								</tr>
		                  		<tr>
		                  			<td width=7>&nbsp;</td>
		                  			<td width="18%"<% if bValid = 1 and request.form("txtLastName") = "" then %> bgcolor="#FF0000" <% end if %>>
										<% if bValid = 1 and request.form("txtLastName") = "" then %><b><% end if %>Last Name: 
		                  			</td>
		                  			<td width="81%">
										<input type=text name="txtLastName" size="40" value="<%=replace(request.form("txtLastName"), """", "")%>">
										<font color="#FF0000">*</font>
		                  			</td>
								</tr>
		                  		<tr>
		                  			<td width=7>&nbsp;</td>
		                  			<td width="18%"<% if bValid = 1 and request.form("txtPhoneNumber") = "" then %> bgcolor="#FF0000" <% end if %>>
										<% if bValid = 1 and request.form("txtPhoneNumber") = "" then %><b><% end if %>Phone Number: 
		                  			</td>
		                  			<td width="81%">
										<input type=text name="txtPhoneNumber" size="40" value="<%=replace(request.form("txtPhoneNumber"), """", "")%>">
										<font color="#FF0000">*</font>
		                  			</td>
								</tr>
		                  		<tr>
		                  			<td width=7>&nbsp;</td>
		                  			<td width="18%"<% if bValid = 1 and (request.form("txtEmail") = "" or Not isValidEmail(request.form("txtEmail"))) then %> bgcolor="#FF0000" <% end if %>>
										<% if bValid = 1 and (request.form("txtEmail") = "" or Not isValidEmail(request.form("txtEmail"))) then %><b><% end if %>Email Address: 
		                  			</td>
		                  			<td width="81%">
										<input type=text name="txtEmail" size="40" value="<%=replace(request.form("txtEmail"), """", "")%>">
										<font color="#FF0000">*</font>
		                  			</td>
								</tr>
								<tr>
		                  			<td width=7>&nbsp;</td>
									<td colspan=2>
										<table cellpadding=0 cellspacing=0 border=0 width=383>
											<tr>
												<td align=right>
													<input type=hidden name=SubmitType value="WebSiteRegistration">
													<input type=submit value="Save" id=submit1 name=submit1>											
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
		                  			<td width=7>&nbsp;</td>
									<td colspan=2>&nbsp;</td>
								</tr>
							</table>
						</form>
	<%
		else
			system = "WebSiteRegistration"
			sql = "insert into OptInOut (FirstName, LastName, Phone, Email, SystemName) values ('" & replace(request.form("txtFirstName"), "'", "''") & "', " & _
																							"'" & replace(request.form("txtLastName"), "'", "''") & "', " & _
																							"'" & replace(request.form("txtPhoneNumber"), "'", "''") & "', " & _
																							"'" & replace(request.form("txtEmail"), "'", "''") & "', " & _
																							"'" & system & "')"
			cn.Execute sql
			sendemail "websiteregistration", true
			response.Cookies("FirstName") = request.form("txtFirstName")
			response.Cookies("FirstName").expires = date + 1000
			response.Cookies("LastName") = request.form("txtLastName")
			response.Cookies("LastName").expires = date + 1000
			response.Cookies("Email") = request.form("txtEmail")
			response.Cookies("Email").expires = date + 1000
			Response.Redirect Request.ServerVariables("url")
		end if
	end if
else
	show_page = true
end if
%>