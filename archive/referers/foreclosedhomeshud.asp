<!--#include file="../../includes/pagerecorder.asp"-->    
<%
	response.cookies("referer") = "HUD Foreclosed Homes"
	response.cookies("refererdomain") = "foreclosedhomeshud.com"
	response.redirect "/realty/default.asp"
%>