<script language="javascript">
    function ow(url) {
        window.open(url, "mywindow", "menubar=1");
    }
</script>
<table border=0 cellpadding=0 cellspacing=0 width="535">
	<tr>
		<td colspan=3>
			<span class="sectionheading">
				View My Listings	
				<hr>	
			</span>
		</td>	
	</tr>
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = Server.CreateObject("ADODB.Connection")
	cn.Mode = 3
	cn.open sConnection
	sql = "select * from listings where active=true order by [order]"
	set rs = cn.execute(sql)
	do while not rs.eof
%>
	<tr>
		<td class="text" width=100>
			<%if isnull(rs("RealtorComLink")) then%>
				<img width=100 src="<%=rs("ImageLocation")%>" border=1 alt="<%=rs("Address") & ", " & rs("City")%>">
			<%elseif rs("RealtorComLink") = "" then%>
				<img width=100 src="<%=rs("ImageLocation")%>" border=1 alt="<%=rs("Address") & ", " & rs("City")%>">
			<%else%>
				<a class="text" href="openwindow.asp?url=<%=rs("RealtorComLink")%>", target="_empty">
					<img width=100 src="<%=rs("ImageLocation")%>" border=1 alt="See the ad for <%=rs("Address") & ", " & rs("City")%> on Realtor.com">
				</a>
			<%end if%>
		</td>
		<td class="text" width=132>
			<center>
				<%if isnull(rs("RealtorComLink")) then%>
					<%=rs("Address")%><br><%=rs("City")%></b>
				<%elseif rs("RealtorComLink") = "" then%>
					<%=rs("Address")%><br><%=rs("City")%></b>
				<%else%>
					<a 
						class="text" 
						title="See the ad for <%=rs("Address") & ", " & rs("City")%> on Realtor.com" 
						href="openwindow.asp?url=<%=rs("RealtorComLink")%>"
						target="_empty">
						<%=rs("Address")%><br><%=rs("City")%></b>
					</a>
				<%end if%>
				<br>
				<%if not isnull(rs("VirtualTourLink")) then%>
					<%if rs("VirtualTourLink") > "" then%>
						<a class="text" href="openwindow.asp?url=<%=rs("VirtualTourLink")%>" target="_new">
							<img width=88 src='images/visualtour.gif' border='1' alt="See the virtual tour for <%=rs("Address") & ", " & rs("City")%>"></a>
					<%end if%>
				<%end if%>
				<!--<a class="text" href="javascript:ow('<%=rs("MapLink")%>')">
					<img width=46 src="images/map.gif" border=1 height=31 alt="See where <%=rs("Address") & ", " & rs("City")%> is on Google Maps">
				</a>-->
				<a class="text" href="openwindow.asp?url=<%=rs("MapLink")%>" target="_blank">
					<img width=46 src="images/map.gif" border=1 height=31 alt="See where <%=rs("Address") & ", " & rs("City")%> is on Google Maps">
				</a>
			</center>
		</td>
		<td width=303>
			<table>
				<tr>
					<td class="smallheading">
						<%=rs("DescriptionCaption")%>
						
					</td>
				</tr>			
				<tr>
					<td class="text">
						<%=rs("Description")%>
					</td>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=3><hr></td>
	</tr>
<%
	rs.movenext
	loop
%>
</table>

