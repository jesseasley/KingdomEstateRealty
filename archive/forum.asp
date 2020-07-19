<!--#include file="includes/header.asp"-->    
<!--#include file="includes/connection.asp"-->    
<!--#include file="includes/sendmail.asp"-->    
<script>
function submit_fq1 ()
{
	fq1.submit_form.value="test";
	fq1.submit();
}
</script>
<table border=0 cellspacing=0 cellpadding=0><tr><td width=7></td><td>
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	if Request.form("submit_form") = "test" then
		sql = "insert into forum (question) values ('" & replace(Request.Form("q1"), "'", "''") & "')"
		cn.execute(sql)
		sendemail "forumquestion", "", "", "", ""
		Response.Redirect "forum.asp"
	end if
	sql = "select pk, question, answer from forum order by pk desc"
	set rs = cn.execute(sql)
	Response.Write "<span class='pageheading'>Q & A</span><br><br>"
	if Request.QueryString("ask") <> "true" then
		%><span class="sectionheading">Have a question? Need some help?</span> <a href="forum.asp?ask=true" id="button">Click Here</a><br><%
	end if
	Response.Write "<table border=1 cellspacing=0 cellpadding=0 width=100% ><tr><td width=300 class='sectionheading'>Question</td><td width=300 class='sectionheading'>Response</td></tr>"
	if Request.QueryString("ask") = "true" then%>
		<tr><td><form action="forum.asp" method="post" name=fq1>
		<span class="sectionheading">Type your questions here:</span><br><textarea class="text" name=q1 rows=4 cols=34></textarea>
		<a href="javascript:submit_fq1()" id=button>Submit</a>
		<input type="hidden" value="a" name="submit_form" id="submit_form">
		</form></td><td>&nbsp;</td></tr>
	<%end if
	do while not rs.EOF
		Response.Write "<tr><td class='text' width=300 valign=top>" & rs("question") & "&nbsp;</td><td class='text'>" & rs("answer") & "&nbsp;</td></tr>"
		rs.MoveNext
	loop
	%></table><%
%>
</td></tr></table>
<!--#include file="includes/footer.asp"-->
