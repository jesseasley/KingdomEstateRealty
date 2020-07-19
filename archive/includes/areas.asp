<!--#include file="connection.asp"-->    
<table border=0 cellpadding=0 cellspacing=0 width="100%">
<%
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	sql = "select * from areas"
	set rs = cn.execute(sql)
	if not rs.eof then
%>
	<tr>
		<td colspan=3>
			<span class="smallheading">
				Specializing in these Areas:		
			</span>
		</td>	
	</tr>
<%
	end if
	do while not rs.eof
%>
	<tr>
		<td class="text">
			<ul style="margin-top: 0px; margin-bottom: 0px">
				<li>
					<%=rs("area")%>
				</li>
			</ul>
		</td>
	</tr>
<%
	rs.movenext
	loop
%>
</table>

