<!--#include file="../includes/advice-header.asp"-->    
<!--#include file="../includes/connection.asp"-->    
<%
	set lcn = server.createobject("adodb.connection")
	lcn.Mode = 3
	lcn.open sConnection
%>
<!--#include file="../Calendar/connection.asp"-->    
<%
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "select * from logins where guid = '" & Request.querystring("guid") & "'"
	set rs = lcn.execute(sql)
	
	if rs("loggedin") and rs("enabled") then
%>
<script type="text/javascript" src="inc/popupWindow.js"></script>
<SCRIPT>
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
<table width=100%><tr height=7><td /></tr><tr><td width=7 /><td>
<%
	if Request.QueryString("pk") > "" then
		sql = "select * from main where pk = " & Request.QueryString("pk") 
		set rs = cn.Execute(sql)
		%>
		<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>" name="form3">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<table>
				<tr>
					<td>
						<span class="smallheading">Calendar Name</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="cal_name" value="<%=rs("cal_name")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Title</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Title" value="<%=rs("Title")%>">
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Private</span>
					</td>
					<td>
						<input class="text" type="checkbox" <%if rs("private") then%> value="on" checked <%end if%> name="Private">
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Active</span>
					</td>
					<td>
						<input class="text" type="checkbox" <%if rs("Active") then%> value="on" checked <%end if%> name="Active">
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Save">
						<a id=button href="javascript:form4.submit()">Delete</a>
						<a id=button href="javascript:form3.submit()">Save</a>
					</td>
				</tr>
			</table>
		</form>
		<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>" name="form4">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<input type=hidden name=Submit value="Delete">
		</form>
		<%
	elseif Request.Form("Submit") = "Add New Calendar" then
		set rs = cn.execute("select cal_name from main")
		vCals = rs.getrows()
		%>
		<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>" id=form2 name=form2>
			<table>
				<tr>
					<td>
						<span class="smallheading">Calendar Name</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="cal_name" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Title</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Title" value="">
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Private</span>
					</td>
					<td>
						<input class="text" type="checkbox" checked name="Private">
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Active</span>
					</td>
					<td>
						<input class="text" type="checkbox" checked name="Active">
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Add Calendar">
						<a id=button href="javascript:form2.submit()">Add Calendar</a>
					</td>
				</tr>
				<tr>
					<td colspan=2 class="text"><br><br><br><br><br><hr></td>
				</tr>
				<tr>
					<td colspan=2 class="smallheading" align=center>Copying Calendars</td>
				</tr>
				<tr>
					<td colspan=2 class="text"><hr></td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Copy Calendar</span>
					</td>
					<td>
						<select class="text" size="1" name="CopyCalendar">
							<option class="text" value="" selected></option>
							<%for x = 0 to ubound(vCals, 2)%>
								<option value="<%=vCals(0, x)%>"><%=vCals(0, x)%></option>
							<%next%>
						</select>						
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Execution Date</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ExecutionDate" value="">
						<a href="javascript:;" 
							onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=ExecutionDate&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no', 'form3')">
							<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" height=18 width=29 border=0 /></a>
					</td>
				</tr>
				<tr>
					<td colspan=2 class="text"><hr></td>
				</tr>
			</table>
		</form>
		<%
	elseif Request.Form("Submit") = "Add Calendar" then
		sCalName = replace(Request.Form("cal_name"), "'", "''")
		sql = "insert into main (cal_name, title, private, active) values (" & _
			  "'" & sCalName & "', " & _
			  "'" & replace(Request.Form("title"), "'", "''") & "', " & _
			  (request.form("Private") = "on") & ", " & (request.form("Active") = "on") & ")"
		'Response.Write sql
		'Response.End
		cn.Execute sql
		if request.form("ExecutionDate") > "" and request.form("CopyCalendar") > "" then
			sql = "select * from calendar where cal_name = '" & request.form("CopyCalendar") & "' order by eventdate"
			set rs = cn.execute(sql)
			dExDate = rs("EventDate")
			sql = "insert into calendar (cal_name,subject,eventdate,active) values (" & _
				"'" & sCalName & "', " & _
				"'" & rs("subject") & "', " & _
				"'" & request.form("ExecutionDate") & "', true)"
			cn.execute sql
			rs.movenext
			do while not rs.eof
				idatediff = datediff("d", dExDate, rs("eventdate"))
				dnewdate = dateadd("d", idatediff, request.form("ExecutionDate"))
				sql = "insert into calendar (cal_name,subject,eventdate,active) values (" & _
					"'" & sCalName & "', " & _
					"'" & rs("subject") & "', " & _
					"'" & dnewdate & "', true)"
				cn.execute sql
				rs.movenext
			loop
		end if
		Response.Redirect "calendar_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Save" then
		sql = "update main set " & _
			  "cal_name= '" & replace(Request.Form("cal_name"), "'", "''") & "', " & _
			  "title= '" & replace(Request.Form("title"), "'", "''") & "', " & _
			  "Private= " & (request.form("Private") = "on") & ", " & _
			  "Active= " & (request.form("Active") = "on") & _
			  " where pk = " & Request.Form("pk")
'		Response.Write sql
'		Response.End
		cn.Execute sql
		Response.Redirect "calendar_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Delete" then
		sql = "delete from main where pk = " & Request.Form("pk")
'		Response.Write (request.form("active") = "on")
'		Response.End
		cn.Execute sql
		Response.Redirect "calendar_manager.asp?guid=" & Request.querystring("guid")
	else
		
		sql = "select * from main order by active, title"
		set rs = cn.Execute(sql)
		%>
		<span class="pageheading">
			Available Calendars
		</span><br><br>
		<hr>
		<table><%
		do while not rs.EOF
			%>
				<tr>
					<td>
						<%if rs("active") then%>
							<a class="text" href="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&pk=<%=rs("pk")%>"><%=rs("Title")%> (<%=rs("cal_name")%>)</a>
							&nbsp;&nbsp;&nbsp;
							<a class="text" href="../calendar/default.asp?guid=<%=Request.querystring("guid")%>&cal=<%=rs("cal_name")%>" target=_blank>Link</a>
						<%else%>
							<a class="greytext" href="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&pk=<%=rs("pk")%>"><%=rs("Title")%> (<%=rs("cal_name")%>)</a>
							&nbsp;&nbsp;&nbsp;
							<a class="greytext" href="../calendar/default.asp?guid=<%=Request.querystring("guid")%>&cal=<%=rs("cal_name")%>" target=_blank>Link</a>
						<%end if%>
					</td>
				</tr>
			<%
			rs.MoveNext
		loop
		%>
		</table>
		<hr>
		<form method="post" action="calendar_manager.asp?guid=<%=Request.querystring("guid")%>" id=form1 name=form1>
			<input type=hidden name="Submit" value="Add New Calendar">
			<a id=button href="javascript:form1.submit()">Add New Calendar</a>
			<br><a id=button href="admin.asp?guid=<%=Request.querystring("guid")%>">Menu</a>
		</form>
		<%
	end if
%>


</td></tr></table>
<%
else
	response.redirect "admin.asp?guid=" & Request.querystring("guid")
end if%>