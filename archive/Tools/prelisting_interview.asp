<!--#include file="../includes/connection.asp"-->    
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Pre-Listing Interview Questions</title>
<link rel="stylesheet" type="text/css" href="file:///C:/Users/jess/Desktop/test%20site/css/new_page_1.css">
</head>

<body bgcolor="#E6E6E6">
<form action=prelisting_interview.asp method=post>
<center>
<%
'easley-realty.com is at 71.244.10.35
set cn = server.createobject("adodb.connection")
Set rs = Server.CreateObject("ADODB.Recordset")
cn.Mode = 3
cn.open sConnection
set rs = cn.Execute("select question from questions where topic = 'PreListing Interview' order by sort_order")
questions = rs.GetRows
on error resume next
if Request.Form("submit") = "Submit" then
	for x = 0 to ubound(questions, 2)
		sql = "insert into interview (topic, question, answer, sort_order) values ('PreListing Interview', '" & _
              questions(0, x) & "', '" & replace(Request.Form("q" & x), "'", "''") & "', " & x & ")"
        if err then
        Response.Write sql & "<br><br><br>" & err.Description
        Response.End
        end if
		cn.Execute sql
	next
	Response.Redirect "http://" & Request.ServerVariables("HTTP_HOST") & "/" & "prelisting_interview.asp"
end if
%>
<table border="0" cellpadding=0 cellspacing=0 id="table1" width=700>
	<tr>
		<td colspan="2" align=center>
		<h2 align="center">Pre-Listing Interview Questions</h2></td>
	</tr>
	<tr><td colspan=2><hr></td></tr>
	<% 
	color = "off"
	for x = 0 to ubound(questions, 2) 
	if color = "on" then
		color = "off"
	else
		color = "on"
	end if
	%>
		<tr>
			<td <% if color = "on" then %>bgcolor=#F2F2F2 <% end if %>><%=questions(0, x)%></td>
			<td><textarea rows="3" cols="41" name=q<%=x%>></textarea></td>
		</tr>
	<% next %>
	<tr bgcolor=#F2F2F2>
		<td><br>&nbsp;</td>
		<td valign=bottom><input type=submit name=submit value="Submit"></td>
	</tr>
</table>
</center>
</form>
</body>

</html>