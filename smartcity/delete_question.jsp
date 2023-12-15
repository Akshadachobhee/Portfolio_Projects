<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	String qid = request.getParameter("qid");
	s.executeUpdate("delete from security_questions where security_id="+qid);
	
	response.sendRedirect("add_questions.jsp");
%>

