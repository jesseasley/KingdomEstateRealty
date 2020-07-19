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
	if Request.QueryString("pk") > "" then
		sql = "select * from Areas where pk = " & Request.QueryString("pk") 
		set rs = cn.Execute(sql)
		%>
		<form method="post" action="Areas.asp?guid=<%=Request.querystring("guid")%>" name="form3">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<table>
				<tr>
					<td>
						<span class="smallheading">Area</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Area" value="<%=rs("Area")%>">
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
		<form method="post" action="Areas.asp?guid=<%=Request.querystring("guid")%>" name="form4">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<input type=hidden name=Submit value="Delete">
		</form>
		<%
	elseif Request.Form("Submit") = "Add New Area" then
		%>
		<form method="post" action="Areas.asp?guid=<%=Request.querystring("guid")%>" id=form2 name=form2>
			<table>
				<tr>
					<td>
						<span class="smallheading">Area</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Area" value="">
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Add Area">
						<a id=button href="javascript:form2.submit()">Add Area</a>
					</td>
				</tr>
			</table>
		</form>
		<%
	elseif Request.Form("Submit") = "Add Area" then
		if Request.Form("Area")="" then
			sArea = "[Area missing]"
		else
			sArea = Request.Form("Area")
		end if
		sql = "insert into Areas (Area) values (" & _
			  "'" & sArea & "')"
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "Areas.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Save" then
		if Request.Form("Area")="" then
			sArea = "[Area missing]"
		else
			sArea = Request.Form("Area")
		end if
		sql = "update Areas set Area = '" & sArea & "' " & _
			  "where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "Areas.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Delete" then
		sql = "delete from Areas where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "Areas.asp?guid=" & Request.querystring("guid")
	else
		sql = "select * from Areas order by Area"
		set rs = cn.Execute(sql)
		%>
		<span class="pageheading">
			Available Areas
		</span><br><br>
		<hr>
		<table><%
		do while not rs.EOF
			%>
				<tr>
					<td>
						<a class="text" href="Areas.asp?guid=<%=Request.querystring("guid")%>&pk=<%=rs("pk")%>"><%=rs("Area")%></a>
					</td>
				</tr>
			<%
			rs.MoveNext
		loop
		%>
		</table>
		<hr>
		<form method="post" action="Areas.asp?guid=<%=Request.querystring("guid")%>" id=form1 name=form1>
			<input type=hidden name="Submit" value="Add New Area">
			<a id=button href="javascript:form1.submit()">Add New Area</a>
			<br><a id=button href="admin.asp?guid=<%=Request.querystring("guid")%>">Menu</a>
		</form>
		<%
	end if
%>


</td></tr></table>
<%
else
	response.redirect "/realty/tools/admin.asp?guid=" & Request.querystring("guid")
end if%>