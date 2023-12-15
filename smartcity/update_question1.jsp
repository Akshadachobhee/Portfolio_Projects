<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	String qid = request.getParameter("qid");
	String qtn = request.getParameter("qtn");

	s.executeUpdate("update security_questions set security_qtn='"+qtn+"' where security_id="+qid);
	
	response.sendRedirect("add_questions.jsp");
%>

