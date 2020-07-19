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
<script>
function submit_fq1 ()
{
	fq1.submit_form.value="test";
	fq1.submit();
}
function submit_answer_update ()
{
	update_form.submit();
}

</script>
<table border=0 cellspacing=0 cellpadding=0><tr><td width=7></td><td>
<%
	if request.querystring("delete") > "" then
		sql = "delete from forum where pk = " & request.querystring("delete")
		cn.execute sql
		response.redirect "forum_response.asp?guid=" & Request.querystring("guid")
	end if
	if Request.form("form_control") = "UpdateAnswer" then
		sql = "update forum set question='" & replace(Request.Form("form_question"), "'", "''") & "', answer='" & replace(Request.Form("form_answer"), "'", "''") & "' where pk = " & Request.Form("form_pk")
		cn.Execute sql
	end if
	if Request.form("submit_form") = "test" then
		sql = "insert into forum (question) values ('" & replace(Request.Form("q1"), "'", "''") & "')"
		cn.execute(sql)
		Response.Redirect "forum.asp?guid=" & Request.querystring("guid")
	end if
	sql = "select pk, question, answer from forum order by pk desc"
	set rs = cn.execute(sql)
	Response.Write "<span class='pageheading'>Forum</span><br><br>"
	if Request.QueryString("ask") <> "true" then
		%><span class="sectionheading">Have a question? Need some help?</span> <a href="../forum.asp?guid=<%=Request.querystring("guid")%>&ask=true" id="button">Click Here For Help</a><br><%
	end if
	Response.Write "<table border=1 cellspacing=0 cellpadding=0 width=100% ><tr><td width=300 class='sectionheading' ><center><b>Question</b></center></td><td width=300 class='sectionheading'><center><b>Response</b></center></td><td>&nbsp;</td></tr>"
	if Request.QueryString("ask") = "true" then%>
		<tr><td><form action="forum.asp?guid=<%=Request.querystring("guid")%>" method="post" name=fq1>
		Type your questions here:<br><textarea name=q1 rows=4 cols=34></textarea>
		<a href="javascript:submit_fq1()" id=button>Submit</a>
		<input type="hidden" value="a" name="submit_form" id="submit_form">
		</form></td><td>&nbsp;</td></tr>
	<%end if
	do while not rs.EOF
		reply = Request.QueryString("reply")
		pk = rs("pk")
		answer = rs("answer")
		question = rs("question")
		%>
			<tr>
				<%
				if reply > "" then
					if cstr(pk) = reply then%>
						<form id=update_form method=post action="forum_response.asp?guid=<%=Request.querystring("guid")%>">
							<td valign=top class='text'>
								<textarea class='text' cols=30 rows=30 id=form_question name=form_question ><%=question%></textarea>
							</td>
							<td>
								<input type=hidden name=form_pk value=<%=pk%>>
								<input type=hidden name="form_control" id="form_control" value="UpdateAnswer">
								<textarea class='text' cols=60 rows=30 id=form_answer name=form_answer><%=answer%></textarea>
							</td>
							<td>
								<a href="javascript:submit_answer_update()" id=smallbutton>Post</a>
							</td>
						</form>
					<%else
						Response.Write("<td valign=top class='text'>" & question & "&nbsp;</td>")
						Response.Write("<td>" & answer & "&nbsp;</td>")%>&nbsp;
						<td>
							<a href="forum_response.asp?guid=<%=Request.querystring("guid")%>&reply=<%=pk%>" id=smallbutton>Reply</a>
						</td>
					<%end if%>
				<%else
					Response.Write("<td valign=top class='text'>" & question & "&nbsp;</td>")
					Response.Write("<td class='text'>" & answer & "&nbsp;</td>")%>&nbsp;
					<td>
						<a href="forum_response.asp?guid=<%=Request.querystring("guid")%>&delete=<%=pk%>" id=smallbutton>Delete</a><br>
						<a href="forum_response.asp?guid=<%=Request.querystring("guid")%>&reply=<%=pk%>" id=smallbutton>Reply</a>
					</td>
				<%end if%>
			</tr>
		<%
		rs.MoveNext
	loop
	%></table><%
%>
			<br><a id=button href="admin.asp?guid=<%=Request.querystring("guid")%>">Menu</a>
</td></tr></table>
<%
else
	response.redirect "/realty/tools/admin.asp"
end if%>