<!--#include file="includes/header.asp"-->    
<!--#include file="includes/validate-email.asp"-->    
<!--#include file="includes/connection.asp"-->    
<!--#include file="includes/sendmail.asp"-->    
              <TABLE HEIGHT="100%" WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" class="interior">
                <tr> 
                  <td valign=top> 
<%
	bValid = 0
	'validate opt-in fields
	if request.form("SubmitType") > "" then
		if request.form("txtFirstName") = "" or _
		   request.form("txtLastName") = "" or _
		   request.form("txtPhoneNumber") = "" or _
		   request.form("txtInEmail") = "" then
		   		bValid = 1
		end if
		if bValid = 0 then
			If Not isValidEmail(request.form("txtInEmail")) Then
			    bValid = 1
			End If    
		end if
	end if
%>
<%
	if request.form("SubmitType") = "" or bValid > 0 then
%>
                  	<form method=post name="frm" action="register.asp">
	                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">
							<tr><td width=7></td><td>
	                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">
	                  		<tr height=4><td></td></tr>

<%
	if request.form("SubmitType") > "" and bValid > 0 then
%>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td class="error" colspan=2>
	                  				Some fields failed validation.  Please check below and make the necessary 
	                  				corrections.  When you're finished, press the Save button to save your 
	                  				changes.
	                  				<br><br>
	                  			</td>
	                  		</tr>
<%
	end if
%>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td class="pageheading" colspan=2 height="50">
	                  				Registering with <%=sReferer%><br>
	                  			</td>
	                  		</tr>
	                  		<tr>
	                  			<td colspan=3> 
	                  				<span class="sectionheading" >
									Register with <%=sReferer%> to get the Life@Home Newsletters. <br>
									These newsletters are chocked full of insightful, 
									timely articles.<br><br>
									Providing the information below will complete your registration.
									</span><br><br><br>
	                  			</td>
							</tr>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td width="19%"
		                  			<%if bValid = 1 and request.form("txtFirstName") = "" then%> 
		                  				class="fieldfailedvalidation" 
		                  			<%else%>
		                  				class="text" 
		                  			<%end if%>>
									First Name: 
	                  			</td>
	                  			<td class="text" width="81%">
									<input class="text" type=text name="txtFirstName" size="40" value="<%=replace(request.form("txtFirstName"), """", "")%>">
									<span class="error">*</span>
	                  			</td>
							</tr>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td width="19%"
		                  			<%if bValid = 1 and request.form("txtLastName") = "" then%> 
		                  				class="fieldfailedvalidation" 
		                  			<%else%>
		                  				class="text" 
		                  			<%end if%>>
									Last Name: 
	                  			</td>
	                  			<td class="text" width="81%">
									<input class="text" type=text name="txtLastName" size="40" value="<%=replace(request.form("txtLastName"), """", "")%>">
									<span class="error">*</span>
	                  			</td>
							</tr>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td width="19%"
		                  			<%if bValid = 1 and request.form("txtPhoneNumber") = "" then%> 
		                  				class="fieldfailedvalidation" 
		                  			<%else%>
		                  				class="text" 
		                  			<%end if%>>
									Phone Number: 
	                  			</td>
	                  			<td class="text" width="81%">
									<input class="text" type=text name="txtPhoneNumber" size="40" value="<%=replace(request.form("txtPhoneNumber"), """", "")%>">
									<span class="error">*</span>
	                  			</td>
							</tr>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td width="19%"
		                  			<%if bValid = 1 and request.form("txtInEmail") = "" then%> 
		                  				class="fieldfailedvalidation" 
		                  			<%else%>
		                  				class="text" 
		                  			<%end if%>>
									Email Address: 
	                  			</td>
	                  			<td class="text" width="81%">
									<input class="text" type=text name="txtInEmail" size="40" value="<%=replace(request.form("txtInEmail"), """", "")%>">
									<span class="error">*</span>
	                  			</td>
							</tr>
							<tr>
	                  			<td width=20>&nbsp;</td>
								<td colspan=2>
									<table cellpadding=0 cellspacing=0 border=0 width=383>
										<tr>
											<td align=right>
												<input type=hidden name=SubmitType value="OptIn">
												<a href="javascript:frm.submit()" id="button">Save</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
	                  			<td width=20>&nbsp;</td>
								<td colspan=2>
									&nbsp;
								</td>
							</tr>
						</table></td></tr></table>
					</form>
<%
else
	system = "register"
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	sql = "select * from OptInOut where FirstName = '" & replace(request.form("txtFirstName"), "'", "''") & "' and " & _
												   "LastName = '" & replace(request.form("txtLastName"), "'", "''") & "' and " & _
												   "Phone = '" & replace(request.form("txtPhoneNumber"), "'", "''") & "' and " & _
												   "Email = '" & replace(request.form("txtInEmail"), "'", "''") & "' and " & _
												   "SystemName = '" & system & "' and " & _
												   "OptionInOut = 'In'"
	set rs = cn.Execute(sql)
	if rs.EOF then
		sql = "insert into OptInOut (FirstName, LastName, Phone, Email, SystemName, OptionInOut) " & _
			"values ('" & replace(request.form("txtFirstName"), "'", "''") & "', " & _
			"'" & replace(request.form("txtLastName"), "'", "''") & "', " & _
			"'" & replace(request.form("txtPhoneNumber"), "'", "''") & "', " & _
			"'" & replace(request.form("txtInEmail"), "'", "''") & "', " & _
			"'" & system & "', " & _
			"'In')"
		cn.Execute sql

		SendEmail "Registration", _
				  request.form("txtFirstName"), _
				  request.form("txtLastName"), _
				  request.form("txtPhoneNumber"), _
				  request.form("txtInEmail")

		SendEmail "RegistrationCustomerResponse", _
				  request.form("txtFirstName"), _
				  request.form("txtLastName"), _
				  request.form("txtPhoneNumber"), _
				  request.form("txtInEmail")

	end if
	response.Cookies("FirstName") = request.form("txtFirstName")
	response.Cookies("FirstName").expires = date + 1000
	response.Cookies("LastName") = request.form("txtLastName")
	response.Cookies("LastName").expires = date + 1000
	response.Cookies("Email") = request.form("txtInEmail")
	response.Cookies("Email").expires = date + 1000
%>
	                  	<table cellpadding=0 cellspacing=0 border=0 width="540">
	                  		<tr height=4><td></td></tr>
	                  		<tr>
	                  			<td width=5>&nbsp;</td>
	                  			<td class="sectionheading">Your information was successfully saved.  <br><br>
	                  			Thank you for registering.<br><br>
	                  			Please click <a class="sectionheading" href="default.asp"><big><b>>>HERE<<</b></big></a> to return to the main page.</td>
	                  		</tr>
	                  	</table>
<%
end if
%>
                  </td>
                </tr>

              </TABLE>
<!--#include file="includes/footer.asp"-->
