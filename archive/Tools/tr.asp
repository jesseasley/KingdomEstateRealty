<html>
<!--#include file="../includes/connection.asp"-->    
<link rel="stylesheet" type="text/css" href="file:///C:/Users/jess/Desktop/test%20site/css/new_page_1.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>TraceRoute IP Lookup</title>
</head>

<body <%if request.querystring("ip") > "" then%>onload="javascript:frm.submit()"<%end if%>>
<FORM name="frm" ACTION = "http://whatismyipaddress.com/staticpages/index.php/tools-visual-traceroute-results" METHOD="POST">
<INPUT TYPE="hidden" NAME="LOOKUPADDRESS" VALUE="<%=request.querystring("ip")%>" SIZE=20>
</FORM>

<%
if request.querystring("ip") = "" then
	dim oHTTP
	set oHTTP = server.createobject("Microsoft.XMLHTTP")
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	
	sql = "update page_tracker set location = null"
	cn.Execute sql
	sql = "SELECT SourceIP FROM page_tracker GROUP BY SourceIP, Location " & _
			"HAVING Location Is Null ORDER BY SourceIP"
	set rs = cn.execute(sql)
	sPage = "http://localhost/realty/tools/tr.asp?ip="
	sPage = "http://www.hostip.info/index.html?spip="
	sPage = "http://www.ip2location.com/free.asp?ipaddresses="
	sPage = "http://www.ip-adress.com/ipaddresstolocation/?QRY="
	do while not rs.eof	
		oHTTP.open "GET", sPage & rs("SourceIP"), false
		response.write sPage & rs("SourceIP") & "<br>"
		oHTTP.send ""
		Do while oHTTP.readyState<>4
		'Do Nothing
		loop
		if oHTTP.readyState=4 then
			sResponse = oHTTP.responseText
			lloc = instr(sResponse, "IP address country") 
			lloc = instr(lloc + 1, sResponse, "address flag") + 14
			sCountry = mid(sResponse, lloc, instr(lloc, sResponse, "<") - lloc)
			sCountry = trim(replace(sCountry, vbtab, ""))
			lloc = instr(sResponse, "IP address state") 
			lloc = instr(lloc + 1, sResponse, "<td>") + 4
			sState = mid(sResponse, lloc, instr(lloc, sResponse, "<") - lloc)
			lloc = instr(sResponse, "IP address city") 
			lloc = instr(lloc + 1, sResponse, "<td>") + 4
			sCity = mid(sResponse, lloc, instr(lloc, sResponse, "<") - lloc)
			lloc = instr(sResponse, "ISP of this IP") 
			lloc = instr(lloc + 1, sResponse, "<td>") + 4
			sISP = mid(sResponse, lloc, instr(lloc, sResponse, "<") - lloc)
			lloc = instr(sResponse, "Organization:") 
			lloc = instr(lloc + 1, sResponse, "<td>") + 4
			sOrganization = mid(sResponse, lloc, instr(lloc, sResponse, "<") - lloc)
			sLocation = "Organization: " & sOrganization & "<br>" & _
				"ISP: " & sISP & "<br>" & _
				"Location: " & sCity & ", " & sState & ", " & sCountry & "<br>"
			response.write "<span class='text'>" & rs("SourceIP") & "<bR>"
			response.write sLocation & "</span><br>"
			response.write sResponse
			response.end
			response.flush
		end if
		sql = "update page_tracker set location = '" & sLocation & "' where SourceIP = '" & rs("SourceIP") & "'"
'		cn.execute sql
		rs.movenext
	loop

	set oHTTP = nothing
	Set rs = nothing
	set cn = nothing
end if
%>

</body>
<!--<script>window.close();</script>-->
</html>
