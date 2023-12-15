<link rel="stylesheet" href="css/styles.css">
<body class='main'>

<jsp:include page="header.jsp"/>

<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String loginid = request.getParameter("loginid");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select security_qtn from service_provider,security_questions where service_provider.security_id=security_questions.security_id and email='"+loginid+"'");

	if(rs.next()){
%>
<form method='post' action='recover2.jsp'>
<table class='recovertable'>
<tr>
	<td><b><%=rs.getString(1)%></b></td>
	<td><input type='text' name='ans'></td>
</tr>
<tr>	
	<td align='center'><input type='submit' value='SUBMIT' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
</table>
<input type='hidden' name='loginid' value='<%=loginid%>'>
</form>
<%
	}
	else{
%>
<h3>Invalid login id.</h3>
Click <a href='recover.jsp'>here</a> to try again.
<%
	}
%>

<jsp:include page="footer.jsp"/>
</body>


