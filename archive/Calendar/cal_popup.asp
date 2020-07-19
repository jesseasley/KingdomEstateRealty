<%@ Language = VBSCRIPT %>
<% Option Explicit %>

<%
'
'  © 2004-2005 SixSide.com All Rights Reserved
'  If you use this code on your website, please link back to SixSide.com with the following code:
'
' <a href="http://www.sixside.com/asp_date_picker_calendar.asp">Date Picker Calendar provided by SixSide.com</a>
'
%>

<%
Dim varDate, varCurrentDate, varFormName, varFieldName
varDate = Date()
if IsDate(Request.QueryString("Date")) then varDate = Request.QueryString("Date")
if IsDate(Request.QueryString("CurrentDate")) then varCurrentDate = Request.QueryString("CurrentDate")
varFormName = Request.QueryString("FormName")
varFieldName = Request.QueryString("FieldName")

Dim DateDay, DateMonth, DateYear
DateDay = DatePart("d",varDate)
DateMonth = DatePart("m",varDate)
DateYear = DatePart("yyyy",varDate)

Dim PrevMonthName, ThisMonthName, NextMonthName

PrevMonthName = MonthName(DatePart("m",DateAdd("m","-1",varDate)))
ThisMonthName = MonthName(DateMonth)
NextMonthName = MonthName(DatePart("m",DateAdd("m","1",varDate)))

Dim FirstOfMonth, FirstDayOfMonth, FirstCalendarDate
if (Session.LCID = 2057) then
	FirstOfMonth = FormatDateTime("1/"&DateMonth&"/"&DateYear&"")
else
	FirstOfMonth = FormatDateTime(""&DateMonth&"/1/"&DateYear&"")
end if
FirstDayOfMonth = DatePart("w",FirstOfMonth)
FirstCalendarDate = DateAdd("d",-(FirstDayOfMonth-1),FirstOfMonth)

Dim TodayYearNumber, TodayMonthName, TodayDateNumber, varToday
TodayYearNumber = DatePart("yyyy",Date())
TodayMonthName = MonthName(DatePart("m",Date()))
TodayDateNumber = DatePart("d",Date())
if (CInt(TodayDateNumber) < 10) then TodayDateNumber = "0"&TodayDateNumber&""
varToday = Date()

if IsDate(varCurrentDate) then
'response.write varCurrentDate
'response.end
	Dim CurrentDateYearNumber, CurrentDateMonthName, CurrentDateNumber
	CurrentDateYearNumber = DatePart("yyyy",varDate)
	CurrentDateMonthName = MonthName(DatePart("m",varDate))
	CurrentDateNumber = DatePart("d",varDate)
	if (CInt(CurrentDateNumber) < 10) then CurrentDateNumber = "0"&CurrentDateNumber&""
end if

'if IsDate(varCurrentDate) then
'	Dim CurrentDateYearNumber, CurrentDateMonthName, CurrentDateNumber
'	CurrentDateYearNumber = DatePart("yyyy",varCurrentDate)
'	CurrentDateMonthName = MonthName(DatePart("m",varCurrentDate))
'	CurrentDateNumber = DatePart("d",varCurrentDate)
'	if (CInt(CurrentDateNumber) < 10) then CurrentDateNumber = "0"&CurrentDateNumber&""
'end if

Dim DayOfWeek, DayNameOfWeek, DateNumber
Dim ThisDate, ThisYearNumber, ThisDateMonth, ThisDateMonthName
ThisDate = FirstCalendarDate
DayOfWeek = DatePart("w",ThisDate)

Dim weeks, cells, days, classname, idname, i
weeks = 1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Calendar</title>
<!--#include file="inc/cal_style.asp"-->
<script type="text/javascript" src="inc/goto_url.js"></script>
<link rel="stylesheet" type="text/css" href="file:///C:/Users/jess/Desktop/test%20site/css/new_page_1.css">
</head>
<body>

<!--
© 2004-2005 SixSide.com All Rights Reserved
If you use this code on your website, please link back to SixSide.com with the following code:

<a href="http://www.sixside.com/asp_date_picker_calendar.asp">Date Picker Calendar provided by SixSide.com</a>
-->

<form id="FormName" method="get" action="">
<table cellspacing="0" id="calendar">
	<tr class="title">
	<th colspan="7"><%=ThisMonthName%>&nbsp;<%=DateYear%></th>
	</tr>
	<tr class="subtitle">
	<th id="lastyear"><a href="cal_popup.asp?Date=<%=DateAdd("yyyy",-1,varDate)%>&amp;FormName=<%=varFormName%>&amp;FieldName=<%=varFieldName%>&amp;CurrentDate=<%=varCurrentDate%>" title="Previous Year">&lt;&lt;</a></th>
	<th id="lastmonth"><a href="cal_popup.asp?Date=<%=DateAdd("m",-1,varDate)%>&amp;FormName=<%=varFormName%>&amp;FieldName=<%=varFieldName%>&amp;CurrentDate=<%=varCurrentDate%>" title="Previous Month">&lt;</a></th>
	<th colspan="3">
	<select name="Month" onchange="goto_URL(this.form.Month)">
	<%
	for i = 1 to 12
	%>
	<option value="cal_popup.asp?Date=<%=i%>/1/<%=DateYear%>&amp;FormName=<%=varFormName%>&amp;FieldName=<%=varFieldName%>&amp;CurrentDate=<%=varCurrentDate%>" <% if (i = DatePart("m",varDate)) then %> selected="selected"<% end if %>><%=MonthName(i)%></option>
	<%
	next
	%>
	</select>
	</th>
	<th id="nextmonth"><a href="cal_popup.asp?Date=<%=DateAdd("m",1,varDate)%>&amp;FormName=<%=varFormName%>&amp;FieldName=<%=varFieldName%>&amp;CurrentDate=<%=varCurrentDate%>" title="Next Month">&gt;</a></th>
	<th id="nextyear"><a href="cal_popup.asp?Date=<%=DateAdd("yyyy",1,varDate)%>&amp;FormName=<%=varFormName%>&amp;FieldName=<%=varFieldName%>&amp;CurrentDate=<%=varCurrentDate%>" title="Next Year">&gt;&gt;</a></th>
	</tr>
	<tr id="days">
	<%
	for days = 1 to 7
	DayNameOfWeek = WeekdayName(days)
	%>
	<th class="<%=Left(DayNameOfWeek,3)%>"><%=Left(DayNameOfWeek,3)%></th>
	<%
	next
	%>
	</tr>
	<%
	for cells = 1 to 42
	DayOfWeek = DatePart("w",ThisDate)
	DayNameOfWeek = WeekdayName(DayOfWeek)
	ThisDateMonth = DatePart("m",ThisDate)
	ThisDateMonthName = MonthName(ThisDateMonth)
	ThisYearNumber = DatePart("yyyy",ThisDate)
	DateNumber = DatePart("d",ThisDate)
	if (CInt(DateNumber) < 10) then DateNumber = "0"&DateNumber&""
	
	classname = ""&Left(ThisDateMonthName,3)&" "&Left(DayNameOfWeek,3)&""
	idname = ""&Left(ThisDateMonthName,3) & DateNumber & ThisYearNumber &""
	%>
	
	<% if (CInt(DayOfWeek) = 1) then %>
	<tr id="week<%=weeks%>">
	<% end if %>
	
	<td class="<%=LCase(classname)%>" id="<%=LCase(idname)%>"><a href="javascript:;" onclick="opener.document.getElementById('<%=varFieldName%>').value='<%=FormatDateTime(ThisDate)%>'; window.close();" title="<%=FormatDateTime(ThisDate,1)%>" class="CalDate"><%=DateNumber%></a></td>
	
	<% if (CInt(DayOfWeek) = 7) then %>
	</tr>
	<%
	weeks = (weeks + 1)
	end if
	%>
	
	<%
	ThisDate = DateAdd("d",1,ThisDate)
	next
	%>

</table>
</form>
</body>
</html>
