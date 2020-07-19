<!--#include file="../includes/connection.asp"-->    
<%
Set rs = Server.CreateObject("ADODB.Recordset")
set lcn = server.createobject("adodb.connection")
lcn.Mode = 3
lcn.open sConnection
sql = "select * from logins where guid = '" & Request.querystring("guid") & "'"
set rs = lcn.execute(sql)

if rs("loggedin") and rs("enabled") then

	vCals2 = split(rs("calendar"), ",")
	cal_found = false
	for x = 0 to ubound(vCals2) 
		if trim(vCals2(x)) = request.querystring("cal") then
			cal_found = true
		end if
	next
	validcalendar = false
	if rs("level") = "admin" then
		validcalendar = true
	else
		if rs("level") = "calendar" then
			if cal_found then
				validcalendar = true
			end if
		end if
	end if
	if  rs("Loggedin") = "True" and validcalendar then
		%>
		<!--#include file="connection.asp"-->    
		<%
		if request.querystring("cal") = "" then
			response.write "Must specify calendar name"
		else
			set cn = server.createobject("adodb.connection")
			cn.Mode = 3
			cn.open sConnection
			sql = "select * from main where cal_name='" & request.querystring("cal") & "'"
			set rs = cn.Execute(sql)
			if not rs.eof then%>
				<title><%=rs("title")%></title>
				<!--#include file="../includes/advice-header.asp"-->    
				<script type="text/javascript" src="inc/popupWindow.js"></script>
				<SCRIPT>
				function AddShowing(vform)
				{
					form2.Subject.value = 'Showing';
					form2.submit();
				}
				function CheckForm(vform)
				{
					if (vform=='form3')
					{
						if (isDate(form3.EventDate.value))
							form3.submit();
						else
							alert('Please correct the Event Date before saving.');
					}
					if (vform=='form2')
					{
						if (isDate(form2.EventDate.value))
							form2.submit();
						else
							alert('Please correct the Event Date before saving.');
					}
				}
				function isDate(dateStr) {
	
					var datePat = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
					var matchArray = dateStr.match(datePat); // is the format ok?
					
					if (matchArray == null) {
						return false;
					}
					
					month = matchArray[1]; // p@rse date into variables
					day = matchArray[3];
					year = matchArray[5];
					
					if (month < 1 || month > 12) { // check month range
						return false;
					}
					
					if (day < 1 || day > 31) {
						return false;
					}
					
					if ((month==4 || month==6 || month==9 || month==11) && day==31) {
						return false;
					}
					
					if (month == 2) { // check for february 29th
						var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
						if (day > 29 || (day==29 && !isleap)) {
							return false;
						}
					}
					return true; // date is valid
				}
	
				</SCRIPT>
			<%end if
			if rs("Active") = false then
				%>
				<table border="0" cellspacing="0" cellpadding="0" width="540">
					<tr>
						<td>
							<span class='text'>
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								Sorry, this calendar is inactive.
								<br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								If you feel you shouldn't have gotten this message,
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								please contact Jess using the email link on the left side bar. 
							</span>
						</td>
					</tr>
				</table>
				<%
			else
				%>
					<table width=700 border=0><tr height=7><td /></tr><tr><td width=7 /><td>
					<!--#include file="connection.asp"-->    
					<%
						set cn = server.createobject("adodb.connection")
						cn.Mode = 3
						cn.open sConnection
					%>
					<%
						if Request.QueryString("pk") > "" then
							sql = "select * from calendar where cal_name='" & request.querystring("cal") & "' and id = " & Request.QueryString("pk") 
							set rs = cn.Execute(sql)
							%>
							<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&date=<%=request.querystring("date")%>" name="form3">
								<input type="hidden" name="pk" value="<%=rs("id")%>">
								<table border=0>
									<tr>
										<td>
											<span class="smallheading">Subject</span>
										</td>
										<td>
											<input class="text" type="text" size=50 name="Subject" value="<%=rs("Subject")%>">
										</td>
										<td class="small">
											The text that appears on the calendar.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Event Date</span>
										</td>
										<td>
											<input class="text" type="text" size=50 name="EventDate" value="<%=rs("EventDate")%>">
										</td>
										<td class="small">
											<a href="javascript:;" 
												onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=EventDate&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no', 'form3')">
												<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" height=18 width=29 border=0 /></a>
											&nbsp;&nbsp;Try the popup calendar.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Repeats</span>
										</td>
										<td>
											<input class="text" type="checkbox" <%if rs("Repeats") then%> value="on" checked <%end if%> name="Repeats">
										</td>
										<td class="small">
											Must be flagged to indicate a repeating event.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Anniversary</span>
										</td>
										<td>
											<input class="text" type="checkbox" <%if rs("Anniversary") then%> value="on" checked <%end if%> name="Anniversary">
										</td>
										<td class="small">
											Must be flagged for anniversary specific gift suggestions to show.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Active</span>
										</td>
										<td>
											<input class="text" type="checkbox" <%if rs("Active") then%> value="on" checked <%end if%> name="Active">
										</td>
										<td class="small">
											Only active events show on the calendar.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Complete</span>
										</td>
										<td>
											<input class="text" type="checkbox" <%if rs("Complete") then%> value="on" checked <%end if%> name="Complete">
										</td>
										<td class="small">
											Completed events show with a strike-through font.
										</td>
									</tr>
									<tr>
										<td colspan=2 align=right>
											<input type=hidden name=Submit value="Save">
											<a id=button href="javascript:form4.submit()">Delete</a>
											<a id=button href="javascript:CheckForm('form3')">Save</a>
										</td>
									</tr>
								</table>
							</form>
							<script>
							document.all.Subject.focus();
							document.all.Subject.select();
							</script>
							<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&date=<%=request.querystring("date")%>" name="form4">
								<input type="hidden" name="pk" value="<%=rs("id")%>">
								<input type=hidden name=Submit value="Delete">
							</form>
							<%
						elseif Request.Form("Submit") = "Add New Event" or request.querystring("method") = "add" then
							%>
							<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&date=<%=request.querystring("date")%>" id=form2 name=form2>
								<table>
									<tr>
										<td>
											<span class="smallheading">Subject</span>
										</td>
										<td>
											<input class="text" type="text" size=50 name="Subject" value="">
										</td>
										<td class="small">
											The text that appears on the calendar.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Event Date</span>
										</td>
										<td>
											<%
												if request.querystring("method") = "add" then
													sDate = request.querystring("date")
												else
													sDate = ""
												end if
											%>
											<input class="text" type="text" size=50 name="EventDate" value="<%=sDate%>">
										</td>
										<td class="small">
											<a href="javascript:;" 
												onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=EventDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no', 'form2')">
												<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" height=18 width=29 border=0 /></a>
											&nbsp;&nbsp;Try the popup calendar.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Repeats</span>
										</td>
										<td>
											<input class="text" type="checkbox" name="Repeats">
										</td>
										<td class="small">
											Must be flagged to indicate a repeating event.
										</td>
									</tr>
			
									<tr>
										<td>
											<span class="smallheading">Anniversary</span>
										</td>
										<td>
											<input class="text" type="checkbox" name="Anniversary">
										</td>
										<td class="small">
											Must be flagged for anniversary specific gift suggestions to show.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Active</span>
										</td>
										<td>
											<input class="text" checked type="checkbox" name="Active">
										</td>
										<td class="small">
											Only active events show on the calendar.
										</td>
									</tr>
									<tr>
										<td>
											<span class="smallheading">Complete</span>
										</td>
										<td>
											<input class="text" type="checkbox" name="Complete">
										</td>
										<td class="small">
											Completed events show with a strike-through font.
										</td>
									</tr>				
									<tr>
										<td colspan=2 align=right>
											<input type=hidden name=Submit value="Add Event">
											<a id=button href="javascript:AddShowing('form2')">Add Showing</a>
											<a id=button href="javascript:CheckForm('form2')">Add Event</a>
										</td>
									</tr>
								</table>
							</form>
							<script>
							document.all.Subject.focus();
							document.all.Subject.select();
							</script>
							<%
						elseif Request.Form("Submit") = "Add Event" then
							sql = "insert into calendar (cal_name, Subject, EventDate, Repeats" & _
							      ", Anniversary, Active, Complete) values (" & _
								  "'" & Request.querystring("cal") & "', " & _
								  "'" & replace(Request.Form("Subject"), "'", "''") & "', " & _
								  "'" & replace(Request.Form("EventDate"), "'", "''") & "', " & _
								  (request.form("Repeats") = "on") & ", " & _
								  (request.form("Anniversary") = "on") & ", " & _
								  (request.form("Active") = "on") & ", " & _
								  (request.form("Complete") = "on") & ")"
							'Response.Write sql
							'Response.End
							cn.Execute sql
							if request.querystring("date") > "" then
								response.redirect "default.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal") & "&date=" & request.querystring("date")
							else
								Response.Redirect "calendar_manager.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal")
							end if
						elseif Request.Form("Submit") = "Save" then
							sql = "update calendar set " & _
								  "Subject= '" & replace(Request.Form("Subject"), "'", "''") & "', " & _
								  "EventDate= '" & replace(Request.Form("EventDate"), "'", "''") & "', " & _
								  "Repeats= " & (request.form("Repeats") = "on") & ", " & _
								  "Anniversary= " & (request.form("Anniversary") = "on") & ", " & _
								  "Active= " & (request.form("Active") = "on") & ", " & _
								  "Complete= " & (request.form("Complete") = "on") & _
								  " where id = " & Request.Form("pk")
							'Response.Write request.querystring("date")
							'Response.End
							cn.Execute sql
							if request.querystring("date") > "" then
								response.redirect "default.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal") & "&date=" & request.querystring("date")
							else
								Response.Redirect "calendar_manager.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal")
							end if
						elseif Request.Form("Submit") = "Delete" then
							sql = "delete from calendar where id = " & Request.Form("pk")
					'		Response.Write (request.form("active") = "on")
					'		Response.End
							cn.Execute sql
							if request.querystring("date") > "" then
								response.redirect "default.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal") & "&date=" & request.querystring("date")
							else
								Response.Redirect "calendar_manager.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal")
							end if
						else
							sql = "select * from calendar where cal_name = '" & request.querystring("cal") & "' order by EventDate desc, Subject desc"
					'response.write sql
					'response.end
							set rs = cn.Execute(sql)
							%>
							<span class="pageheading">
								Available Events
							</span><br><br>
							<hr>
							<table width=540><%
							do while not rs.EOF
								%>
									<tr>
										<td>
											<%
											if rs("active") then
												if rs("complete") then
													sStyle = "strikethroughtext"
												else
													sStyle = "text"
												end if
											else
												if rs("complete") then
													sStyle = "strikethroughgreytext"
												else
													sStyle = "greytext"
												end if
											end if
											%>
												<a class="<%=sStyle%>" href="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&pk=<%=rs("id")%>">
													<%=rs("EventDate") & "-" & rs("Subject")%>
												</a>
										</td>
									</tr>
								<%
								rs.MoveNext
							loop
							%>
							</table>
							<hr>
							<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>" id=form1 name=form1>
								<input type=hidden name="Submit" value="Add New Event">
								<a id=button href="javascript:form1.submit()">Add New Event</a>
								<a id=button href="default.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&date=<%=date()%>">Show Calendar</a>
							</form>
							<%
						end if
				%>
				</td></tr></table>
				<%
			end if
		end if
	else
		response.cookies("path") = request.servervariables("url") & "?" & request.servervariables("query_string")
		%>
	<table>
			<tr>
				<td colspan=2>
					<table border=1 cellpadding=0 cellspacing=0 width=100%>
						<tr>
							<td>Logged In</td>
							<td>Level</td>
							<td>Username</td>
							<td>pk</td>
							<td>Calendar</td>
						</tr>
						<tr>
							<td><%=rs("Loggedin")%>&nbsp;</td>
							<td><%=rs("level")%>&nbsp;</td>
							<td><%=rs("username")%>&nbsp;</td>
							<td><%=session("UserPk")%>&nbsp;</td>
							<td><%=rs("calendar")%>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
			<%
	'	response.redirect "../tools/admin.asp?guid=" & Request.querystring("guid")
	end if
else
	response.redirect "../tools/admin.asp?guid=" & Request.querystring("guid")
end if%>