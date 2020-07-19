<!--#include file="includes/header.asp"-->    
<!--#include file="includes/connection.asp"-->    
<%
Set rs = Server.CreateObject("ADODB.Recordset")
set cn = server.createobject("adodb.connection")
cn.Mode = 3
cn.open sConnection
%>
    <script>
	function expand(article_name)
	{
		expandedform.expanded.value = article_name;
		document.expandedform.submit();
	}
    </script>

              <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" class="interior">
                <TR> 
                  <TD VALIGN="top" ALIGN="left"> 
                  </td>
                </tr>
                <tr> 
                  <td valign=top> 
                  	<form method=post action="">
	                  	<table cellpadding=0 cellspacing=0 border=0 width="100%">
	                  		<tr>
	                  			<td width=5>&nbsp;</td>
	                  			<td colspan=2 valign=top>

		<span class="pageheading">Articles</span><br><br>
<span class="sectionheading">		These are a series of advice articles categorized by the list below.  Click on a category to expand it.  You're bound to find something useful inside.<br><br></span>
<span class="text">	<%
	Set rsTopArticles = Server.CreateObject("ADODB.Recordset")
	sql = "select pk, article_name from advice_articles where article_parent = 0 order by priority"
	set rsTopArticles = cn.Execute(sql)
	do while not rsTopArticles.EOF
		if Request.Form("expanded") = rsTopArticles("article_name") then
			Response.Write rsTopArticles("article_name") & "<br>"
			GetArticles rsTopArticles("pk")
		else
			%><a class="text" href="javascript:expand('<%=rsTopArticles("article_name")%>')"><%=rsTopArticles("article_name")%></a><br><%
		end if
		rsTopArticles.MoveNext
	loop
function GetArticles(fk)
	Set rsArticles = Server.CreateObject("ADODB.Recordset")
	sql = "select pk, article_name, article_location, menu_item from advice_articles where article_parent = " & fk & " order by priority"
	set rspArticles = cn.Execute(sql)
	do while not rspArticles.eof
		if rspArticles("menu_item") then
			%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="text" href="javascript:expand('<%=rspArticles("article_name")%>')"><%=rspArticles("article_name")%></a><br><%
		else
			%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="text" href="<%=rspArticles("article_location")%>"<%if left(rspArticles("article_location"), 14) = "openwindow.asp" then%> target=_new<%end if%>><%=rspArticles("article_name")%></a><br><%
		end if
		rspArticles.movenext
	loop
end function
%>
</span>								</td>
	                  		</tr>
	                  	</table>
	                 </form>
                  </td>
                </tr>

              </TABLE>
    
<!--#include file="includes/footer.asp"-->
        <form method=post action="articles.asp" name=expandedform id=expandedform>
		<input type=hidden name=expanded id=expanded value="<%=Request.Form("expanded")%>">
		</form>

