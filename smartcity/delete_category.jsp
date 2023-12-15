<%@page import="java.sql.*,java.io.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	String cid = request.getParameter("cid");
	ResultSet rs = s.executeQuery("select cat_path from category where cat_id="+cid);
	rs.next();
	File f = new File("images/"+rs.getString(1));
	f.delete();

	s.executeUpdate("delete from category where cat_id="+cid);
	
	response.sendRedirect("add_category.jsp");
%>

