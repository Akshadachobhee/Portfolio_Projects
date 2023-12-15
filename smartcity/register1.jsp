<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");
%>
<link rel="stylesheet" href="css/styles.css">
<body class='regbody'>
<%
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	String cat = request.getParameter("cat");
	String sqtn = request.getParameter("sqtn");
	String sans = request.getParameter("sans");

	Statement s = con.createStatement();

	ResultSet rs = s.executeQuery("select * from service_provider where email='"+email+"'");

	if(rs.next())
	{
%>
<h3>You are already a registered user.</h3>
<%
	}
	else
	{
		s = con.createStatement();
		s.executeUpdate("insert into service_provider values('"+email+"', '"+passwd+"', '"+name+"','"+addr+"', '"+phone+"', "+cat+", "+sqtn+", '"+sans+"',0)");
%>
<h3>You are registered successfully. Can login after admin activates you.</h3>
<%
	}
%>
Click <a href='login.jsp'>here</a> to continue login.
</body>
