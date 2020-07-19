<%
sql = "SELECT page_tracker.SourceIP, page_tracker.Location, Count(page_tracker.SourceIP) AS CountOfSourceIP " & _
	"FROM page_tracker WHERE " & _
	"(((page_tracker.timestamp)>=#" & request.cookies("starting_date") & "#) AND " & _
	"((page_tracker.SourceIP) Not In (" & request.cookies("excluded_ips") & "))) " & _
	"GROUP BY page_tracker.SourceIP, page_tracker.Location ORDER BY Count(page_tracker.SourceIP) DESC;"

set rs = cn.execute(sql)

%>
<table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#CCFFFF">
	<tr>
		<td class="sectionheading" colspan=4>Hit Count by IP</td>
	</tr>
	<tr>
		<td><span class="smallheading">Source IP</span></td>
		<td><span class="smallheading">Location</span></td>
		<td class="smallheading">Hit Count</td>
	</tr>
	<%do until rs.EOF%>
		<tr>
			<td class="text"><%=rs("SourceIP")%></td>
			<td class="small"><%=rs("location")%>&nbsp;</td>
			<td class="text"><center><%=rs("CountOfSourceIP")%></tr>
		</tr>
		<%rs.MoveNext
	loop%>
</table>
<br>
