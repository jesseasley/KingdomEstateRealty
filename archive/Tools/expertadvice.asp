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
		sql = "select * from expertadvice where pk = " & Request.QueryString("pk") 
		set rs = cn.Execute(sql)
		%>
		<form method="post" action="expertadvice.asp?guid=<%=Request.querystring("guid")%>" name="form3">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<table>
				<tr>
					<td>
						<span class="smallheading">Expert Advice</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ExpertAdvice" value="<%=rs("Advice")%>">
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
		<form method="post" action="expertadvice.asp?guid=<%=Request.querystring("guid")%>" name="form4">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<input type=hidden name=Submit value="Delete">
		</form>
		<%
	elseif Request.Form("Submit") = "Add New Expert Advice" then
		%>
		<form method="post" action="expertadvice.asp?guid=<%=Request.querystring("guid")%>" id=form2 name=form2>
			<table>
				<tr>
					<td>
						<span class="smallheading">Expert Advice</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ExpertAdvice" value="">
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Add Expert Advice">
						<a id=button href="javascript:form2.submit()">Add Expert Advice</a>
					</td>
				</tr>
			</table>
		</form>
		<%
	elseif Request.Form("Submit") = "Add Expert Advice" then
		if Request.Form("ExpertAdvice")="" then
			sExpertAdvice = "[Advice missing]"
		else
			sExpertAdvice = Request.Form("ExpertAdvice")
		end if
		sql = "insert into expertadvice (Advice) values (" & _
			  "'" & sExpertAdvice & "')"
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "ExpertAdvice.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Save" then
		if Request.Form("ExpertAdvice")="" then
			sExpertAdvice = "[Advice missing]"
		else
			sExpertAdvice = Request.Form("ExpertAdvice")
		end if
		sql = "update expertadvice set Advice= '" & sExpertAdvice & "' " & _
			  "where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "ExpertAdvice.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Delete" then
		sql = "delete from expertadvice where pk = " & Request.Form("pk")
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "ExpertAdvice.asp?guid=" & Request.querystring("guid")
	else
		sql = "select * from expertadvice order by Advice"
		set rs = cn.Execute(sql)
		%>
		<span class="pageheading">
			Available Expert Advice
		</span><br><br>
		<hr>
		<table><%
		do while not rs.EOF
			%>
				<tr>
					<td>
						<a class="text" href="ExpertAdvice.asp?guid=<%=Request.querystring("guid")%>&pk=<%=rs("pk")%>"><%=rs("Advice")%></a>
					</td>
				</tr>
			<%
			rs.MoveNext
		loop
		%>
		</table>
		<hr>
		<form method="post" action="expertadvice.asp?guid=<%=Request.querystring("guid")%>" id=form1 name=form1>
			<input type=hidden name="Submit" value="Add New Expert Advice">
			<a id=button href="javascript:form1.submit()">Add New Expert Advice</a>
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