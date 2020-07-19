<!--#include file="../includes/pagerecorder.asp"-->    
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../css/style.css">
		<% if request.cookies("referer") > "" then
			sReferer = request.cookies("referer")
			sRefererDomain = request.cookies("refererdomain")
		else
			sReferer = "Easley Realty"
			sRefererDomain = "easley-realty.com"
		end if 
		select case Request.ServerVariables("HTTP_Host")
			case "www.easley-realty.com" sTitle = "Easley Realty"
			case "easley-realty.com" sTitle = "Easley Realty"
			case "www.flowermoundlistings.com" sTitle = "Flower Mound Listings"
			case "flowermoundlistings.com" sTitle = "Flower Mound Listings"
			case "www.flowermoundrelocation.com" sTitle = "Flower Mound Relocation"
			case "flowermoundrelocation.com" sTitle = "Flower Mound Relocation"
			case "www.foreclosedhomeshud.com" sTitle = "HUD Foreclosed Homes"
			case "foreclosedhomeshud.com" sTitle = "HUD Foreclosed Homes"
			case "www.homesforsaleinhighlandvillage.com" sTitle = "Homes for Sale in Highland Village"
			case "homesforsaleinhighlandvillage.com" sTitle = "Homes for Sale in Highland Village"
			case "www.homesforsaleinlewisville.com" sTitle = "Homes for Sale in Lewisville"
			case "homesforsaleinlewisville.com" sTitle = "Homes for Sale in Lewisville"
			case "www.realestateinflowermound.com" sTitle = "Real Estate in Flower Mound"
			case "realestateinflowermound.com" sTitle = "Real Estate in Flower Mound"
			case "www.realestateinhighlandvillage.com" sTitle = "Real Estate in Highland Village"
			case "realestateinhighlandvillage.com" sTitle = "Real Estate in Highland Village"
			case else sTitle = "JessEasley.com"
		end select
		%>
		<title><%=sTitle%></title>
		<meta name="description" content="Selling your Flower Mound Home? Shopping for a home in Flower Mound? Looking for a Real Estate Agent in Flower Mound?  Call me.  I'd be glad to help!" />
		<meta name="robots" content="index,follow" />
		<meta name="keywords" content="Flower Mound homes for sale, sell Flower Mound home, Flower Mound realtor, Flower Mound real estate agent, Lewisville homes for sale, sell Lewisville home, Lewisville realtor, Lewisville real estate agent, Highland Village homes for sale, sell Highland Village home, Highland Village realtor, Highland Village real estate agent, home,homes,real estate,homes for sale,house,property,houses,realtors,realty,real estate agent,investment property,properties,realtor,mls,realestate,new homes,new home,home for sale,house for sale" />
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
		</script>
		<script type="text/javascript">
		_uacct = "UA-2998176-1";
		urchinTracker();
		</script>
	</head>
	
	<body>
	
		<div style="position: absolute; width: 105%; height: 95px; z-index: 0; left: 0px; top: 0px">
			<table border="0" width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td height=95 background="../images/backgroundgradient.jpg"></td>
				</tr>
			</table>
		</div>
		<center>
		<div class="BottomBorder" style="position: relative; width: 868px; height: 100px; z-index: 1; top: 5px" id=3>
			<table cellpadding=0 cellspacing=0 border=0 width=868>
				<tr class="RightBorder" height=104>
					<td background="../images/captionbargradient.jpg" valign=center width=3></td>
					<td background="../images/captionbargradient.jpg" valign=center width=71>
						<img src="../images/agentphoto.jpg" alt="Flower Mound Realtor" width=69 height=94 border=0>
					</td>
					<td background="../images/captionbargradient.jpg">
						<table border=0 cellpadding=0 cellspacing=0>
							<tr>
								<td width=7></td>
								<td class="heading" height="36" width="600" style="vertical-align: bottom"><%=sTitle%></td>
							</tr>
							<tr>
								<td width=7></td>
								<td class="subheading" height=40 style="vertical-align: bottom">
									Because you matter
								</td>
							</tr>
						</table>
					</td>
					<td background="../images/captionbargradient.jpg" valign=center width=150>
						<table border=0 cellpadding=0 cellspacing=0>
							<tr valign=top>
								<td class="smalltext" >
									Cell:<br>
									(972) 284-9403<br>
									Email:<br>
									<a title="Email Jess Easley Flower Mound Real Estate Agent" href="..\email.asp">Send me an email</a><br>
									Web:<br>
									<a title="<%=sReferer%> Flower Mound Real Estate" href="http://<%=Request.ServerVariables("HTTP_Host")%>"><%=Request.ServerVariables("HTTP_Host")%></a><br>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table cellpadding=0 cellspacing=0 border=0>
				<tr>
					<td height=3 class="MainArea"></td>
				</tr>
				<tr>
					<td height=1 class="DividingLine"></td>
				</tr>
				<tr>
					<td class="MainArea" width=868>
						<table cellpadding=0 cellspacing=0 border=0>
							<tr height=7><td colspan=7></td></tr>
							<tr>
								<td width=7></td>
								<td class="menus" width=145>
									<table cellpadding=0 cellspacing=0 border=0>
										<tr id="menus">
											<td>
												<a title="Search For Flower Mound Homes" href="../search_mls.asp" <%if sPageName="searchmls" then%>id=activemenu<%else%>id="specialbutton"<%end if%>>New Improved<br>Home Search</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="See Jess Easley's Current Listings" id="button" href="../default.asp">My Listings</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Send Us An eMail" id="button" href="../email.asp">Contact Us</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="See What Our Customers Are Saying" href="../testimonials.asp" <%if sPageName="testimonials" then%>id=activemenu<%else%>id="button"<%end if%>>Testimonials</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Sign Up For Monthly Newsletter On Real Estate" href="../register.asp" <%if sPageName="register" then%>id=activemenu<%else%>id="button"<%end if%>>Sign Up</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Find Out About Listing Your Home" href="../list.asp" <%if sPageName="list" then%>id=activemenu<%else%>id="button"<%end if%>>Sell Your Home</a>
												<br><br>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="See Jess Easley's Bio" id="button" href="../bio.asp">Jess' Bio</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Free Real Estate Advice" href="../articles.asp" <%if sPageName="articles" then%>id=activemenu<%else%>id="button"<%end if%>>Articles</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Get Honest Answers To Your Questions" href="../forum.asp" <%if sPageName="forum" then%>id=activemenu<%else%>id="button"<%end if%>>Q & A Forum</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Flower Mound Real Estate Discussion Board" href="../openwindow.asp?url=http://easley-realty.blogspot.com" id="button" target="_empty">Our Blog</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Opt In Or Opt Out Of Our Monthly Newsletters" href="../optin.asp" <%if sPageName="optin" then%>id=activemenu<%else%>id="button"<%end if%>>Opt In/Opt Out</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Take Our Short Customer Survey" href="../survey.asp" <%if sPageName="survey" then%>id=activemenu<%else%>id="button"<%end if%>>Customer Survey</a>
												<br><br>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="See Local Flower Mound Information" id="button" href="../openwindow.asp?url=http://www.flower-mound.com/" target=_blank>Local Info</a>
											</td>
										</tr>
										<tr id="menus">
											<td>
												<a title="Care For A Small Sanity Break?" href="../games/bejeweled.asp" <%if sPageName="survey" then%>id=activemenu<%else%>id="button"<%end if%> target=_blank>Just For Fun</a>
											</td>
										</tr>
										<tr>
					                        <TD class="text"><br><i>"Whether you are selling a home in Flower Mound, searching for a home in Flower Mound, or need a Flower Mound Real Estate Agent, you need a solid performer that's in this market to stay.  Call me today."</i></TD>
										</tr>
										<tr>
					                        <TD>
					                        <br><center><a title="See the local weather for Flower Mound, TX" class="text" href="../openwindow.asp?url=http://www.weather.com/outlook/travel/businesstraveler/tenday/75028?from=hrly_topnav_business", target="_empty">Local Weather</a></center></TD>
										</tr>
									</table>
								</td>
								<td width=14>&nbsp;</td>
								<td class="text">
