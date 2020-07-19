<%@ Language = VBSCRIPT %>
<% Option Explicit %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Date Picker Calendar - ASP, JavaScript, CSS</title>
	<script type="text/javascript" src="inc/popupWindow.js"></script>
<link rel="stylesheet" type="text/css" href="file:///C:/Users/jess/Desktop/test%20site/css/new_page_1.css">
</head>

<body>

<!--
© 2004-2005 SixSide.com All Rights Reserved
If you use this code on your website, please link back to SixSide.com with the following code:

<a href="http://www.sixside.com/asp_date_picker_calendar.asp">Date Picker Calendar provided by SixSide.com</a>
-->
				
<form>
<fieldset>
	<legend>Example ASP/JavaScript Date Picker</legend>
	<label for="SelectedDate"><em>Selected Date</em></label>
	<input type="text" name="SelectedDate" id="SelectedDate" maxlength="10" size="8" />
	<a href="javascript:;" onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=SelectedDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')"><img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>			
</fieldset>
</form>
				

</body>
</html>