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
<table width=100%><tr height=7><td /></tr><tr><td width=7 /><td>
<%
	if Request.QueryString("token") > "" then
		sql = "select * from notifications where ftoken = '" & Request.QueryString("token") & "'"
		set rs = cn.Execute(sql)
		%>
		<form method="post" action="token_manager.asp?guid=<%=Request.querystring("guid")%>" name="form3">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<table>
				<tr>
					<td>
						<span class="smallheading">Token</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="token" value="<%=rs("ftoken")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">From</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="from" value="<%=rs("ffrom")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">To</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="to" value="<%=rs("fto")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Subject</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="subject" value="<%=rs("fsubject")%>">
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Message</span>
					</td>
					<td>
						<textarea class="text" rows=10 cols=52 name="message"><%=rs("fmessage")%></textarea>
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
		<form method="post" action="token_manager.asp?guid=<%=Request.querystring("guid")%>" name="form4">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<input type=hidden name=Submit value="Delete">
		</form>
		<%
	elseif Request.Form("Submit") = "Add New Token" then
		%>
		<form method="post" action="token_manager.asp?guid=<%=Request.querystring("guid")%>" id=form2 name=form2>
			<table>
				<tr>
					<td>
						<span class="smallheading">Token</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="token" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">From</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="from" value="Jess Easley <jess@easley-realty.com>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">To</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="to" value="Jess Easley <jess@easley-realty.com>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Subject</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="subject" value="Message from easley-realty.com">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Message</span>
					</td>
					<td>
						<textarea class="text" rows=10 cols=52 name="message"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Add Token">
						<a id=button href="javascript:form2.submit()">Add Token</a>
					</td>
				</tr>
			</table>
		</form>
		<%
	elseif Request.Form("Submit") = "Add Token" then
		if Request.Form("token")="" then
			stoken = "[token missing]"
		else
			stoken = Request.Form("token")
		end if
		sql = "insert into notifications (ftoken, ffrom, fto, fsubject, fmessage) values (" & _
			  "'" & stoken & "', " & _
			  "'" & Request.Form("from") & "', " & _
			  "'" & Request.Form("to") & "', " & _
			  "'" & replace(Request.Form("subject"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("message"), "'", "''") & "')"
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "token_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Save" then
		if Request.Form("token")="" then
			stoken = "[token missing]"
		else
			stoken = Request.Form("token")
		end if
		sql = "update notifications set ftoken = '" & stoken & "', " & _
			  "ffrom = '" & Request.Form("from") & "', " & _
			  "fto = '" & Request.Form("to") & "', " & _
			  "fsubject = '" & replace(Request.Form("subject"), "'", "''") & "', " & _
			  "fmessage = '" & replace(Request.Form("message"), "'", "''") & "' " & _
			  "where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "token_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Delete" then
		sql = "delete from notifications where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "token_manager.asp?guid=" & Request.querystring("guid")
	else
		sql = "select * from notifications order by ftoken"
		set rs = cn.Execute(sql)
		%>
		<span class="pageheading">
			Available Tokens
		</span><br><br>
		<hr>
		<table><%
		do while not rs.EOF
			%>
				<tr>
					<td>
						<a class="text" href="token_manager.asp?guid=<%=Request.querystring("guid")%>&token=<%=rs("ftoken")%>"><%=rs("ftoken")%></a>
					</td>
				</tr>
			<%
			rs.MoveNext
		loop
		%>
		</table>
		<hr>
		<form method="post" action="token_manager.asp?guid=<%=Request.querystring("guid")%>" id=form1 name=form1>
			<input type=hidden name="Submit" value="Add New Token">
			<a id=button href="javascript:form1.submit()">Add New Token</a>
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