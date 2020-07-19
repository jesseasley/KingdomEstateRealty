<%
	if request.form("Submit") = "Post Me" then
		response.cookies("cval") = request.form("cval")
		response.cookies("cval").expires = "1/1/2030"
		response.redirect "test.asp"
	else
		response.write "cookie value '" & request.cookies("cval") & "'<br><br>" & vbcrlf
		response.write "<form method=""post"" action=""savecookies.php"">" & vbcrlf
		response.write "<input type=""text"" name=""cval"">" & vbcrlf
		response.write "<input type=""submit"" name=""Submit"" value=""Post Me"">" & vbcrlf
		response.write "</form>"
	end if
%>

