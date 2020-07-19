<%
if request.cookies("excluded_ips") = "" then
	response.cookies("excluded_ips") = "''"
end if
sql = "SELECT Format([timestamp],'mm/""00""/yyyy') AS ts, Count(Format([timestamp],'yyyymm""00""')) AS Expr1 " & _
"FROM page_tracker " 

if request.cookies("starting_date") > "" then
	sql = sql & "WHERE (((page_tracker.timestamp)>=#" & request.cookies("starting_date") & "#)  " & _
	"AND ((page_tracker.SourceIP) Not In (" & request.cookies("excluded_ips") & "))) " 
end if

sql = sql & "GROUP BY Format([timestamp],'mm/""00""/yyyy'), Format([timestamp],'yyyymm""00""') " & _
"ORDER BY Format([timestamp],'yyyymm""00""') DESC;"


'response.write sql
'response.end
set rs = cn.execute(sql)

%>
<table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#CCFFCC">
	<tr>
		<td class="sectionheading" colspan=4>Hit Count per Month</td>
	</tr>
	<tr>
		<td class="smallheading">Date</td>
		<td class="smallheading">Hit Count</td>
	</tr>
	<%do until rs.EOF%>
		<tr>
			<td class="small"><center><%=monthname(left(rs.fields(0),2)) & " " & right(rs.Fields(0),4)%></tr>
			<td class="small"><center><%=rs.Fields(1)%></tr>
		</tr>
		<%rs.MoveNext
	loop%>
</table>
<br>
