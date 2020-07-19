//
//  © 2004-2005 SixSide.com All Rights Reserved
//  If you use this code on your website, please link back to SixSide.com with the following code:
//
// <a href="http://www.sixside.com/asp_date_picker_calendar.asp">Date Picker Calendar provided by SixSide.com</a>
//

function winBRopen(theURL, Name, popW, popH, scroll, resize, vform) { // V 1.0
	var winleft = (screen.width - popW) / 2;
	var winUp = (screen.height - popH) / 2;
	winProp = 'width='+popW+',height='+popH+',left='+winleft+',top='+winUp+',scrollbars='+scroll+',resizable='+resize+'';
	if (vform=='form3')
		theURL = theURL + '&Date=' + form3.EventDate.value;
	Win = window.open(theURL, Name, winProp);
	Win.window.focus();
}

