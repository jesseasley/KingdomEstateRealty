<!--#include file="../includes/connection.asp"-->    
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Buyer Interview Questions</title>
<link rel="stylesheet" type="text/css" href="file:///C:/Users/jess/Desktop/test%20site/css/new_page_1.css">
</head>

<body bgcolor="#E6E6E6">
<form action=buyer_interview.asp method=post>
<center>
<%
'easley-realty.com is at 71.244.10.35
set cn = server.createobject("adodb.connection")
Set rs = Server.CreateObject("ADODB.Recordset")
cn.Mode = 3
cn.open sConnection
set rs = cn.Execute("select question from questions where topic = 'Buyer Interview' order by sort_order")
questions = rs.GetRows
on error resume next
if Request.Form("submit") = "Submit" then
	for x = 0 to ubound(questions, 2)
		sql = "insert into interview (topic, question, answer, sort_order) values ('Buyer Interview', '" & _
              questions(0, x) & "', '" & replace(Request.Form("q" & x), "'", "''") & "', " & x & ")"
        if err then
        Response.Write sql & "<br><br><br>" & err.Description
        Response.End
        end if
		cn.Execute sql
	next
	Response.Redirect "http://" & Request.ServerVariables("HTTP_HOST") & "/" & "buyer_interview.asp"
end if
%>
<table border="0" cellpadding=0 cellspacing=0 id="table1" width=700>
	<tr>
		<td colspan="2" align=center>
		<h2 align="center">Buyer Interview Questions</h2></td>
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
		<% if x = 6 then %>
			<tr>
				<td colspan="2">
				<table border=1 cellpadding=1 cellspacing=1 width=100%><tr><td><center>
				SMILE!&nbsp; SPEAK CLEARLY!&nbsp; MAKE THE CALLER FEEL 
				IMPORTANT!&nbsp; LISTEN!<br>
				Respond before asking any questions: &quot;I see...&nbsp; Flag to help!... Uh 
				huh...&nbsp; Good idea!&quot;
				</center></td></tr></table>
				</td>
			</tr>
		<% end if %>
		<% if x = 15 then %>
			<tr>
				<td colspan="2">
				<table border=1 cellpadding=1 cellspacing=1 width=100%><tr><td><center>
				Is this a qualified prospect? If so, probe to obtain 
				expanded information.
				</center></td></tr></table>
				</td>
			</tr>
		<% end if %>
		<% if x = 18 then %>
			<tr>
				<td colspan="2">
				<table border=1 cellpadding=1 cellspacing=1 width=100%><tr><td><center>
				Before we meet, let me give you a phone number that you can call to be 
				pre-approved for a mortgage, <br>
				free of charge, within a matter of minutes.&nbsp; 
				<br>
				This way, you'll have a written confirmation when you find the right 
				home and <br>
				will be in the strongest negotiation position.&nbsp; <br>
				<br>
				The number is for Brian Tarbet at Centurion Mortgage and it's (817) 
				310-3454.
				</center></td></tr></table>
				</td>
			</tr>
		<% end if %>
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