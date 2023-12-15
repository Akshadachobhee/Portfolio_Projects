<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String uname = request.getParameter("uname");
	int active = Integer.parseInt(request.getParameter("active"));

	active = active==0?1:0;

	Statement s = con.createStatement();
	s.executeUpdate("update service_provider set active="+active+" where email='"+uname+"'");

	response.sendRedirect("view_service_provider.jsp");
%>

