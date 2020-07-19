<%
Function isValidEmail(myEmail)
  dim isValidE
  dim regEx
  
  isValidE = True
  set regEx = New RegExp
  
  regEx.IgnoreCase = true
  
  regEx.Pattern = "^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))$"
  isValidE = regEx.Test(myEmail)
  
  isValidEmail = isValidE
End Function
%>