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
		<table border=0 cellspacing=0 cellpadding=0><tr><td width=7></td><td>
		<span class="pageheading">Web Site Activity Tracking</span><br><br>
		<%
		dim oHTTP
		set oHTTP = server.createobject("Microsoft.XMLHTTP")
		
		if Request.QueryString("del") > "" then
			cn.Execute "delete from page_tracker where pk = " & Request.QueryString("del")
			Response.Redirect "page_tracking.asp?guid=" & Request.querystring("guid")
		end if
		
		if request.form("form_type") = "params" then
			if request.form("Top_Ranking_Pages") = "on" then
				response.cookies("Top_Ranking_Pages") = "true"
			else
				response.cookies("Top_Ranking_Pages") = "false"
			end if
			if request.form("page_hit_count_by_ip") = "on" then
				response.cookies("page_hit_count_by_ip") = "true"
			else
				response.cookies("page_hit_count_by_ip") = "false"
			end if
			if request.form("lookup_location") = "on" then
				response.cookies("lookup_location") = "true"
			else
				response.cookies("lookup_location") = "false"
			end if
			response.cookies("Top_Ranking_Pages").expires = "12/31/2010"
			response.cookies("page_hit_count_by_ip").expires = "12/31/2010"
			response.cookies("lookup_location").expires = "12/31/2010"
			response.cookies("starting_date") = request.form("starting_date")
			response.cookies("starting_date").expires = "12/31/2010"
			response.cookies("excluded_ips") = request.form("excluded_ips")
			response.cookies("excluded_ips").expires = "12/31/2010"
			Response.Redirect "page_tracking.asp?guid=" & Request.querystring("guid")
		end if
		
		%>
		
		<%if request.cookies("lookup_location") = "true" then
			lookup_locations
		end if
		
		if request.querystring("groupby") > "" then
			if request.querystring("groupby") = "month" then
				sql = "SELECT month(timestamp) AS [Month], Count(month(page_tracker.timestamp)) AS HitCount " & _
					  "FROM page_tracker WHERE year(timestamp) = '" & request.querystring("year") & "'" & _
					  "GROUP BY month(page_tracker.timestamp) ORDER BY month(page_tracker.timestamp) DESC"
				set rs = cn.execute(sql)
				%><table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#CCFFCC">
					<tr>
						<td class="sectionheading" colspan=4>Hit-Count Grouped by Month for Year 
						<a href="page_tracking.asp?guid=<%=Request.querystring("guid")%>"><%=request.querystring("year")%></a>
						</td>
					</tr>
					<tr>
						<td class="smallheading">Month</td>
						<td class="smallheading">Hit-Count</td>
					</tr>
					<%do until rs.EOF%>
						<tr>
							<td class="small"><center>
							<a href="page_tracking.asp?groupby=day&year=<%=request.querystring("year")%>&month=<%=rs.fields(0)%>&guid=<%=Request.querystring("guid")%>">
							<%
							select case rs.fields(0)
								case 1 response.write "January"
								case 2 response.write "February"
								case 3 response.write "March"
								case 4 response.write "April"
								case 5 response.write "May"
								case 6 response.write "June"
								case 7 response.write "July"
								case 8 response.write "August"
								case 9 response.write "September"
								case 10 response.write "October"
								case 11 response.write "November"
								case 12 response.write "December"
							end select
							%></tr>
							<td class="small"><center><%=rs.fields(1)%></tr>
						</tr>
						<%rs.MoveNext
					loop%>
				</table><%
			elseif request.querystring("groupby") = "day" then
				sql = "SELECT Day(timestamp) AS [Day], Count(Day(page_tracker.timestamp)) AS HitCount FROM page_tracker " & _
					  "WHERE (((Month([timestamp]))='" & request.querystring("month") & "') AND " & _
					  		"((Year([timestamp]))='" & request.querystring("year") & "')) " & _
					  "GROUP BY Day(page_tracker.timestamp) ORDER BY Day(page_tracker.timestamp) DESC"
				set rs = cn.execute(sql)
				%><table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#CCFFCC">
					<tr>
						<td class="sectionheading" colspan=4>Hit-Count Grouped by Day for 
						<a href="page_tracking.asp?groupby=month&year=<%=request.querystring("year")%>&guid=<%=Request.querystring("guid")%>">
						<%
						select case request.querystring("month")
							case 1 response.write "January"
							case 2 response.write "February"
							case 3 response.write "March"
							case 4 response.write "April"
							case 5 response.write "May"
							case 6 response.write "June"
							case 7 response.write "July"
							case 8 response.write "August"
							case 9 response.write "September"
							case 10 response.write "October"
							case 11 response.write "November"
							case 12 response.write "December"
						end select
						response.write " " & request.querystring("year")%></a>
						</td>
					</tr>
					<tr>
						<td class="smallheading">Day</td>
						<td class="smallheading">Hit-Count</td>
					</tr>
					<%do until rs.EOF%>
						<tr>
							<td class="small"><center>
							<a href="page_tracking.asp?groupby=none&guid=<%=Request.querystring("guid")%>&year=<%=request.querystring("year")%>&month=<%=request.querystring("month")%>&day=<%=rs.fields(0)%>">
							<%
							select case request.querystring("month")
								case 1 response.write "January"
								case 2 response.write "February"
								case 3 response.write "March"
								case 4 response.write "April"
								case 5 response.write "May"
								case 6 response.write "June"
								case 7 response.write "July"
								case 8 response.write "August"
								case 9 response.write "September"
								case 10 response.write "October"
								case 11 response.write "November"
								case 12 response.write "December"
							end select
							response.write " " & rs.fields(0) & ", " & request.querystring("year")
							%></td>
							<td class="small"><center><%=rs.fields(1)%></tr>
						</tr>
						<%rs.MoveNext
					loop%>
				</table><%
			elseif request.querystring("groupby") = "none" then
				sql = "SELECT pagename, timestamp, sourceip FROM page_tracker " & _
					  "where day(timestamp)='" & request.querystring("day") & _
					  "' and month(timestamp) = '" & request.querystring("month") & _
					  "' and year(timestamp) = '" & request.querystring("year") & "' order by timestamp desc"
		
				set rs = cn.execute(sql)
				%><table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#CCFFCC">
					<tr>
						<td class="sectionheading" colspan=4>Hit-Count for 
						<a href="page_tracking.asp?groupby=day&guid=<%=Request.querystring("guid")%>&year=<%=request.querystring("year")%>&month=<%=request.querystring("month")%>">
						<%
						select case request.querystring("month")
							case 1 response.write "January"
							case 2 response.write "February"
							case 3 response.write "March"
							case 4 response.write "April"
							case 5 response.write "May"
							case 6 response.write "June"
							case 7 response.write "July"
							case 8 response.write "August"
							case 9 response.write "September"
							case 10 response.write "October"
							case 11 response.write "November"
							case 12 response.write "December"
						end select
						response.write " " & request.querystring("day") & ", " & request.querystring("year")%></a>
						</td>
					</tr>
					<tr>
						<td class="smallheading">Day</td>
						<td class="smallheading">Page Name</td>
						<td class="smallheading">Source IP</td>
					</tr>
					<%do until rs.EOF%>
						<tr>
							<td class="small"><center><%=rs.fields(1)%></tr>
							<td class="small"><center><%=rs.fields(0)%></tr>
							<td class="small"><center><%=rs.fields(2)%></tr>
						</tr>
						<%rs.MoveNext
					loop%>
				</table><%
			end if
		else
			sql = "SELECT Year(timestamp) AS [Year], Count(year(page_tracker.timestamp)) AS HitCount " & _
				  "FROM page_tracker GROUP BY year(page_tracker.timestamp) ORDER BY year(page_tracker.timestamp) DESC"
			set rs = cn.execute(sql)
			%><table width=605 cellpadding=0 cellspacing=0 border=1 bgcolor="#CCFFCC">
				<tr>
					<td class="sectionheading" colspan=4>Hit-Count Grouped by Year</td>
				</tr>
				<tr>
					<td class="smallheading">Year</td>
					<td class="smallheading">Hit-Count</td>
				</tr>
				<%do until rs.EOF%>
					<tr>
						<td class="small"><center><a href="page_tracking.asp?groupby=month&guid=<%=Request.querystring("guid")%>&year=<%=rs.fields(0)%>"><%=rs.fields(0)%></tr>
						<td class="small"><center><%=rs.fields(1)%></tr>
					</tr>
					<%rs.MoveNext
				loop%>
			</table><%
		end if
	else
		response.redirect "admin.asp?guid=" & Request.querystring("guid")
	end if
	
	sub Lookup_Locations
		sql = "SELECT SourceIP FROM page_tracker GROUP BY SourceIP, Location " & _
				"HAVING Location Is Null ORDER BY SourceIP"
		set rs = cn.execute(sql)
		do while not rs.eof	
			sPage = "http://localhost/realty/tools/tr.asp?ip="
			sPage = "http://www.hostip.info/index.html?spip="
			oHTTP.open "POST", sPage & rs("SourceIP"), false
			'oHTTP.SetRequestHeader "Content-type", "text/xml" 
			oHTTP.send ""
			Do while oHTTP.readyState<>4
			'Do Nothing
			loop
			if oHTTP.readyState=4 then
				sResponse = oHTTP.responseText
				lloc = instr(sResponse, "Location") + 13
				sLocation = mid(sResponse, lloc, instr(lloc, sResponse, "<") - lloc)
				if sLocation = " ... actually we haven't a clue." then
					sLocation = "unknown"
				end if
				sLocation = replace(sLocation, "UNITED STATES", "US")
				sLocation = replace(sLocation, "UNITED KINGDOM", "UK")
				sLocation = replace(sLocation, ", REPUBLIC OF", "")
				sLocation = replace(sLocation, "N FEDERATION", "")
				sLocation = lcase(sLocation)
			end if
			sql = "update page_tracker set location = '" & replace(sLocation, "'", "''") & "' where SourceIP = '" & rs("SourceIP") & "'"
			cn.execute sql
			rs.movenext
		loop
	end sub
%>