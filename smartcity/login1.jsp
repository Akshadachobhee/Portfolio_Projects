<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String uname = request.getParameter("username");
	String pwd = request.getParameter("passwd");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from service_provider where email='"+uname+"' and passwd='"+pwd+"' and active=1");
	if(rs.next())
	{
		session.setAttribute("uid",rs.getString(1));
		session.setAttribute("uname",rs.getString(3));
		response.sendRedirect("user_home.jsp");
	}
	else
	{
%>
<body bgcolor='linen'>
<h3>Login failed or you are not activated yet.</h3>
<h5>Click <a href='login.jsp'>here</a> to login again.</h5>
</body>
<%
	}
%>
