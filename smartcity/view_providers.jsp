<style>
td, th
{
	border: 1px solid black;
	padding: 15px;
	text-align:center;
}
th
{
	background: red;
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

	String cid = request.getParameter("cid");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select company_name, address, phone, email from service_provider where cat_id="+cid+" and active=1");

	if(rs.next())
	{
%>
<table width='90%'>
<tr>
	<th>Company Name</th>
	<th>Address</th>
	<th>Phone</th>
	<th>Email</th>
	<th>Comments</th>
	<th>Photos</th>
</tr>
<%
	do
	{
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><a href='view_reviews.jsp?email=<%=rs.getString(4)%>' style='text-decoration:none;background:black;color:white;padding:5px;'>Reviews</a></td>
	<td><a href='view_gallery.jsp?email=<%=rs.getString(4)%>' style='text-decoration:none;background:black;color:white;padding:5px;'>Photos</a></td>
</tr>
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
