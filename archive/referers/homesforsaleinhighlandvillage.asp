<!--#include file="../../includes/pagerecorder.asp"-->    
<%
	response.cookies("referer") = "Homes For Sale in Highland Village"
	response.cookies("refererdomain") = "homesforsaleinhighlandvillage.com"
	response.redirect "/realty/default.asp"
%>