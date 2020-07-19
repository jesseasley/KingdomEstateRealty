<!--#include file="includes/header.asp"-->    
<!--#include file="includes/connection.asp"-->    
<!--#include file="includes/sendmail.asp"-->    

              <TABLE HEIGHT="100%" WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" class="interior">
                <TR> 
                  <TD VALIGN="top" ALIGN="left"> 
                  </td>
                </tr>
                <tr> 
                  <td valign=top> 
<%
	bValid = 0
	if request.form("SubmitType") = "OptIn" then
		'validate opt-in fields
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
	elseif request.form("SubmitType") = "OptOut" then
		'validate opt-out fields
		if request.form("txtOutEmail") = "" then
		   		bValid = 2
		end if
		if bValid = 0 then
			If Not isValidEmail(request.form("txtOutEmail")) Then
			    bValid = 2
			End If    
		end if
	end if
%>
<!--#include file="includes/validate-email.asp"-->    
<%
	if request.form("SubmitType") = "" or bValid > 0 then
%>
                  	<form method=post name="frm" action="newsletter.asp">
	                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">

<%
	if request.form("SubmitType") > "" and bValid > 0 then
%>
	                  		<tr>
	                  			<td width=7>&nbsp;</td>
	                  			<td colspan=2 class="error">
		                  			Some fields failed validation.  Please check below and make the necessary 
		                  			corrections.  When you're finished, press the Save button to save your changes.
		                  			<br><br>
	                  			</td>
	                  		</tr>
<%
	end if
%>
	                  		<tr>
	                  			<td width=7>&nbsp;</td>
	                  			<td colspan=2 height="152">
	                  				<span class="sectionheading">Newsletter Opt-In</span><br><br>
									<span class="text">
										This section allows you to opt-in to the Newsletter subscription.  
										This is a wise choice because the articles 
										in the newsletter can help you stay 
										up-to-date with current events and trends in 
										the housing and mortgage industries.&nbsp; 
										Please fill in the required information 
										below.&nbsp;  Once your selection
										has been made, press the Save button to save your changes.<br><br><br>
									</span>
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
	                  			<td width=7>&nbsp;</td>
								<td colspan=2>
									&nbsp;
								</td>
							</tr>
						</table>
					</form>
                  	<form method=post name="frm2" action="newsletter.asp">
	                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">
	                  		<tr>
	                  			<td width=7>&nbsp;</td>
	                  			<td colspan=2>
	                  				<span class="sectionheading">Newsletter Opt-Out</span><br><br>
	                  				<span class="text">
										This section allows you to opt-out of the Newsletter subscription.  
										Please fill in the required information 
										below.. Once your selection
										has been made, press the Save button to save your changes.<br><br><br>
									</span>
	                  			</td>
							</tr>
	                  			<td width=7>&nbsp;</td>
	                  			<td width="19%"
		                  			<%if bValid = 2 and request.form("txtOutEmail") = "" then%> 
		                  				class="fieldfailedvalidation" 
		                  			<%else%>
		                  				class="text" 
		                  			<%end if%>>
									Email Address: 
	                  			</td>
	                  			<td class="text" width="81%">
									<input class="text" type=text name="txtOutEmail" size="40" value="<%=replace(request.form("txtOutEmail"), """", "")%>">
									<span class="error">*</span>
	                  			</td>
							<tr>
	                  			<td width=7>&nbsp;</td>
								<td colspan=2 >
									<table cellpadding=0 cellspacing=0 border=0 width=383>
										<tr>
											<td align=right>
												<input type=hidden name=SubmitType value="OptOut">
												<a href="javascript:frm2.submit()" id="button">Save</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
<%
else
	system = "newsletter"
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	if request.form("SubmitType") = "OptIn" then
		sql = "select * from OptInOut where FirstName = '" & replace(request.form("txtFirstName"), "'", "''") & "' and " & _
													   "LastName = '" & replace(request.form("txtLastName"), "'", "''") & "' and " & _
													   "Phone = '" & replace(request.form("txtPhoneNumber"), "'", "''") & "' and " & _
													   "Email = '" & replace(request.form("txtInEmail"), "'", "''") & "' and " & _
													   "SystemName = '" & system & "' and " & _
													   "OptionInOut = 'In'"
		set rs = cn.Execute(sql)
		if rs.EOF then
			sql = "insert into OptInOut (FirstName, LastName, Phone, Email, SystemName, OptionInOut) values ('" & replace(request.form("txtFirstName"), "'", "''") & "', " & _
																										"'" & replace(request.form("txtLastName"), "'", "''") & "', " & _
																										"'" & replace(request.form("txtPhoneNumber"), "'", "''") & "', " & _
																										"'" & replace(request.form("txtInEmail"), "'", "''") & "', " & _
																										"'" & system & "', " & _
																										"'In')"
			cn.Execute sql
			SendEmail "newsletteroptin", _
					  request.form("txtFirstName"), _
					  request.form("txtLastName"), _
					  request.form("txtPhoneNumber"), _
					  request.form("txtInEmail")
			SendEmail "newsletteroptinCustomerResponse", _
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
	elseif request.form("SubmitType") = "OptOut" then
		sql = "select * from OptInOut where Email = '" & replace(request.form("txtOutEmail"), "'", "''") & "' and " & _
													   "SystemName = '" & system & "' and " & _
													   "OptionInOut = 'Out'"
		'Response.Write sql
		'Response.End
		set rs = cn.Execute(sql)
		if rs.EOF then
			sql = "insert into OptInOut (Email, SystemName, OptionInOut) values ('" & replace(request.form("txtOutEmail"), "'", "''") & "', " & _
																			"'" & system & "', " & _
																			"'Out')"
			cn.Execute(sql)
			SendEmail "newsletteroptout", _
					  "", _
					  "", _
					  "", _
					  request.form("txtOutEmail")
			SendEmail "newsletteroptoutCustomerResponse", _
					  "", _
					  "", _
					  "", _
					  request.form("txtOutEmail")
		end if
	end if
	
%>
	                  	<table cellpadding=0 cellspacing=0 border=0 width="540">
	                  		<tr height=4><td></td></tr>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td ><span class="sectionheading">Your changes were successfully saved.  <br><br>
	                  			Please click <a href="default.asp">>>here<<</a> to return to the main page.</td></span>
	                  		</tr>
	                  	</table>
<%
end if
%>
                  </td>
                </tr>

              </TABLE>
<!--#include file="includes/footer.asp"-->
