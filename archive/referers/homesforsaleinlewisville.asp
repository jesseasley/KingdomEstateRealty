<!--#include file="../../includes/pagerecorder.asp"-->    
<%
	response.cookies("referer") = "Homes For Sale in Lewisville"
	response.cookies("refererdomain") = "homesforsaleinlewisville.com"
	response.redirect "/realty/default.asp"
%>