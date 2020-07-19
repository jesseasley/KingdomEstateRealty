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
<%
	sql = "select pk, timestamp from survey order by timestamp desc"
	Set rs = Server.CreateObject("ADODB.Recordset")
	set rs = cn.execute(sql)
	Response.Write "<span class='pageheading'>Surveys</span><br><br>"
	do while not rs.EOF
		%><a class="text" href="showsurvey.asp?guid=<%=Request.querystring("guid")%>&pk=<%=rs.Fields(0)%>"><%=rs.Fields(1)%></a><br><%
		rs.MoveNext
	loop
	
%>
<br><a id=button href="admin.asp?guid=<%=Request.querystring("guid")%>">Menu</a>
</td></tr></table>
<%
else
	response.redirect "admin.asp?guid=" & Request.querystring("guid")
end if%>