<%
sql = "SELECT Count(page_tracker.pagename) AS CountOfpagename, page_tracker.pagename, page_tracker.SourceIP " & _
	"FROM page_tracker WHERE (((page_tracker.timestamp)>=#" & request.cookies("starting_date") & "#)) " & _
	"GROUP BY page_tracker.pagename, page_tracker.SourceIP HAVING (((page_tracker.SourceIP) Not In " & _
	"(" & request.cookies("excluded_ips") & "))) " & _
	"ORDER BY Count(page_tracker.pagename) DESC;"

set rs = cn.execute(sql)

%>
<table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#FFFFCC">
	<tr>
		<td class="sectionheading" colspan=4>Top Ranking Pages</td>
	</tr>
	<tr>
		<td><span class="smallheading">Page Name</span></td>
		<td class="smallheading">Hit Count</td>
	</tr>
	<%do until rs.EOF%>
		<tr>
			<td class="text">
			<%
			sPagename = rs.Fields(1)
			if left(sPagename, 27) = "/realty/openwindow.asp?url=" or left(sPagename, 20) = "/openwindow.asp?url=" then
				if instr(sPagename, "1097470658") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">1423 Chinaberry Sale</a>
				<%elseif instr(sPagename, "1097850098") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">1423 Chinaberry Lease</a>
				<%elseif instr(sPagename, ".asp?t=1488980") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">1423 Chinaberry Virtual Tour</a>
				<%elseif instr(sPagename, "1099083550") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">2820 Northshore</a>
				<%elseif instr(sPagename, ".asp?t=1503482") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">2820 Northshore Virtual Tour</a>
				<%elseif instr(sPagename, "1097981908") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">4950 Lusk</a>
				<%elseif instr(sPagename, ".asp?t=1488975") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">4950 Lusk Virtual Tour</a>
				<%elseif instr(sPagename, "1096193220") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">2430 Antler</a>
				<%elseif instr(sPagename, ".asp?t=1488969") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">2430 Antler Virtual Tour</a>
				<%elseif instr(sPagename, "P0000290998.htm") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Office Listings</a>
				<%elseif instr(sPagename, "flowermound.century21judgefite.com") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Flower Mound Office</a>
				<%elseif instr(sPagename, "weather.com") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Weather.com</a>
				<%elseif instr(sPagename, "maps?q=9028%20san%20joaquin,%20fort%20worth") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Google maps:9028 San Joaquin</a>
				<%elseif instr(sPagename, "maps?q=1407%20Chinaberry,%20Lewisville") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Google maps:1407 Chinaberry</a>
				<%elseif instr(sPagename, "maps?q=2430%20Antler%20Trl,%20Lewisville") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Google maps:2430 Antler</a>
				<%elseif instr(sPagename, "maps?q=2820%20Northshore%20Blvd,%20Flower%20Mound") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Google maps:2820 Northshore</a>
				<%elseif instr(sPagename, "maps?q=1423%20Chinaberry,%20Lewisville") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Google maps:1423 Chinaberry</a>
				<%elseif instr(sPagename, "maps?q=4950%20Lusk%20Ln,%20Flower%20Mound") > 0 then%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty">Google maps:4950 Lusk</a>
				<%else%>
					/openwindow.asp?url=<a class="text" href="<%=mid(sPagename, 21)%>" target="_empty"><%=mid(sPagename, 21)%></a>
				<%end if%>
			<%else%>
				<%=sPagename%>&nbsp;
			<%end if%>
			</td>
			<td class="text"><center><%=rs.Fields(0)%></tr>
		</tr>
		<%rs.MoveNext
	loop%>
</table>
<br>
