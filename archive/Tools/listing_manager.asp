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
<table width=100% border=0>
	<tr height=7>
		<td />
	</tr>
	<tr>
		<td width=7 />
		<td>
<%
	if Request.QueryString("pk") > "" then
		sql = "select * from listings where pk = " & Request.QueryString("pk") 
		set rs = cn.Execute(sql)
		%>
		<form method="post" action="listing_manager.asp?guid=<%=Request.querystring("guid")%>" name="form3">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<table width="100%" border=0>
				<tr>
					<td>
						<span class="smallheading">Address</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="Address" value="<%=rs("Address")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">City</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="City" value="<%=rs("City")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Virtual Tour Link</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="VirtualTourLink" value="<%=rs("VirtualTourLink")%>">
					</td>
					<td class="small">
						Blank = no icon
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Image Location</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="ImageLocation" value="<%=rs("ImageLocation")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Map Link</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="MapLink" value="<%=rs("MapLink")%>">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Realtor.com Link</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="RealtorcomLink" value="<%=rs("RealtorcomLink")%>">
					</td>
					<td class="small">
						Blank = no link
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Listing Caption</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="DescriptionCaption" value="<%=rs("DescriptionCaption")%>">
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Listing Description</span>
					</td>
					<td>
						<textarea class="text" rows=10 cols=70 name="Description"><%=rs("Description")%></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Sort Order</span>
					</td>
					<td>
						<input class="text" type="text" size=70 name="Order" value="<%=rs("Order")%>">
					</td>
					<td class="small">
						Numeric
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Active</span>
					</td>
					<td>
						<input class="text" type="checkbox" <%if rs("active") then%> value="on" checked <%end if%> name="Active">
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
		<form method="post" action="listing_manager.asp?guid=<%=Request.querystring("guid")%>" name="form4">
			<input type="hidden" name="pk" value="<%=rs("pk")%>">
			<input type=hidden name=Submit value="Delete">
		</form>
		<%
	elseif Request.Form("Submit") = "Add New Listing" then
		%>
		<form method="post" action="listing_manager.asp?guid=<%=Request.querystring("guid")%>" id=form2 name=form2>
			<table>
				<tr>
					<td>
						<span class="smallheading">Address</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Address" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">City</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="City" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Virtual Tour Link</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="VirtualTourLink" value="">
					</td>
					<td class="small">
						Blank = no icon
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Image Location</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="ImageLocation" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Map Link</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="MapLink" value="">
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Realtor.com Link</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="RealtorcomLink" value="">
					</td>
					<td class="small">
						Blank = no link
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Listing Caption</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="DescriptionCaption" value="">
					</td>
				</tr>
				<tr>
					<td valign=top>
						<span class="smallheading">Listing Description</span>
					</td>
					<td>
						<textarea class="text" rows=10 cols=70 name="Description"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<span class="smallheading">Sort Order</span>
					</td>
					<td>
						<input class="text" type="text" size=72 name="Order" value="">
					</td>
					<td class="small">
						Numeric	
					</td>
				</tr>
				<tr>
					<td colspan=2 align=right>
						<input type=hidden name=Submit value="Add Listing">
						<a id=button href="javascript:form2.submit()">Add Listing</a>
					</td>
				</tr>
			</table>
		</form>
		<%
	elseif Request.Form("Submit") = "Add Listing" then
		if Request.Form("address")="" then
			sAddress = "[address missing]"
		else
			sAddress = Request.Form("address")
		end if
		sql = "insert into listings (address, City, VirtualTourLink, ImageLocation, MapLink, " & _
		      "DescriptionCaption, Description, [order], RealtorComLink, Active) values (" & _
			  "'" & replace(sAddress, "'", "''") & "', " & _
			  "'" & replace(Request.Form("City"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("VirtualTourLink"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("ImageLocation"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("MapLink"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("DescriptionCaption"), "'", "''") & "', " & _
			  "'" & replace(Request.Form("Description"), "'", "''") & "', " & _
			  "0" & Request.Form("Order") & ", " & _
			  "'" & replace(Request.Form("RealtorComLink"), "'", "''") & "', true)"
		'Response.Write sql
		'Response.End
		cn.Execute sql
		Response.Redirect "listing_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Save" then
		if Request.Form("address")="" then
			sAddress = "[address missing]"
		else
			sAddress = Request.Form("address")
		end if
		sql = "update listings set " & _
			  "address= '" & replace(sAddress, "'", "''") & "', " & _
			  "City= '" & replace(Request.Form("City"), "'", "''") & "', " & _
			  "VirtualTourLink= '" & replace(Request.Form("VirtualTourLink"), "'", "''") & "', " & _
			  "ImageLocation= '" & replace(Request.Form("ImageLocation"), "'", "''") & "', " & _
			  "MapLink= '" & replace(Request.Form("MapLink"), "'", "''") & "', " & _
			  "DescriptionCaption= '" & replace(Request.Form("DescriptionCaption"), "'", "''") & "', " & _
			  "Description= '" & replace(Request.Form("Description"), "'", "''") & "', " & _
			  "[order] = 0" & Request.Form("Order") & ", " & _
			  "RealtorComLink= '" & replace(Request.Form("RealtorComLink"), "'", "''") & "', " & _
			  "Active= " & (request.form("active") = "on") & _
			  " where pk = " & Request.Form("pk")
'		Response.Write sql
'		Response.End
		cn.Execute sql
		Response.Redirect "listing_manager.asp?guid=" & Request.querystring("guid")
	elseif Request.Form("Submit") = "Delete" then
		sql = "delete from listings where pk = " & Request.Form("pk")
'		Response.Write (request.form("active") = "on")
'		Response.End
		cn.Execute sql
		Response.Redirect "listing_manager.asp?guid=" & Request.querystring("guid")
	else
		sql = "select * from listings order by active, [order]"
		set rs = cn.Execute(sql)
		%>
		<span class="pageheading">
			Available Listings
		</span><br><br>
		<hr>
		<table><%
		do while not rs.EOF
			%>
				<tr>
					<td>
						<%if rs("active") then%>
							<a class="text" href="listing_manager.asp?pk=<%=rs("pk")%>&guid=<%=Request.querystring("guid")%>"><%=rs("Address")%></a>
						<%else%>
							<a class="greytext" href="listing_manager.asp?pk=<%=rs("pk")%>&guid=<%=Request.querystring("guid")%>"><%=rs("Address")%></a>
						<%end if%>
					</td>
				</tr>
			<%
			rs.MoveNext
		loop
		%>
		</table>
		<hr>
		<form method="post" action="listing_manager.asp?guid=<%=Request.querystring("guid")%>" id=form1 name=form1>
			<input type=hidden name="Submit" value="Add New Listing">
			<a id=button href="javascript:form1.submit()">Add New Listing</a>
			<br><a id=button href="admin.asp?guid=<%=Request.querystring("guid")%>">Menu</a>
		</form>
		<%
	end if
%>


</td></tr></table>

<%
else
	response.redirect "admin.asp?guid=" & Request.querystring("guid")
end if%>