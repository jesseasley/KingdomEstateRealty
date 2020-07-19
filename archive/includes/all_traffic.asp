<%
sql = "SELECT * FROM page_tracker " 

if request.cookies("starting_date") > "" then
	sql = sql & "WHERE (((page_tracker.timestamp)>=#" & request.cookies("starting_date") & "#)  " & _
	"AND ((page_tracker.SourceIP) Not In (" & request.cookies("excluded_ips") & "))) " 
end if

sql = sql & "ORDER BY page_tracker.timestamp DESC;"


set rs = cn.execute(sql)
%>

<table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#E6E6E6">
	<tr>
		<td class="sectionheading" colspan=4><center>All Traffic</td>
	</tr>
	<tr>
		<td><span class="smallheading">Page Name</span></td>
		<td><span class="smallheading">Source IP</span></td>
<!--		<td><span class="smallheading">Location</span></td>-->
		<td><span class="smallheading">Time Stamp</span></td>
		<td>&nbsp;</td>
		</tr>
<%
do while not rs.EOF
	%>
	<tr>
		<td class="small" width=330>
		<%
		sPagename = rs("pagename")
		if left(sPagename, 27) = "/realty/openwindow.asp?url=" or left(sPagename, 20) = "/openwindow.asp?url=" then

'realtor.com
			if instr(sPagename, "1097470658") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">1423 Chinaberry Sale</a>
			<%elseif instr(sPagename, "1097850098") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">1423 Chinaberry Lease</a>
			<%elseif instr(sPagename, "1099083550") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">2820 Northshore</a>
			<%elseif instr(sPagename, "1097981908") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">4950 Lusk</a>
			<%elseif instr(sPagename, "1101656528") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">2430 Antler</a>
			<%elseif instr(sPagename, "1105105586") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">4600 Oak Springs</a>
			<%elseif instr(sPagename, "1105075069") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">1152 Christopher</a>
			<%elseif instr(sPagename, "1105984691") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">1 Montgomery</a>
			<%elseif instr(sPagename, "1106865117") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">709 Inglewood</a>
<%'virtual tours%>
			<%elseif instr(sPagename, ".asp?t=1488975") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">4950 Lusk Virtual Tour</a>
			<%elseif instr(sPagename, ".asp?t=1488980") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">1423 Chinaberry Virtual Tour</a>
			<%elseif instr(sPagename, ".asp?t=1503482") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">2820 Northshore Virtual Tour</a>
			<%elseif instr(sPagename, ".asp?t=1488969") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">2430 Antler Virtual Tour</a>
			<%elseif instr(sPagename, ".asp?t=1744476") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">1152 Christopher Virtual Tour</a>
			<%elseif instr(sPagename, ".asp?t=1745363") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">4600 Oak Springs Virtual Tour</a>
			<%elseif instr(sPagename, ".asp?t=1771428") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">1 Montgomery Virtual Tour</a>
			<%elseif instr(sPagename, ".asp?t=1802406") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">709 Inglewood Virtual Tour</a>
<%'google maps%>
			<%elseif instr(sPagename, "maps?q=9028%20san%20joaquin,%20fort%20worth") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:9028 San Joaquin</a>
			<%elseif instr(sPagename, "maps?q=1407%20Chinaberry,%20Lewisville") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:1407 Chinaberry</a>
			<%elseif instr(sPagename, "maps?q=2430%20Antler%20Trl,%20Lewisville") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:2430 Antler</a>
			<%elseif instr(sPagename, "maps?q=2820%20Northshore%20Blvd,%20Flower%20Mound") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:2820 Northshore</a>
			<%elseif instr(sPagename, "maps?q=2311%20Cross%20Timbers,%20Arlington") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:2311 Cross Timbers</a>
			<%elseif instr(sPagename, "maps?q=2517%20brandywine,%20flower%20mound") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:2517 Brandywine</a>
			<%elseif instr(sPagename, "maps?q=1423%20Chinaberry,%20Lewisville") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:1423 Chinaberry</a>
			<%elseif instr(sPagename, "maps?q=4950%20Lusk%20Ln,%20Flower%20Mound") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:4950 Lusk</a>
			<%elseif instr(sPagename, "maps?q=1152%20Christopher") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:1152 Christopher</a>
			<%elseif instr(sPagename, "maps?q=4600%20Oak%20Spring") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:4600 Oak Spring</a>
			<%elseif instr(sPagename, "maps?q=1%20Montgomery") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:1 Montgomery</a>
			<%elseif instr(sPagename, "maps?q=709%20Inglewood") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Google maps:709 Inglewood</a>
<%'other%>
			<%elseif instr(sPagename, "P0000290998.htm") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Office Listings</a>
			<%elseif instr(sPagename, "flowermound.century21judgefite.com") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Flower Mound Office</a>
			<%elseif instr(sPagename, "weather.com") > 0 then%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty">Weather.com</a>
			<%else%>
				<%=left(sPagename, instr(sPagename, "?") - 1)%>?url=<a class="small" href="<%=mid(sPagename, instr(sPagename, "url=") + 4)%>" target="_empty"><%=mid(sPagename, instr(sPagename, "url=") + 4)%></a>
			<%end if%>
		<%else%>
			<%=sPagename%>&nbsp;
		<%end if%>
		</td>
		<td class="small" width=100><%=rs("sourceip")%>&nbsp;</td>
<!--		<td class="small" width=100><%=rs("location")%>&nbsp;</td>-->
		<td class="small" width=200><%=rs("timestamp")%>&nbsp;</td>
		<td width=20><a class="small" href="page_tracking.asp?del=<%=rs("pk")%>">del</a></td>
	</tr>
	<%
	rs.movenext
loop
%>