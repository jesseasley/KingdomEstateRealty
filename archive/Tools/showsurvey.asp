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
	if request.form("action") = "delete" then
		sql = "delete from survey where pk = " & request.form("pk")
		cn.execute sql
		response.redirect "surveylist.asp?guid=" & Request.querystring("guid")
	end if

	sql = "select timestamp, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10 from survey where pk = " & Request.QueryString("pk")
	set rs = cn.execute(sql)
	Response.Write "<span class='pageheading'>Survey " & rs("timestamp") & "</span><br><br>"
%>
<span class="text">
		How did you learn of our site?<br>
		<%=rs("q1")%>

		<br><br>
		If you used a search engine to find us, please select the one you used to do so:<br>
		<%=rs("q2")%><br><br>

		Through the search engine, what word or phrase did you type in for your search?<br>
		<%=rs("q3")%><br><br>

		In the last 30 days, how many times have you visited this site?<br>
		<%=rs("q4")%><br><br>

		Based on a one week time frame, how many hours do you spend browsing and exploring this site?<br>
		<%=rs("q5")%><br><br>

		How likely are you to return to this site again?<br>
		<%=rs("q6")%><br><br>

		What was the main reason for visiting our site?<br>
		<%=rs("q7")%><br><br>

		Overall, how satisfied are you with your visit to the Website?<br>
		<%=rs("q8")%><br><br>

		What did you like/dislike the most about our website?<br>
		<%=rs("q9")%><br><br>

		Are there any improvements you would like to suggest?<br>
		<%=rs("q10")%><br><br>
		<a id="button" href="javascript:frm.submit()">Delete Survey</a>
</span>
</td></tr></table>
<form method="post" action="showsurvey.asp?guid=<%=Request.querystring("guid")%>" name="frm">
<input type="hidden" name="pk" value="<%=request.querystring("pk")%>">
<input type="hidden" name="action" value="delete">
</form>
<%
else
	response.redirect "admin.asp?guid=" & Request.querystring("guid")
end if%>