<!--#include file="../includes/sendmail.asp"-->    
<!--#include file="../includes/connection.asp"-->    
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection

	if Request.Form("login") = "login" then
		sql = "select * from logins where [username] = '" & Request.Form("username") & _
		      "' and [password] = '" & Request.Form("password") & "'"
		set rs = cn.execute(sql)
'		response.write rs.eof
'		response.end	
		if not rs.eof then
			guid = rs("guid")
			sql = "update logins set loggedin=true where guid='" & guid & "'"
			cn.execute sql
			level = rs("level")
			username = rs("username")
			session("UserPk") = rs("pk")
			sLevel = rs("level")
			sCalendar = rs("calendar")

			sendemail "adminlogin", "", "", "", ""
			if sLevel = "calendar" then
				vCals = split(sCalendar, ",")
				response.redirect "/realty/calendar/default.asp?cal=" & vCals(0) & "&guid=" & guid
			else
				Response.redirect "admin.asp?guid=" & guid
			end if
		end if
	end if
	if request.querystring("logout") = "true" then
		sql = "update logins set loggedin = false where guid = '" & Request.querystring("guid") & "'"
		cn.execute sql
		Response.redirect "admin.asp?guid=" & Request.querystring("guid")
	end if

	sql = "select * from logins where guid = '" & Request.querystring("guid") & "'"
	set rs = cn.execute(sql)
	bloggedin = false
	if not rs.eof then
		if rs("loggedin") and rs("enabled") then
			bloggedin = true
		end if
	end if
	
	if bloggedin then
'		if request.cookies("path") > "" then
'			sPath = request.cookies("path")
'			response.cookies("path") = ""
'			response.redirect sPath
'		end if
%>
<!--#include file="../includes/advice-header.asp"-->    
	<table cellpadding=0 cellspacing=0 border=0 width="540">
		<tr>
			<td width=7>
			</td>
			<td valign=top>	
				<span class="pageheading">Available Forms</span><br><br>
				<%if rs("level") = "admin" then%>
					<a class="text" href="listing_manager.asp?guid=<%=Request.querystring("guid")%>">Listing Manager</a><br>
					<a class="text" href="Specialization.asp?guid=<%=Request.querystring("guid")%>">Specialization</a><br>
					<a class="text" href="areas.asp?guid=<%=Request.querystring("guid")%>">"Specializing In" Areas</a><br>
					<a class="text" href="expertadvice.asp?guid=<%=Request.querystring("guid")%>">Expert Advice Areas</a><br>
					<a class="text" href="calendar_manager.asp?guid=<%=Request.querystring("guid")%>">Calendar Manager</a><br>
					<a class="text" href="article_manager.asp?guid=<%=Request.querystring("guid")%>">Article Manager</a><br><br>
					<a class="text" href="Forum_Response.asp?guid=<%=Request.querystring("guid")%>">Forum Response</a><br>
					<a class="text" href="surveylist.asp?guid=<%=Request.querystring("guid")%>">Surveys</a><br>
					<a class="text" href="registered.asp?guid=<%=Request.querystring("guid")%>">Who's Registered?</a><br>
					<a class="text" href="token_manager.asp?guid=<%=Request.querystring("guid")%>">Email Token Management</a><br><br>
					<a class="text" href="page_tracking.asp?guid=<%=Request.querystring("guid")%>">Page Tracking</a><br><br><br><br>
				<%end if%>
			</td>
			<td valign=top align=right>
				<span class="pageheading">Misc</span><br><br>
				<%if rs("level") = "admin" then%>
					<a class="text" href="../the_indian_trader.htm">The Indian Trader</a><br>
					<a class="text" href="buyer_interview.asp">Buyer Interview</a><br>
					<a class="text" href="prelisting_interview.asp">Pre-Listing Interview</a><br>
					<a class="text" href="../salability_checklist.asp">Salability Checklist</a><br><br><br>
					<a class="text" href="changepassword.asp?guid=<%=Request.querystring("guid")%>">Change Password</a><br>
					<a class="text" href="user_manager.asp?guid=<%=Request.querystring("guid")%>">User Manager</a><br>
				<%end if%>
				<a class="text" href="admin.asp?logout=true&guid=<%=Request.querystring("guid")%>">Log Out</a>
			</td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td colspan=2>
				<table border=1 cellpadding=0 cellspacing=0 width=100%>
					<tr>
						<td>Logged In</td>
						<td>Level</td>
						<td>Username</td>
						<td>pk</td>
						<td>Calendar</td>
						<td>Enabled</td>
					</tr>
					<tr>
						<td><%=rs("Loggedin")%>&nbsp;</td>
						<td><%=rs("level")%>&nbsp;</td>
						<td><%=rs("username")%>&nbsp;</td>
						<td><%=session("UserPk")%>&nbsp;</td>
						<td><%=rs("calendar")%>&nbsp;</td>
						<td><%=rs("enabled")%>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<%else%>
<!--#include file="../includes/advice-header.asp"-->    
	<form method=post name=frm action="admin.asp">
	<table cellpadding=0 cellspacing=0 border=0 width="540">
		<tr>
			<td width=7>
			</td>
			<td>
				<table cellpadding=0 cellspacing=0 border=0 width="293">
					<tr>
						<td colspan=2><span class="pageheading">Log In</span><br><br></td>
					</tr>
					<tr>
						<td><span class="smallheading">User Name:</span></td>
						<td align="right"><input type="text" class="text" name="username" value=""></td>
					</tr>
					<tr>
						<td><span class="smallheading">Password:</span></td>
						<td align="right"><input type="password" class="text" name="password" value=""></td>
					</tr>
					<tr>
						<input type="hidden" value="login" name="login">
						<td colspan=2 align="right"><br><a id=button href="javascript:frm.submit()">Log In</a>
					</tr>
				</table>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
		<% if not rs.eof then %>
		<tr>
			<td colspan=2>
				<table border=1 cellpadding=0 cellspacing=0 width=100%>
					<tr>
						<td>Logged In</td>
						<td>Level</td>
						<td>Username</td>
						<td>pk</td>
						<td>Calendar</td>
						<td>Enabled</td>
					</tr>
					<tr>
						<td><%=rs("Loggedin")%>&nbsp;</td>
						<td><%=rs("level")%>&nbsp;</td>
						<td><%=rs("username")%>&nbsp;</td>
						<td><%=session("UserPk")%>&nbsp;</td>
						<td><%=rs("calendar")%>&nbsp;</td>
						<td><%=rs("enabled")%>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<% end if %>
	</table>
	<script>document.all.username.focus();</script>
	</form>
<%end if%>