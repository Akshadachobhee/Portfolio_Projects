<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String loginid = request.getParameter("loginid");

	String ans = request.getParameter("ans");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select security_ans,passwd from service_provider where email='"+loginid+"'");
	rs.next();
	String ans1 = rs.getString(1);

	if(ans1.equals(ans)){
%>
<h3>Your password is <%=rs.getString(2)%></h3>
Click <a href='index.jsp'>here</a> to continue login.
<%
	}
	else
	{
%>
<h3>Invalid answer.</h3>
Click <a href='recover.jsp'>here</a> to try again.
<%
	}
%>
