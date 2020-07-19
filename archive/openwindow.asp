<%
found = false
if instr(Request.ServerVariables("query_string"), "http://maps.google.com/maps?q=") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.realtor.com") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://easley-realty.blogspot.com") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.visualtour.com/showvt.asp?t=") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://flowermound.century21judgefite.com/") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.century21judgefite.com/3/W0000015367/P0000290998.htm") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.weather.com/outlook/travel/businesstraveler/tenday/75028?from=hrly_topnav_business") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.flower-mound.com/") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.bestplaces.net/zip-code/Flower_Mound_TX-77502200000.aspx") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://nces.ed.gov/surveys/libraries/librarysearch/library_list.asp?Search=1&Zip=75022&Miles=15") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.greatschools.net/modperl/bycity/TX/?stateselect=TX&name=&market=&rating=&fuzzy=1&city=Flower%20Mound&schlname=&link=") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://capwiz.com/yo-demo/state/main/?state=TX&azip=75022&view=myofficials") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.cityoflewisville.com/") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.bestplaces.net/zip-code/Lewisville_TX-77502900000.aspx") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://nces.ed.gov/surveys/libraries/librarysearch/library_list.asp?Search=1&Zip=75029&Miles=15") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.greatschools.net/modperl/bycity/TX/?stateselect=TX&name=&market=&rating=&fuzzy=1&city=Lewisville&schlname=&link=") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://capwiz.com/yo-demo/state/main/?state=TX&azip=75029&view=myofficials") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.highlandvillage.org/") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.bestplaces.net/city/Highland_Village_TX-54833848000.aspx") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://www.greatschools.net/modperl/bycity/TX/?stateselect=TX&name=&market=&rating=&fuzzy=1&city=Highland%20Village&schlname=&link=") then
	found = true
elseif instr(Request.ServerVariables("query_string"), "http://capwiz.com/yo-demo/state/main/?state=TX&azip=&view=myofficials") then
	found = true
end if
i = instr(Request.ServerVariables("query_string"), "?url=")
if found then
	%>
	<!--#include file="includes/pagerecorder.asp"-->    
	<%
	Response.Redirect mid(Request.ServerVariables("query_string"), i+5)
else
%>
	<body onload="window.close()">
	"<%=mid(Request.ServerVariables("query_string"), i+5)%>" is not a valid OpenWindow parameter.
<%
end if
%>