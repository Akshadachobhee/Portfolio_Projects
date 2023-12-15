<link rel="stylesheet" href="css/styles.css">
<body class='main'>
<jsp:include page="header.jsp"/>

<form method='post' action='recover1.jsp'>
<table class="recovertable">
<tr>
	<td colspan='2' style='text-align:center;font-family:Arial;font-size:14pt;'><b>Recover Password</b></td>
</tr>
<tr>
	<td><b>Login ID:</b></td>
	<td><input type='text' name='loginid'></td>
</tr>
<tr>	
	<td align='center'><input type='submit' value='SUBMIT' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
</table>
</form>


<jsp:include page="footer.jsp"/>
</body>


