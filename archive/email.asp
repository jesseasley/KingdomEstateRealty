<!--#include file="includes/sendsingleemail.asp"-->    
<!--#include file="includes/header.asp"-->    
<%
if request.form("sendButton") = "Send" then
'response.write "sending mail"
	SendEmail request.form("subjectText"), request.form("bodyTextArea")
%>
	<table border="0" width="540" cellspacing="0" cellpadding="0" height="260">
		<tr height=20>
		</tr>
		<tr>
			<td></td>
			<td class="smallheading" valign=top>
				Thanks for the e-mail.
				<br><br>
				Please click <a href="default.asp">here</a> to return to the main page.
			</td>
		</tr>
	</table>
<%
else
%>
	<form method="POST" action="" id="form1" name="form1">
		<table border="0" width="540" cellspacing="0" cellpadding="0">
			<tr height=20>
			</tr>
			<tr>
				<td colspan=3>
					<table border=0>
						<tr>
							<td width=1></td>
							<td width=1></td>
							<td class="pageheading">
								<br>Send me an eMail<br><br>
							</td>
						</tr>
						<tr>
							<td width=1></td>
							<td width=1></td>
							<td class="sectionheading">
								Please enter your comments below and press the <br>Send button.
							</td>
						</tr>
						<tr>
							<td width=1></td>
							<td width=1></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width=7></td>
							<td width=1 class="smallheading" align=right valign=top>Subject:</td>
							<td class="text">
							<input type=text name="subjectText" class="text" size="65"></td>
						</tr>
						<tr>
							<td width=1></td>
							<td width=1 align=right valign=top class="smallheading">Message:</td>
							<td class="text">
							<textarea rows="12" name="bodyTextArea" cols="65" class="text"></textarea></td>
						</tr>
						<tr>
							<td width=10></td>
							<td width=1></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width=1></td>
							<td width=1></td>
							<td align="right">
							<input type="hidden" value="Send" name="sendButton">
							<a href="javascript:form1.submit()" id="button">Send</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
<%
end if
%><!--#include file="includes/footer.asp"-->