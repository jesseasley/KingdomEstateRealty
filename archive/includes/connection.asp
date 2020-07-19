<%
if Request.ServerVariables("HTTP_Host") = "localhost" then
	sConnection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\wwwroot\Online_Data_Stores\easley-realtysub.mdb"
else
'	sConnection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=d:\Inetpub\virtual\jecri\db\easley-realtysub.mdb"
	sConnection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Hosting\6019076\html\Online_Data_Stores\easley-realtysub.mdb"
end if
%>
