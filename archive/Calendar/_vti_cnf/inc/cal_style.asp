
<%
'
'  © 2004-2005 SixSide.com All Rights Reserved
'  If you use this code on your website, please link back to SixSide.com with the following code:
'
' <a href="http://www.sixside.com/asp_date_picker_calendar.asp">Date Picker Calendar provided by SixSide.com</a>
'
%>

<style type="text/css">
body {margin: 0; font: normal 100% Verdana, Arial, Helvetica, sans-serif}
table#calendar a {text-decoration: none; display: block; font-size: 70%;margin: 0;color: navy;}
table#calendar a.CalDate {font-size:10pt;font-weight:bold;}
table#calendar a.CalDate:hover {text-decoration:underline;}
table#calendar tr#days th {font-weight: bold; font-size: 70%; color: #EEE; background: #000; text-align: center; padding: 1px 0.33em; width: 35px;}
table#calendar tr.title th {font-weight: bold;background:#36F;color:#FFF;}
table#calendar tr.subtitle th {background: #EBF8FF; border: 1px solid #242;}
select {font-weight: bold; font-size:8pt;}
table#calendar td {color: #777; text-align: center; border: 1px solid gray; border-color: #BBB #EEE #EEE #BBB; height: 25px; background: #FFF;}
table#calendar td.sat {border-right: 1px solid #BBB;}
table#calendar td.sat, table#calendar td.sun {background: #EBF8FF;}
table#calendar td.<%=LCase(Left(PrevMonthName,3))%>, table#calendar td.<%=LCase(Left(NextMonthName,3))%> {background: #CCC; border: 1px solid #AAB;	border-right-color: #99A;}
table#calendar tr#week6 td {border-bottom: 2px solid #AAB;}
table#calendar td#<%=LCase(Left(TodayMonthName,3))%><%=TodayDateNumber%><%=TodayYearNumber%> {background-color: yellow; border: 1px solid black;}

<% if (IsDate(Request.QueryString("CurrentDate")) = true) then %>
table#calendar td#<%=LCase(Left(CurrentDateMonthName,3))%><%=CurrentDateNumber%><%=CurrentDateYearNumber%> a {font-weight: bold;}
<% end if %>
</style>