<!--#include file="includes/header.asp"-->    
<!--#include file="includes/connection.asp"-->    
<!--#include file="includes/sendmail.asp"-->    
<table cellpadding=0 cellspacing=0 border=0 width="540">
	<tr>
		<td width=7>
		</td>
		<td valign=top>
<%
if Request.Form("SaveButton") = "Save Opinion" then
	sql = "insert into survey (q1, q2, q3, q4, q5, q6, q7, q8, q9, q10) values (" & _
	"""" & replace(Request.form("q1_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q2_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q3_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q4_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q5_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q6_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q7_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q8_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q9_value"), """", """""") & """, " & _
	"""" & replace(Request.form("q10_value"), """", """""") & """)"
	'Response.Write sql
	Set rs = Server.CreateObject("ADODB.Recordset")
	set cn = server.createobject("adodb.connection")
	cn.Mode = 3
	cn.open sConnection
	cn.execute sql
	sendemail "newsurvey", "", "", "", ""
	%>
	<span class="sectionheading">
		We appreciate you sharing your opinion.
		<br><br>
		Thank you.
		<br><br>
		Please click <a class="sectionheading" href="default.asp">>>here<<</a> to return to the main page.
	</span>
	<!--<meta http-equiv="refresh" content="5;url=default.asp">-->
	<%
else
	%>
	<span class="pageheading">Customer Survey</span><br><br>
	<span class="sectionheading">Please fill out our survey, your opinion is valuable to us.</span><br><br>
	<form method=post action="survey.asp" id=form1 name=form1>
		<span class="text">How did you learn of our site?<br>
		<select class="text" multiple="true" name="q1_value">
			<option value="colleague">Recommendation from a colleague</option>
			<option value="newspaper">Advertisement in a newspaper or magazine</option>
			<option value="radio">Advertisement on radio or television</option>
			<option value="Conference">Conference or trade show</option>
			<option value="Search engine">Search engine</option>
			<option value="email">Informational email or newsletter</option>
			<option value="Other">Other</option>
		</select>

		<br><br>
		<span class="text">
			If you used a search engine to find us, please select the one you used to do so:<br>
		</span>
		<input class="text" type="radio" value="Yahoo" name="q2_value">Yahoo<br>
		<input class="text" type="radio" value="Google" name="q2_value">Google<br>
		<input class="text" type="radio" value="AOL" name="q2_value">AOL<br>
		<input class="text" type="radio" value="MSN" name="q2_value">MSN<br>
		<input class="text" type="radio" value="AskJeeves" name="q2_value">AskJeeves<br>
		<input class="text" type="radio" value="Lycos" name="q2_value">Lycos<br>
		<input class="text" type="radio" value="Other" name="q2_value">Other<br><br>

		<span class="text">
			Through the search engine, what word or phrase did you type in for your search?<br>
		</span>
		<input type="text" value="" name="q3_value"><br><br>

		<span class="text">
			In the last 30 days, how many times have you visited this site?<br>
		</span>
		<input class="text" type="radio" value="This is my first time" name="q4_value"=>This is my first time<br>
		<input class="text" type="radio" value="2 to 3 times" name="q4_value">2 to 3 times<br>
		<input class="text" type="radio" value="3 to 5 times" name="q4_value">3 to 5 times<br>
		<input class="text" type="radio" value="5 to 10 times" name="q4_value">5 to 10 times<br>
		<input class="text" type="radio" value="More than 10 times" name="q4_value">More than 10 times<br><br>

		<span class="text">
			Based on a one week time frame, how many hours do you spend browsing and exploring this site?<br>
		</span>
		<input class="text" type="radio" value="Less than 30 minutes" name="q5_value">Less than 30 minutes<br>
		<input class="text" type="radio" value="30 minutes to an hour" name="q5_value">30 minutes to an hour<br>
		<input class="text" type="radio" value="1 hour to 5 hours" name="q5_value">1 hour to 5 hours<br>
		<input class="text" type="radio" value="5 to 10 hours" name="q5_value">5 to 10 hours<br>
		<input class="text" type="radio" value="More than 10 hours" name="q5_value">More than 10 hours<br>
		<input class="text" type="radio" value="Not applicable" name="q5_value">Not applicable<br><br>

		<span class="text">
			How likely are you to return to this site again?<br>
		</span>
		<input class="text" type="radio" value="Very likely" name="q6_value">Very likely<br>
		<input class="text" type="radio" value="Somewhat likely" name="q6_value">Somewhat likely<br>
		<input class="text" type="radio" value="Undecided" name="q6_value">Undecided<br>
		<input class="text" type="radio" value="Somewhat unlikely" name="q6_value">Somewhat unlikely<br>
		<input class="text" type="radio" value="Very unlikely" name="q6_value">Very unlikely<br><br>

		<span class="text">
			What was the main reason for visiting our site?<br>
		</span>
		<select class="text" multiple="true" name="q7_value">
			<option value="products">Obtaining information on products or services</option>
			<option value="company">Obtaining information on the company</option>
			<option value="employment">Seeking employment listings</option>
			<option value="investor">Seeking investor information</option>
			<option value="personal">Accessing personal account</option>
			<option value="Other">Other</option>
		</select><br><br>

		<span class="text">
			Overall, how satisfied are you with your visit to the Website?<br>
		</span>
		<input class="text" type="radio" value="Satisfied" name="q8_value">Satisfied<br>
		<input class="text" type="radio" value="Somewhat Satisfied" name="q8_value">Somewhat Satisfied<br>
		<input class="text" type="radio" value="Neutral" name="q8_value">Neutral<br>
		<input class="text" type="radio" value="Somewhat Dissatisfied" name="q8_value">Somewhat Dissatisfied<br>
		<input class="text" type="radio" value="Dissatisfied" name="q8_value">Dissatisfied<br><br>

		<span class="text">
			What did you like/dislike the most about our website?<br>
		</span>
		<textarea class="text" name="q9_value" rows=4 cols=60></textarea><br><br>

		<span class="text">
			Are there any improvements you would like to suggest?<br>
		</span>
		<textarea class="text" name="q10_value" rows=4 cols=60></textarea><br><br>

		<input type=hidden value="Save Opinion" name=SaveButton>
		<a href="javascript:form1.submit()" id="button">Save Opinion</a>
		<br><br>

		<center>
		<span class="legal">
			Any information collected and processed is treated with the utmost confidentiality. <br>
			We will not sell or rent out any personal information gathered from clients.
		</span>
</span>
	</form>
	<%
end if
%>		
</td></tr></table>		
<!--#include file="includes/footer.asp"-->
