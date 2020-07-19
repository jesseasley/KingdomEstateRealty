<!--#include file="../../includes/pagerecorder.asp"-->    
<%
	response.cookies("referer") = "Flower Mound Listings"
	response.cookies("refererdomain") = "flowermoundlistings.com"
	response.redirect "/realty/default.asp"
%>