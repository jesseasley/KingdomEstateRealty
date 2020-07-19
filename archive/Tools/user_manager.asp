<!--#include file="../includes/connection.asp"-->    
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	sql = "select * from logins where guid = '" & Request.querystring("guid") & "'"
	set rs = cn.execute(sql)
	
	if rs("loggedin") and rs("enabled") then
%>
<!--#include file="../includes/advice-header.asp"-->    
<!--#include file="../calendar/connection.asp"-->    
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	set rs = cn.execute("select cal_name from main")
	vCals = rs.getrows()
'	response.write ubound(vCals, 2)
'	response.end
	
	rs.close
	cn.close
%>
<!--#include file="../includes/connection.asp"-->    
<table width=100%><tr height=7><td /></tr><tr><td width=7 /><td>
<%
	cn.open sConnection
	if Request.QueryString("pk") > "" then
		sql = "select * from logins where pk = " & Request.QueryString("pk") 
		set rs = cn.Execute(sql)
		if isnull(rs("calendar")) then
			vCals2 = split("")
		else
			vCals2 = split(rs("calendar"), ",")
		end if
		%>
		<form method="post" action="user_manager.asp?guid=<%=Request.querystring("guid")%>" name="form3">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<table>
				<tr>
					<td>
						<span class="smallheading">User Name</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="username" value="<%=rs("username")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Password</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Password" value="<%=rs("Password")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Level</span>
					</td>
					<td>
						<select class="text" size="1" name="Level">
							<option <%if rs("level")="admin" then%> selected <%end if%> value="admin">Admin</option>
							<option <%if rs("level")="calendar" then%> selected <%end if%> value="calendar">Calendar</option>
						</select>						
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading"><br>Calendars</span>
					</td>
					<td>
						<select class="text" size="8" multiple name="Calendar">
							<%for x = 0 to ubound(vCals, 2)%>
								<%selected = false
								for y = 0 to ubound(vCals2)
									if trim(vCals2(y)) = vCals(0, x) then
										selected = true
									end if
								next%>
								<option <%if selected=true then%> selected <%end if%> value="<%=vCals(0, x)%>"><%=vCals(0, x)%></option>
							<%next%>
						</select>						
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Enabled</span>
					</td>
					<td>
						<input type=checkbox name=chkEnabled value="on" <% if rs("enabled") then %> checked <%end if%>>						
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
		<form method="post" action="user_manager.asp?guid=<%=Request.querystring("guid")%>" name="form4">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<input type=hidden name=Submit value="Delete">
		</form>
		<%
	elseif Request.Form("Submit") = "Add New User" then
		%>
		<form method="post" action="user_manager.asp?guid=<%=Request.querystring("guid")%>" id=form2 name=form2>
			<table>
				<tr>
					<td>
						<span class="smallheading">User Name</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="username" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Password</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Password" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Level</span>
					</td>
					<td>
						<select class="text" size="1" name="Level">
							<option value="admin">Admin</option>
							<option selected value="calendar">Calendar</option>
						</select>						
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Calendar</span>
					</td>
					<td>
						<select class="text" size="8" multiple name="Calendar">
							<%for x = 0 to ubound(vCals, 2)%>
								<option value="<%=vCals(0, x)%>"><%=vCals(0, x)%></option>
							<%next%>
						</select>						
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Enabled</span>
					</td>
					<td>
						<input type=checkbox name=chkEnabled value="on">						
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Add User">
						<a id=button href="javascript:form2.submit()">Add User</a>
					</td>
				</tr>
			</table>
		</form>
		<%
	elseif Request.Form("Submit") = "Add User" then
        Set TypeLib = CreateObject("Scriptlet.TypeLib") 
        GetGuid = Left(CStr(TypeLib.Guid), 38) 
        Set TypeLib = Nothing 
        GetGuid = mid(GetGuid, 2)
        GetGuid = left(GetGuid, len(GetGuid) - 1)
        if request.form("chkEnabled") = "on" then 
        	benabled=true
        else
        	benabled=false
        end if

		sql = "insert into logins ([username], [password], [level], [calendar], [guid], [loggedin], [enabled]) values (" & _
			  "'" & replace(Request.Form("username"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("password"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("level"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("calendar"), "'", "''") & "', '" & GetGuid & "', false, " & benabled & ")"
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "user_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Save" then
        if request.form("chkEnabled") = "on" then 
        	benabled=true
        else
        	benabled=false
        end if
		sql = "update logins set " & _
			  "[username] = '" & replace(Request.Form("username"), "'", "''") & "', " & _
			  "[password] = '" & replace(Request.Form("password"), "'", "''") & "', " & _
			  "[level] = '" & replace(Request.Form("level"), "'", "''") & "', " & _
			  "[calendar] = '" & replace(Request.Form("calendar"), "'", "''") & "', " & _
			  "[enabled] = " & benabled & _
			  " where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "user_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Delete" then
		sql = "delete from logins where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "user_manager.asp?guid=" & Request.querystring("guid")
	else
		sql = "select * from logins order by [username]"
		set rs = cn.Execute(sql)
		%>
		<span class="pageheading">
			Available Users
		</span><br><br>
		<hr>
		<table><%
		do while not rs.EOF
			%>
				<tr>
					<td>
						<a class="text" href="user_manager.asp?guid=<%=Request.querystring("guid")%>&pk=<%=rs("pk")%>"><%=rs("username")%></a>
					</td>
				</tr>
			<%
			rs.MoveNext
		loop
		%>
		</table>
		<hr>
		<form method="post" action="user_manager.asp?guid=<%=Request.querystring("guid")%>" id=form1 name=form1>
			<input type=hidden name="Submit" value="Add New User">
			<a id=button href="javascript:form1.submit()">Add New User</a>
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