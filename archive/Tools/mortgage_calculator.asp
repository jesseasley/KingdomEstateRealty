<!--#include file="../includes/header.asp"-->    
<table><tr height=7><td /></tr><tr><td width=7 /><td>
<%
if Request.Form("btnCalculate") = "Calculate" then
	lInt = clng(Request.Form("cboInterestRate"))
	if trim(Request.Form("txtPropertyValue")) > "" and isnumeric(Request.Form("txtPropertyValue")) then
		lPropVal = clng(Request.Form("txtPropertyValue"))
		valid = true
	else
		lPropVal = 0
'		valid = false
	end if
	if trim(Request.Form("txtDownpayment")) > "" and isnumeric(Request.Form("txtDownpayment")) and valid = true then
		lDown = clng(Request.Form("txtDownpayment"))
	else
		lDown = 0
'		valid = false
	end if
	sTerm = csng(Request.Form("cboLoanTerm"))
	sRate = csng(Request.Form("cboInterestRate")) / 100000
	if valid = true then
		sPcntDown = lDown / lPropVal
		sMonthlyPayment = formatnumber((sRate/12+(sRate/12/(((1+sRate/12)^sTerm)-1)))*(lPropVal-lDown), 2)
	end if
end if
%>
<form name="frmMortCalc" method="post" action="mortgage_calculator.asp">
	<table border=0 width=500>
		<tr>
			<td class="pageheading" colspan=2>
				Mortgage Calculator<br><br>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<span class="sectionheading">Monthly Mortgage Payment Calculator</span><hr>
			</td>
		</tr>
		<tr>
			<td class="text" width=100>
				Property Value
			</td>
			<td class="text" width=350>
				<input class="text" type=text value="<%=Request.Form("txtPropertyValue")%>" name=txtPropertyValue>
				<%
					if Request.Form("txtPropertyValue") > "" and not isnumeric(Request.Form("txtPropertyValue")) then
						Response.Write "<font color=#FF0000>not numeric</font>"
					end if
				%>
			</td>
		</tr>
		<tr>
			<td class="text">
				Down Payment
			</td>
			<td>
				<input class="text" type=text value="<%=Request.Form("txtDownpayment")%>" name=txtDownpayment>
				<%
					if Request.Form("txtDownpayment") > "" and not isnumeric(Request.Form("txtDownpayment")) then
						Response.Write "<font color=#FF0000>not numeric</font>"
					end if
				%>
			</td>
		</tr>
		<tr>
			<td class="text">
				Loan Term
			</td>
			<td>
				<select class="text" name="cboLoanTerm">
					<option value="180"<%if Request.Form("cboLoanTerm") = "180" then%> selected<%end if%>>15 years</option>
					<option value="240"<%if Request.Form("cboLoanTerm") = "240" then%> selected<%end if%>>20 years</option>
					<option value="360"<%if Request.Form("cboLoanTerm") = "360" or Request.Form("cboLoanTerm") = "" then%> selected<%end if%>>30 years</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="text">
				Interest Rate
			</td>
			<td>
				<select class="text" name="cboInterestRate">
					<option value="2000"<%if Request.Form("cboInterestRate") = "2000" then%> selected<%end if%>>2.00%</option>
					<option value="2125"<%if Request.Form("cboInterestRate") = "2125" then%> selected<%end if%>>2.125%</option>
					<option value="2250"<%if Request.Form("cboInterestRate") = "2250" then%> selected<%end if%>>2.25%</option>
					<option value="2375"<%if Request.Form("cboInterestRate") = "2375" then%> selected<%end if%>>2.375%</option>
					<option value="2500"<%if Request.Form("cboInterestRate") = "2500" then%> selected<%end if%>>2.50%</option>
					<option value="2625"<%if Request.Form("cboInterestRate") = "2625" then%> selected<%end if%>>2.625%</option>
					<option value="2750"<%if Request.Form("cboInterestRate") = "2750" then%> selected<%end if%>>2.75%</option>
					<option value="2875"<%if Request.Form("cboInterestRate") = "2875" then%> selected<%end if%>>2.875%</option>
					<option value="3000"<%if Request.Form("cboInterestRate") = "3000" then%> selected<%end if%>>3.00%</option>
					<option value="3125"<%if Request.Form("cboInterestRate") = "3125" then%> selected<%end if%>>3.125%</option>
					<option value="3250"<%if Request.Form("cboInterestRate") = "3250" then%> selected<%end if%>>3.25%</option>
					<option value="3375"<%if Request.Form("cboInterestRate") = "3375" then%> selected<%end if%>>3.375%</option>
					<option value="3500"<%if Request.Form("cboInterestRate") = "3500" then%> selected<%end if%>>3.50%</option>
					<option value="3625"<%if Request.Form("cboInterestRate") = "3625" then%> selected<%end if%>>3.625%</option>
					<option value="3750"<%if Request.Form("cboInterestRate") = "3750" then%> selected<%end if%>>3.75%</option>
					<option value="3875"<%if Request.Form("cboInterestRate") = "3875" then%> selected<%end if%>>3.875%</option>
					<option value="4000"<%if Request.Form("cboInterestRate") = "4000" then%> selected<%end if%>>4.00%</option>
					<option value="4125"<%if Request.Form("cboInterestRate") = "4125" then%> selected<%end if%>>4.125%</option>
					<option value="4250"<%if Request.Form("cboInterestRate") = "4250" then%> selected<%end if%>>4.25%</option>
					<option value="4375"<%if Request.Form("cboInterestRate") = "4375" then%> selected<%end if%>>4.375%</option>
					<option value="4500"<%if Request.Form("cboInterestRate") = "4500" then%> selected<%end if%>>4.50%</option>
					<option value="4625"<%if Request.Form("cboInterestRate") = "4625" then%> selected<%end if%>>4.625%</option>
					<option value="4750"<%if Request.Form("cboInterestRate") = "4750" then%> selected<%end if%>>4.75%</option>
					<option value="4875"<%if Request.Form("cboInterestRate") = "4875" then%> selected<%end if%>>4.875%</option>
					<option value="5000"<%if Request.Form("cboInterestRate") = "5000" then%> selected<%end if%>>5.00%</option>
					<option value="5125"<%if Request.Form("cboInterestRate") = "5125" then%> selected<%end if%>>5.125%</option>
					<option value="5250"<%if Request.Form("cboInterestRate") = "5250" then%> selected<%end if%>>5.25%</option>
					<option value="5375"<%if Request.Form("cboInterestRate") = "5375" then%> selected<%end if%>>5.375%</option>
					<option value="5500"<%if Request.Form("cboInterestRate") = "5500" then%> selected<%end if%>>5.50%</option>
					<option value="5625"<%if Request.Form("cboInterestRate") = "5625" then%> selected<%end if%>>5.625%</option>
					<option value="5750"<%if Request.Form("cboInterestRate") = "5750" then%> selected<%end if%>>5.75%</option>
					<option value="5875"<%if Request.Form("cboInterestRate") = "5875" then%> selected<%end if%>>5.875%</option>
					<option value="6000"<%if Request.Form("cboInterestRate") = "6000" or Request.Form("cboInterestRate") = "" then%> selected<%end if%>>6.00%</option>
					<option value="6125"<%if Request.Form("cboInterestRate") = "6125" then%> selected<%end if%>>6.125%</option>
					<option value="6250"<%if Request.Form("cboInterestRate") = "6250" then%> selected<%end if%>>6.25%</option>
					<option value="6375"<%if Request.Form("cboInterestRate") = "6375" then%> selected<%end if%>>6.375%</option>
					<option value="6500"<%if Request.Form("cboInterestRate") = "6500" then%> selected<%end if%>>6.50%</option>
					<option value="6625"<%if Request.Form("cboInterestRate") = "6625" then%> selected<%end if%>>6.625%</option>
					<option value="6750"<%if Request.Form("cboInterestRate") = "6750" then%> selected<%end if%>>6.75%</option>
					<option value="6875"<%if Request.Form("cboInterestRate") = "6875" then%> selected<%end if%>>6.875%</option>
					<option value="7000"<%if Request.Form("cboInterestRate") = "7000" then%> selected<%end if%>>7.00%</option>
					<option value="7125"<%if Request.Form("cboInterestRate") = "7125" then%> selected<%end if%>>7.125%</option>
					<option value="7250"<%if Request.Form("cboInterestRate") = "7250" then%> selected<%end if%>>7.25%</option>
					<option value="7375"<%if Request.Form("cboInterestRate") = "7375" then%> selected<%end if%>>7.375%</option>
					<option value="7500"<%if Request.Form("cboInterestRate") = "7500" then%> selected<%end if%>>7.50%</option>
					<option value="7625"<%if Request.Form("cboInterestRate") = "7625" then%> selected<%end if%>>7.625%</option>
					<option value="7750"<%if Request.Form("cboInterestRate") = "7750" then%> selected<%end if%>>7.75%</option>
					<option value="7875"<%if Request.Form("cboInterestRate") = "7875" then%> selected<%end if%>>7.875%</option>
					<option value="8000"<%if Request.Form("cboInterestRate") = "8000" then%> selected<%end if%>>8.00%</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="text">
				Amortization Table
			</td>
			<td class="text">
				<input type=checkbox value="on" <%if Request.form("chkAmortTable") = "on" then %> checked <%end if%> name="chkAmortTable">
			</td>
		</tr>
		<tr>
			<td colspan=2 align=right>
				<a href="javascript:frmMortCalc.submit()" id="button">Calculate</a>
				<input type=hidden value="Calculate" name=btnCalculate>
			</td>
		</tr>
<%
if Request.Form("btnCalculate") = "Calculate" and valid = true then
	%>
			<tr>
				<td class="text" colspan=2>
					<br>
					Your loan amount is <%=formatnumber(lPropVal - lDown, 0)%> at a rate of <%=sRate*100%>% for <%=sTerm%> months, with <%=formatnumber(sPcntDown*100, 2)%>% down.<br><br>
					Your principle and interest monthly payment will be <%=sMonthlyPayment%>. This does not include taxes and insurance.   <%
	if sPcntDown < .2 then
		%>
		Your down payment is less than 20%.  
		You'll likely be asked to use an escrow account and pay for PMI Insurance.
		It's recommended that you pay enough of a down payment to cross the 20% threshhold.
		We have people ready and willing to talk with you about your current credit situation, 
		<a class="button" href="/realty/email.asp">>>click here<<</a>
		to get in touch with a qualified financial consultant.<br><br><br>
		
		<%
	end if
	if Request.form("chkAmortTable") = "on" then
	%>
		<table border=1 width=500>
			<tr>
				<td class="sectionheading" colspan=4>Amortization Table</td>
			</tr>
			<tr>
				<td class="text"><center><b>Payment</td>
				<td class="text"><center><b>Principle</td>
				<td class="text"><center><b>Interest</td>
				<td class="text"><center><b>Principle Balance</td>
			</tr>
			<%
			pbal = lPropVal - lDown 
			for x = 1 to sTerm - 1
				curint = pbal * sRate / 12
				curprinc = sMonthlyPayment - curint
				pbal = pbal - curprinc
				%>
				<tr>
					<td class="text"><center><%=x%></td>
					<td class="text"><center><%=formatnumber(curprinc, 2)%></td>
					<td class="text"><center><%=formatnumber(curint, 2)%></td>
					<td class="text"><center><%=formatnumber(pbal, 2)%></td>
				</tr>
				<%
			next
			curprinc = pbal
			%>
			<tr>
				<td class="text"><center><%=x%></td>
				<td class="text"><center><%=formatnumber(curprinc, 2)%></td>
				<td class="text"><center><%=formatnumber(0, 2)%></td>
				<td class="text"><center><%=formatnumber(0, 2)%></td>
			</tr>
		</table>
			<%
	end if
end if
%>
	</table>
</form>

</td></tr></table>
<!--#include file="../includes/footer.asp"-->
