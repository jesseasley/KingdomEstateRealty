
<%
sub SendEmail(sSubject, sBody)
	set oMail = server.createobject("CDO.Message")

	with oMail
		.from = "webbrowser@jesseasley.com"
		.to = "jess@easley-realty.com"
		.bcc = ""
		.subject = sSubject
		.HTMLBody = sBody
		.ReplyTo=""

'		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendemailaddress")="Jess Easley <jess@easley-realty.com>"
		
		'cdoSendUsingPickup 1 Send message using the local SMTP service pickup directory.
		'cdoSendUsingPort 2 Send the message using the network (SMTP over the network). 
		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
		
		'fill in the pickup directory if sendusing=1 is used
		'.Configuration.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory")=""
	    
	    'Name or IP of remote SMTP server
		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="pro20.abac.com"
		
		'Server port
		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=465
		
		' Specify the authentication mechanism to use. 
		'cdoAnonymous 0 Do not authenticate.
		'cdoBasic 1 Use basic (clear-text) authentication. The configuration 
			'sendusername/sendpassword or postusername/postpassword fields are used to specify credentials.
		'cdoNTLM 2 Use NTLM authentication (Secure Password Authentication in Microsoft® Outlook® Express). 
			'The current process security context is used to authenticate with the service.
		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")=1
		
		'Indicates whether SSL encryption is required
		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl")=TRUE
		
		'The username for authenticating to an SMTP server using basic (clear-text) authentication
		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername")="jess@easley-realty.com"
		
		'The password used to authenticate to an SMTP server using authentication
		.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "2532russwood"
		
		.Configuration.Fields.Update
		.send
	end with
	set oMail = nothing
end sub
%>