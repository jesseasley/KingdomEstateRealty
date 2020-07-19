<!--#include file="../../includes/pagerecorder.asp"-->    
<%
	response.cookies("referer") = "Easley Realty"
	response.cookies("refererdomain") = "easley-realty.com"
	response.redirect "/realty/default.asp"
%>