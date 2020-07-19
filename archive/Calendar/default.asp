<!--#include file="../includes/connection.asp"-->    
<%
set cn = server.createobject("adodb.connection")
cn.Mode = 3
cn.open sConnection
Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "select * from logins where guid = '" & Request.querystring("guid") & "'"
	set rs = cn.execute(sql)
	if rs("loggedin") and rs("enabled") then
	%>
	<link rel="stylesheet" type="text/css" href="../css/calendar_style.css">
	
	<!--#include file="connection.asp"-->    
	<%
	
	Dim objRecordset
	
	Set objRecordset = Server.CreateObject("ADODB.Recordset")
	Set rsAnniv = Server.CreateObject("ADODB.Recordset")
	set con = server.createobject("adodb.connection")
	con.open sConnection
	
	if request.querystring("cal") = "" then
		response.write "Must specify calendar name"
	else
		
		set objRecordset = con.execute("select * from main where cal_name = '" & request.querystring("cal") & "'")
		if objRecordset.eof then
			response.write "Must specify calendar name"
		else
			if Request.QueryString("date") = "" then
				Response.Redirect "default.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal") & "&date=" & date()
			end if
			%>
				<title><%=objRecordset("title")%></title>
				<!--#include file="../includes/advice-header.asp"-->    
	
			<%
			if objRecordset("Active") = false then
				%>
				<table border="0" cellspacing="0" cellpadding="0" width="540">
					<tr>
						<td>
							<span class='text'>
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								Sorry, this calendar is inactive.
								<br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								If you feel you shouldn't have gotten this message,
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								please contact Jess using the email link above. 
							</span>
						</td>
					</tr>
				</table>
				<%
			else
				if objRecordset("Private") = true then
					vCals2 = split(request.cookies("calendar"), ",")
					cal_found = false
					for x = 0 to ubound(vCals2) 
						if trim(vCals2(x)) = request.querystring("cal") then
							cal_found = true
						end if
					next
					if  request.cookies("Loggedin") = "true" and _
						((request.cookies("type") = "calendar" and _
						cal_found) or _
						(request.cookies("type") = "admin")) then
					else
						response.cookies("path") = request.servervariables("url") & "?" & request.servervariables("query_string")
			'			response.redirect "../tools/admin.asp"
					end if
				end if
				set objRecordset = con.execute("select * from calendar where active = true and cal_name = '" & request.querystring("cal") & "'")
				%>
				
				<%
				Function GetDaysInMonth(iMonth, iYear)
					Select Case iMonth
						Case 1, 3, 5, 7, 8, 10, 12
							GetDaysInMonth = 31
						Case 4, 6, 9, 11
							GetDaysInMonth = 30
						Case 2
							If IsDate("February 29, " & iYear) Then
								GetDaysInMonth = 29
							Else
								GetDaysInMonth = 28
							End If
					End Select
				End Function
				
				Function GetWeekdayMonthStartsOn(iMonth, iYear)
					GetWeekdayMonthStartsOn = WeekDay(CDate(iMonth & "/1/" & iYear))
				End Function
				
				Function SubtractOneMonth(dDate)
				Dim iDay, iMonth, iYear	
					iDay = Day(dDate)
					iMonth = Month(dDate)
					iYear = Year(dDate)
				
					If iMonth = 1 Then
						iMonth = 12
						iYear = iYear - 1
					Else
						iMonth = iMonth - 1
					End If
					
					If iDay > GetDaysInMonth(iMonth, iYear) Then iDay = GetDaysInMonth(iMonth, iYear)
				
					SubtractOneMonth = CDate(iMonth & "-" & iDay & "-" & iYear)
				End Function
				
				Function AddOneMonth(dDate)
				Dim iDay, iMonth, iYear	
					iDay = Day(dDate)
					iMonth = Month(dDate)
					iYear = Year(dDate)
				
					If iMonth = 12 Then
						iMonth = 1
						iYear = iYear + 1
					Else
						iMonth = iMonth + 1
					End If
					
					If iDay > GetDaysInMonth(iMonth, iYear) Then iDay = GetDaysInMonth(iMonth, iYear)
				
					AddOneMonth = CDate(iMonth & "-" & iDay & "-" & iYear)
				End Function
				
				
				Dim dDate     ' Date we're displaying calendar for
				Dim iDIM      ' Days In Month
				Dim iDOW      ' Day Of Week that month starts on
				Dim iCurrent  ' Variable we use to hold current day of month as we write table
				Dim iPosition ' Variable we use to hold current position in table
				
				If IsDate(Request.QueryString("date")) Then
					dDate = CDate(Request.QueryString("date"))
				Else
					If IsDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year")) Then
						dDate = CDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year"))
					Else
						dDate = Date()
				
						If Request.QueryString.Count > 1 Then
							Response.Write "The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>"
						End If
					End If
				End If
				
				iDIM = GetDaysInMonth(Month(dDate), Year(dDate))
				iDOW = GetWeekdayMonthStartsOn(Month(dDate), Year(dDate))
				%>
				
				<table border="1" cellspacing="0" cellpadding="0" class="calTable" width="700">
					<tr>
						<td align="center" colspan="7">
							<table class="CalHeading" width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr height=40>
									<td align="left"><a HREF="default.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&date=<%= SubtractOneMonth(dDate) %>"><img src="images/prevMonth.gif" border=0></a></td>
									<td align="center" class="CalHeading"><%= MonthName(Month(dDate)) & "  " & Year(dDate) %></td>
									<td align="right"><a HREF="default.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&date=<%= AddOneMonth(dDate) %>"><img src="images/NextMonth.gif" border=0></a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="CalDayHeading">
						<td ALIGN="center" width="14%">Sunday</td>
						<td ALIGN="center" width="14%">Monday</td>
						<td ALIGN="center" width="14%">Tuesday</td>
						<td ALIGN="center" width="15%">Wednesday</td>
						<td ALIGN="center" width="15%">Thursday</td>
						<td ALIGN="center" width="14%">Friday</td>
						<td ALIGN="center" width="14%">Saturday</td>
					</tr>
				<%
				If iDOW <> 1 Then
					Response.Write(vbTab & "<tr>" & vbCrLf)
					iPosition = 1
					Do While iPosition < iDOW
						Response.Write(vbTab & vbTab & "<td class='CalNoDay'>&nbsp;</td>" & vbCrLf)
						iPosition = iPosition + 1
					Loop
				End If
				
					'-- Write days of month in proper day slots --
				
				iCurrent = 1
				iPosition = iDOW
				
				Do While iCurrent <= iDIM
				
				
					'-- open the table row --
				
					If iPosition = 1 Then
						Response.Write(vbTab & "<tr bgcolor=white height=80>" & vbCrLf)
					End If
				
				
					'-- Write the date and subject --
		
					if year(request.querystring("date")) = year(date) and _
						month(request.querystring("date")) = month(date) and _
						icurrent = day(date) then
						sDayHeading = "CurrentDayHeading"
					else
						sDayHeading = "DayHeading"
					end if
					if icurrent = day(request.querystring("date")) and _
						year(dDate) = year(request.querystring("date")) and _
						month(dDate) = month(request.querystring("date")) then
						sCalDay = "CalToDay"
					else
						sCalDay = "CalDay"
					end if
					Response.Write vbTab & vbTab%>
					<td height=80 align=left valign=top class="<%=sCalDay%>">
						<table cellpadding=0 cellspacing=0 width="100%">
							<tr>
								<a href="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>&date=<%=month(request.querystring("date")) & "/" & icurrent & "/" & year(request.querystring("date"))%>&method=add">
									<td width="100%" class="<%=sDayHeading%>">
										<font face=Tahoma>
												<%=iCurrent%>
										</font>
									</td>
								</a>
							</tr>
						</table>
					<%
				
					If Not objRecordset.BOF Then
						objRecordset.MoveFirst
						Do Until objRecordset.EOF
				
							If year(objRecordset.Fields("EventDate")) = Year(dDate) or _
								objRecordset.Fields("repeats") = true Then
							    If month(objRecordset.Fields("EventDate")) = Month(dDate) Then
				
									If day(objRecordset.Fields("EventDate")) = iCurrent Then
										if objRecordset("Complete") = true then
											Response.Write("<li><span class='completecalevent'><a class='completecalevent' href='calendar_manager.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal") & "&pk=" & objRecordset("id") & "&date=" & request.querystring("date") & "'>" & objRecordset.Fields("Subject") & "</a></span>") 
										else
											Response.Write("<li><span class='calevent'><a class='calevent' href='calendar_manager.asp?guid=" & Request.querystring("guid") & "&cal=" & request.querystring("cal") & "&pk=" & objRecordset("id") & "&date=" & request.querystring("date") & "'>" & objRecordset.Fields("Subject") & "</a></span>") 
										end if
										if objRecordset.Fields("repeats") = true then
											this_year = year(objRecordset.Fields("EventDate"))
											sGift = ""
											if objRecordset("anniversary") = true then
												rsAnniv.open "select gift from gifts where AnniversaryYear = '" & cstr(datediff("y", this_year, year(request.querystring("Date")))) & "'", con
												if not rsAnniv.eof then
													sGift = rsAnniv.fields(0)
												end if
												rsAnniv.close
											end if
											if sGift > "" then
												if objRecordset("Complete") = true then
													Response.Write "<span class='completecalevent'> (" & datediff("y", this_year, year(request.querystring("Date"))) & " - " & sGift & ")</span>"
												else
													Response.Write "<span class='calevent'> (" & datediff("y", this_year, year(request.querystring("Date"))) & " - " & sGift & ")</span>"
												end if
											else
												if objRecordset("Complete") = true then
													Response.Write "<span class='completecalevent'> (" & datediff("y", this_year, year(request.querystring("Date"))) & ")</span>"
												else
													Response.Write "<span class='calevent'> (" & datediff("y", this_year, year(request.querystring("Date"))) & ")</span>"
												end if
											end if
										end if
										End If
							    End If
							End If
				
							objRecordset.MoveNext
				
						Loop
				
					End If
				
				
				
						Response.Write("</td>" & vbCrLf)
				
				
					'-- Close the table row --
				
					If iPosition = 7 Then
						Response.Write vbTab & "</tr>" & vbCrLf
						iPosition = 0
					End If
				
					
					'-- Increment variables --
				
					iCurrent = iCurrent + 1
					iPosition = iPosition + 1
				Loop
				
				If iPosition <> 1 Then
					Do While iPosition <= 7
						Response.Write(vbTab & vbTab & "<td class='calNoDay'>&nbsp;</td>" & vbCrLf)
						iPosition = iPosition + 1
					Loop
					Response.Write vbTab & "</TR>" & vbCrLf
				End If
				%>
				</table>
				
				
				<%
				objRecordset.Close
				Set objRecordset = Nothing
				%>
				<a id="button" href="calendar_manager.asp?guid=<%=Request.querystring("guid")%>&cal=<%=request.querystring("cal")%>">Edit Calendar</a>
				<%
			end if
		end if
	end if
else
	response.redirect "../tools/admin.asp?guid=" & Request.querystring("guid")
end if%>