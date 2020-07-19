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
<table border=0 cellspacing=0 cellpadding=0><tr><td width=7></td><td>
<span class="pageheading">Currently Registered</span><br><br>
<%
if request.querystring("delpk") > "" then
	sql = "delete from optinout where pk = " & request.querystring("delpk")
	cn.execute sql
	response.redirect "registered.asp?guid=" & Request.querystring("guid")
end if
set rs = cn.execute("select * from optinout order by timestamp desc")

Response.Write "<table cellpadding=0 cellspacing=0 border=1>"
Response.Write "<tr>"
Response.Write "<td class='smallheading'>First Name</td>"
Response.Write "<td class='smallheading'>Last Name</td>"
Response.Write "<td class='smallheading'>Phone</td>"
Response.Write "<td class='smallheading'>Email</td>"
Response.Write "<td class='smallheading'>Option In/Out</td>"
Response.Write "<td class='smallheading'>System Name</td>"
Response.Write "<td class='smallheading'>Time Stamp</td>"
Response.Write "<td class='smallheading'>&nbsp;</td>"
Response.Write "</tr>"

do while not rs.EOF
	Response.Write "<tr>"
	Response.Write "<td class='text'>" & rs("firstname") & "&nbsp;</td>"
	Response.Write "<td class='text'>" & rs("lastname") & "&nbsp;</td>"
	Response.Write "<td class='text'>" & rs("phone") & "&nbsp;</td>"
	Response.Write "<td class='text'>" & rs("email") & "&nbsp;</td>"
	Response.Write "<td class='text'>" & rs("optioninout") & "&nbsp;</td>"
	Response.Write "<td class='text'>" & rs("systemname") & "&nbsp;</td>"
	Response.Write "<td class='text'>" & rs("timestamp") & "&nbsp;</td>"
	Response.Write "<td class='text'><a class='text' href='registered.asp?guid=" & Request.querystring("guid") & "&delpk=" & rs("pk") & "'>del</a>&nbsp;</td>"
	Response.Write "</tr>"
	rs.movenext
loop

Response.Write "</table>"
%>
			<br><a id=button href="admin.asp?guid=<%=Request.querystring("guid")%>">Menu</a>
</td></tr></table>
<%
else
	response.redirect "admin.asp?guid=" & Request.querystring("guid")
end if%>