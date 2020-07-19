<!--#include file="includes/header.asp"-->    
<!--#include file="includes/connection.asp"-->    
<!--#include file="includes/sendmail.asp"-->    

              <TABLE HEIGHT="100%" WIDTH="540" BORDER="0" CELLPADDING="0" CELLSPACING="0" class="interior">
                <TR> 
                  <TD VALIGN="top" ALIGN="left"> 
                  </td>
                </tr>
                <tr> 
                  <td valign=top> 
<%
	bValid = 0
	if request.form("SubmitType") = "salability_checklist" then
		'validate salability_checklist fields
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
<!--#include file="includes/validate-email.asp"-->    
<%
	if request.form("SubmitType") = "" or bValid > 0 then
%>
                  	<form method=post action="salability_checklist.asp" id=form1 name=form1>
	                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">

<%
	if request.form("SubmitType") > "" and bValid > 0 then
%>
	                  		<tr>
	                  			<td width=7>&nbsp;</td>
	                  			<td class="error" colspan=2><b>Some fields failed validation.  Please check below and make the necessary 
	                  			corrections.  When you're finished, press the Save button to save your changes.<br><br></td>
	                  		</tr>
<%
	end if
%>
	                  		<tr>
	                  			<td width=7>&nbsp;</td>
	                  			<td colspan=2 height="152">
	                  				<span class="pageheading">Salability Checklist</span><br><br>
									<span class="sectionheading">
										Thanks for your interest in our Salability Checklist.&nbsp; 
										It’s important to make sure that when you’re ready to sell your house, your house is ready too.&nbsp; 
										We just need a little contact information so we'll know where to send the Salability Checklist.&nbsp; 
										Please fill in the fields below and press Save.&nbsp;  
										We can usually respond within 24 hours.<br><br><br>
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
	                  			<td width=7>&nbsp;</td>
								<td colspan=2>
									<table cellpadding=0 cellspacing=0 border=0 width=383>
										<tr>
											<td align=right>
												<input type=hidden name=SubmitType value="salability_checklist">
												<a href="javascript:form1.submit()" id="button">Save</a>
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
<%
else
	system = "salability_checklist"
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	sql = "select * from OptInOut where FirstName = '" & replace(request.form("txtFirstName"), "'", "''") & "' and " & _
												   "LastName = '" & replace(request.form("txtLastName"), "'", "''") & "' and " & _
												   "Phone = '" & replace(request.form("txtPhoneNumber"), "'", "''") & "' and " & _
												   "Email = '" & replace(request.form("txtInEmail"), "'", "''") & "' and " & _
												   "SystemName = '" & system & "'"
	set rs = cn.Execute(sql)
	if rs.EOF then
		sql = "insert into OptInOut (FirstName, LastName, Phone, Email, SystemName) values ('" & replace(request.form("txtFirstName"), "'", "''") & "', " & _
																									"'" & replace(request.form("txtLastName"), "'", "''") & "', " & _
																									"'" & replace(request.form("txtPhoneNumber"), "'", "''") & "', " & _
																									"'" & replace(request.form("txtInEmail"), "'", "''") & "', " & _
																									"'" & system & "')"
		cn.Execute sql
		SendEmail "salabilitychecklist", _
				  request.form("txtFirstName"), _
				  request.form("txtLastName"), _
				  request.form("txtPhoneNumber"), _
				  request.form("txtInEmail")
		SendEmail "salabilitychecklistcustomerresponse1", _
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
	                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">
	                  		<tr height=4><td></td></tr>
	                  		<tr>
	                  			<td width=20>&nbsp;</td>
	                  			<td class="sectionheading">Your information was successfully saved.  <br><br>
	                  			Please click <a class="sectionheading" href="default.asp"><big><b>>>here<<</b></big></a> to return to the main page.</td>
	                  		</tr>
	                  	</table>
<%
end if
%>
                  </td>
                </tr>

              </TABLE>
<!--#include file="includes/footer.asp"-->
