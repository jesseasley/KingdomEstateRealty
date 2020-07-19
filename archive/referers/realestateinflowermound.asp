<!--#include file="../../includes/pagerecorder.asp"-->    
<%
	response.cookies("referer") = "Real Estate in Flower Mound"
	response.cookies("refererdomain") = "realestateinflowermound.com"
	response.redirect "/realty/default.asp"
%>