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
		sql = "select * from advice_articles where pk = " & Request.QueryString("pk") 
		set rs = cn.Execute(sql)
		%>
		<form method="post" action="article_manager.asp?guid=<%=Request.querystring("guid")%>" name="form3">
			<table>
				<tr>
					<td>
						<span class="smallheading">Article ID</span>
					</td>
					<td>
						<input type="hidden" name="pk" value="<%=rs("pk")%>">
						<%=rs("pk")%>
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Menu Item</span>
					</td>
					<td>
						<input class="text" type="checkbox" size=72 name="MenuItem"  <%if rs("Menu_Item") then%>value="on" checked <%end if%>>
					</td>
					<td class="small">
						For nesting
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Article Parent ID</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ArticleParent" value="<%=rs("Article_Parent")%>">
					</td>
					<td class="small">
						For nesting
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Sort Order</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Priority" value="<%=rs("Priority")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Article Name</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ArticleName" value="<%=rs("Article_Name")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Article Location</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ArticleLocation" value="<%=rs("Article_Location")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Requires Registration</span>
					</td>
					<td>
						<input class="text" type="checkbox" size=72 name="RequiresRegistration" <%if rs("Requires_Registration") then%>value="on" checked <%end if%>>
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
		<form method="post" action="article_manager.asp?guid=<%=Request.querystring("guid")%>" name="form4">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<input type=hidden name=Submit value="Delete">
		</form>
		<%
	elseif Request.Form("Submit") = "Add New Article" then
		%>
		<form method="post" action="article_manager.asp?guid=<%=Request.querystring("guid")%>" id=form2 name=form2>
			<table>
				<tr>
				<tr>
					<td>
						<span class="smallheading">Menu Item</span>
					</td>
					<td>
						<input class="text" type="checkbox" size=72 name="MenuItem" value="on" >
					</td>
					<td class="small">
						For nesting
					</td>
				</tr>
					<td>
						<span class="smallheading">Article Parent ID</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ArticleParent" value="">
					</td>
					<td class="small">
						For nesting
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Sort Order</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Priority" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Article Name</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ArticleName" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Article Location</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ArticleLocation" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Requires Registration</span>
					</td>
					<td>
						<input class="text" type="checkbox" size=72 name="RequiresRegistration" value="on">
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Add Article">
						<a id=button href="javascript:form2.submit()">Add Article</a>
					</td>
				</tr>
			</table>
		</form>
		<%
	elseif Request.Form("Submit") = "Add Article" then
		if Request.Form("articlename")="" then
			sarticlename = "[Article Name missing]"
		else
			sarticlename = Request.Form("articlename")
		end if
		if isnumeric("0" & Request.Form("articleparent")) and isnumeric("0" & Request.Form("priority")) then
			sql = "insert into advice_articles (article_parent, priority, article_name, " & _
				  "article_location, literal_location, menu_item, requires_registration) values (" & _
				  int("0" & replace(Request.Form("articleparent"), "'", "''")) & ", " & _
				  int("0" & replace(Request.Form("priority"), "'", "''")) & ", " & _
				  "'" & replace(sarticlename, "'", "''") & "', " & _
				  "'" & replace(Request.Form("articlelocation"), "'", "''") & "', " & _
				  "'" & replace(Request.Form("literallocation"), "'", "''") & "', " & _
				  cstr(Request.Form("menuitem") = "on") & ", " & _
				  cstr(Request.Form("requiresregistration") = "on") & ")"
'			Response.Write sql
'			Response.End
			cn.Execute sql
		end if
		Response.Redirect "article_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Save" then
		if Request.Form("articlename")="" then
			sarticlename = "[Article Name missing]"
		else
			sarticlename = Request.Form("articlename")
		end if
		if isnumeric("0" & Request.Form("articleparent")) and isnumeric("0" & Request.Form("priority")) then
			sql = "update advice_articles set " & _
				  "article_parent = " & int("0" & replace(Request.Form("articleparent"), "'", "''")) & ", " & _
				  "priority = " & int("0" & replace(Request.Form("priority"), "'", "''")) & ", " & _
				  "article_name = '" & replace(sarticlename, "'", "''") & "', " & _
				  "article_location = '" & replace(Request.Form("articlelocation"), "'", "''") & "', " & _
				  "literal_location = '" & replace(Request.Form("literallocation"), "'", "''") & "', " & _
				  "menu_item = " & cstr(Request.Form("menuitem") = "on") & ", " & _
				  "requires_registration = " & cstr(Request.Form("requiresregistration") = "on") & _
				  " where pk = " & Request.Form("pk")
'			Response.Write sql
'			Response.End
			cn.Execute sql
		end if
		Response.Redirect "article_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Delete" then
		sql = "delete from advice_articles where pk = " & Request.Form("pk")
'		Response.Write (request.form("active") = "on")
'		Response.End
		cn.Execute sql
		Response.Redirect "article_manager.asp?guid=" & Request.querystring("guid")
	else
		sql = "select * from advice_articles order by article_name"
		set rs = cn.Execute(sql)
		%>
		<span class="pageheading">
			Available Articles
		</span><br><br>
		<hr>
		<table><%
		do while not rs.EOF
			%>
				<tr>
					<td>
						<a class="text" href="article_manager.asp?guid=<%=Request.querystring("guid")%>&pk=<%=rs("pk")%>"><%=rs("article_name")%></a>
					</td>
				</tr>
			<%
			rs.MoveNext
		loop
		%>
		</table>
		<hr>
		<form method="post" action="article_manager.asp?guid=<%=Request.querystring("guid")%>" id=form1 name=form1>
			<input type=hidden name="Submit" value="Add New Article">
			<a id=button href="javascript:form1.submit()">Add New Article</a>
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