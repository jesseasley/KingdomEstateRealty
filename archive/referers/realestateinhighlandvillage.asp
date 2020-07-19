<!--#include file="../../includes/pagerecorder.asp"-->    
<%
	response.cookies("referer") = "Real Estate in Highland Village"
	response.cookies("refererdomain") = "realestateinhighlandvillage.com"
	response.redirect "/realty/default.asp"
%>