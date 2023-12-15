<link rel="stylesheet" href="css/styles.css">
<body class='regbody'>
<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	String cat = request.getParameter("cat");
	String sqtn = request.getParameter("sqtn");
	String sans = request.getParameter("sans");

	Statement s = con.createStatement();
	s.executeUpdate("update service_provider set passwd='"+passwd+"', company_name='"+name+"', phone='"+phone+"', address='"+addr+"', cat_id="+cat+", security_id="+sqtn+", security_ans='"+sans+"' where email='"+email+"'");
%>
<h1>Profile updated successfully.</h1>
Click <a href='user_home.jsp'>here</a> to continue.
</body>
