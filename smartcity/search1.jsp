<style>
td, th
{
	border: 1px solid black;
	padding: 10px;
	text-align:left;
}
th
{
	background: red;
}
.btn
{
	text-decoration:none;
	padding:5px;
	background:black;
	color:white;
}
</style>

<body bgcolor='cyan'>
<header>
	<jsp:include page="header.jsp"/>
</header>

<article style='padding:30px;'>

<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String cat = request.getParameter("cat");
	String area = request.getParameter("area");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select company_name, address, phone, email from service_provider where cat_id="+cat+" and active=1 and address like '%"+area+"%'");

	if(rs.next())
	{
%>
<%
	do
	{
%>
<table width='40%'>
<tr>
	<th width='40%'>Company Name</th><td><%=rs.getString(1)%></td>
</tr>
<tr>
	<th width='40%'>Address</th><td><%=rs.getString(2)%></td>
</tr>
<tr>
	<th width='40%'>Phone</th><td><%=rs.getString(3)%></td>
</tr>
<tr>
	<th width='40%'>Email</th><td><%=rs.getString(4)%></td>
</tr>
<tr>
	<td width='40%'><a href='view_reviews.jsp?email=<%=rs.getString(4)%>' class='btn'>Reviews</a></td>
	<td><a href='view_gallery.jsp?email=<%=rs.getString(4)%>' class='btn'>Gallery</a></td>
</tr>
</table><br>
<%
	}while(rs.next());
%>
</table>
<%
	}
	else
	{
%>
<h3>No record found.</h3>
<%
	}
%>
</article>

<footer>
	<jsp:include page="footer.jsp"/>
</footer>
</body>
