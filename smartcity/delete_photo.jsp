<%@page import="java.sql.*,java.io.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	String pid = request.getParameter("pid");
	ResultSet rs = s.executeQuery("select photo_path from photos where photo_id="+pid);
	rs.next();
	File f = new File("images/"+rs.getString(1));
	f.delete();

	s.executeUpdate("delete from photos where photo_id="+pid);
	
	response.sendRedirect("upload_photo.jsp");
%>

