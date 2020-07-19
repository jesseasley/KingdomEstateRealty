<!--#include file="connection.asp"-->    
<%

b_record = true
if Request.ServerVariables("REMOTE_ADDR") = "71.252.254.24" then 'home
'	b_record = false
end if
if Request.ServerVariables("REMOTE_ADDR") = "216.201.203.1" then 'work
'	b_record = false
end if
if Request.ServerVariables("REMOTE_ADDR") = "65.36.241.79" then 'robot
'	b_record = false
end if
if Request.ServerVariables("REMOTE_ADDR") = "127.0.0.1" then 'localhost
'	b_record = false
end if
if lcase(Request.ServerVariables("URL")) = "/realty/tools/page_tracking.asp" then 'this is me
'	b_record = false
end if
if lcase(Request.ServerVariables("URL")) = "/realty/forum.asp" and _
	lcase(left(Request.ServerVariables("query_string"), 4)) = "ask=" and _
	lcase(mid(Request.ServerVariables("query_string"), 5)) <> "true" then   'hackers
	b_record = false
end if

'response.write b_record
if b_record then
	set cn = Server.CreateObject("ADODB.Connection")
	cn.Mode = 3
	cn.open sConnection
	sql = "insert into page_tracker (pagename, SourceIP, SourceHost, SourceUser) values ('" & _
		Request.ServerVariables("URL")
		if Request.ServerVariables("QUERY_STRING") > "" then
			sql = sql & "?" & Request.ServerVariables("QUERY_STRING") 
		end if
		sql = sql & "', '" & _
		Request.ServerVariables("REMOTE_ADDR") & "', '" & _
		Request.ServerVariables("REMOTE_HOST") & "', '" & _
		Request.ServerVariables("REMOTE_USER") & "')"
	'	cn.Execute sql
end if
%>
