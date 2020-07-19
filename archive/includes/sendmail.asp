<!--#include file="connection.asp"-->    
<%
sub SendEmail(sToken, sFirstName, sLastName, sPhone, sEmail)
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection

	Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "select * from notifications where ftoken = '" & sToken & "'"
	set rs = cn.Execute(sql)
	if rs.eof then
		exit sub
	end if

	sHTMLBody = rs("fmessage")
	if sToken = "adminlogin" then
		sHTMLBody = replace(sHTMLBody, "<username>", request.cookies("username"))
	end if

	sTo = rs("fto")
	sTo = replace(sTo , "<FirstName>", sFirstName)
	sTo = replace(sTo , "<LastName>", sLastName)
	sTo = replace(sTo , "<Email>", sEmail)

	sHTMLBody = replace(sHTMLBody, "<FirstName>", sFirstName)
	sHTMLBody = replace(sHTMLBody, "<LastName>", sLastName)
	sHTMLBody = replace(sHTMLBody, "<Phone>", sPhone)
	sHTMLBody = replace(sHTMLBody, "<Email>", sEmail)
	sHTMLBody = replace(sHTMLBody, "<Domain>", Request.ServerVariables("HTTP_Host"))
		
	set xml = Server.CreateObject("Microsoft.XMLHTTP")
	sURL = "http://jesseasley.com/php/outside_email.php" & _
		   "?accesscode=alwayson&to=" & sTo  & _
		   "&from=" & rs("ffrom") & _
		   "&subject=" & rs("fsubject") & _
		   "&body=" & sHTMLBody

	xml.open "POST", sURL
	xml.send ""

end sub
%>	