<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String uname = request.getParameter("uname");
	String pwd = request.getParameter("pwd");

	String sql = "select * from admin where admin_id='"+uname+"' and admin_pwd='"+pwd+"'";

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery(sql);

	if(rs.next())
	{
		session.setAttribute("aid",rs.getString(1));
		session.setAttribute("aname",rs.getString(3));
		response.sendRedirect("admin_home.jsp");
	}
	else
	{
%>
<body bgcolor='linen'>
<h3>Login Failed.</h3>
<h5>Click <a href='admin.jsp'>here</a> to login again.</h5>
</body>
<%
	}
%>
