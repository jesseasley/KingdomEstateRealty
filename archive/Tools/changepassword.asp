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
	if request.form("Submit") = "Save" then
		if request.form("newpassword") = request.form("newpassword2") then
			sql = "select password from logins where pk = " & session("UserPk")
			set rs = cn.execute(sql)
			if not rs.eof then
				if rs("password") = request.form("oldpassword") then
					sql = "update logins set [password] = '" & _
						replace(request.form("newpassword"), "'", "''") & "' where pk = " & session("UserPk")
	'				response.write sql
	'				response.end
					cn.execute sql
					response.redirect "admin.asp?guid=" & Request.querystring("guid")
				end if
			end if
		end if
	end if
%>
	<form method="post" action="changepassword.asp?guid=<%=Request.querystring("guid")%>" name="form3">
		<table>
			<tr>
				<td>
					<span class="smallheading">Old Password</span>
				</td>
				<td>
					<input class="text" type="text" size=72 name="oldpassword" value="">
				</td>
			</tr>
			<tr>
				<td>
					<span class="smallheading">New Password</span>
				</td>
				<td>
					<input class="text" type="text" size=72 name="newpassword" value="">
				</td>
			</tr>
			<tr>
				<td>
					<span class="smallheading">Re-Type New Password</span>
				</td>
				<td>
					<input class="text" type="text" size=72 name="newpassword2" value="">
				</td>
			</tr>
			<tr>
				<td colspan=2 align=right>
					<input type=hidden name=Submit value="Save">
					<a id=button href="javascript:form3.submit()">Save</a>
				</td>
			</tr>
		</table>
	</form>

</td></tr></table>
<%
else
	response.redirect "admin.asp?guid=" & Request.querystring("guid")
end if%>