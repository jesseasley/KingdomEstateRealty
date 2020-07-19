<%
if Request.ServerVariables("HTTP_Host") = "localhost" then
	sConnection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\wwwroot\Online_Data_Stores\calendar.mdb"
else
	sConnection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Hosting\6019076\html\Online_Data_Stores\calendar.mdb"
end if
%>