<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");
%>
<style>
.btn
{
	padding:10px;
	text-decoration:none;
	background:red;
	color:white;
	box-shadow:7px 7px 7px black;
	border-radius: 5px;
	font-weight:bold;
}
.btn:hover
{
	color:white;
	background:black;
}
td
{
	padding: 15px;
	border: 1px solid black;
}
</style>

<body style='background:#EEE;'>

<header>
<div style='text-align:center;'>
	<a href='admin_home.jsp'><img src='images/admin.jpg' style='width:10%;height:20%;border-radius:50%;'/></a>
	<h3>WELCOME - <%=session.getAttribute("aname")%></h3>
</div>
</header>

<article style='padding:20px;'>
<%
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select email, company_name, address, phone, cat_desc, active from service_provider,category where service_provider.cat_id=category.cat_id");
 
%>
<body style='background:#fffbd6;'>
<%
	while(rs.next()){
%>
<table width='40%' border=1>
<tr>
	<td width='40%'><b>Email ID:</b></td>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Company Name:</b></td>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><%=rs.getString(4)%></td>
</tr>
<tr>
	<td><b>Category:</b></td>
	<td><%=rs.getString(5)%></td>
</tr>
<tr>
	<td colspan=2 align='center'>
	<a href='activate_service_provider.jsp?uname=<%=rs.getString(1)%>&active=<%=rs.getString(6)%>' class='btn'><% if(rs.getInt(6)==1) out.print("Deactivate"); else out.print("Activate");%></a>
	</td>
</tr>
</table><br>
<%
	}
%>
</table>

</body>
