<%
	if(session.getAttribute("aname")==null)
		response.sendRedirect("index.jsp");
%>

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
	padding: 20px;
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
<form method='post' action='http://localhost:8080/smartcity/addcat' enctype = "multipart/form-data">
<table>
<tr>
	<td align='center' colspan=2><input type='text' name='cdesc' placeholder='Enter category' required></td>
</tr>
<tr>
	<td align='center' colspan=2><input type = "file" name = "file"/></td>
</tr>

<tr>
	<td align='center'><input type='submit' value='ADD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
<table width='80%'>
<%
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from category order by cat_id");
	while(rs.next()){
%>
<tr>
<td width='5%'><%=rs.getString(1)%></td>
<td width='40%'><%=rs.getString(2)%></td>
<td width='30%'><img src='images/<%=rs.getString(3)%>' width=100 height=100/></td>
<td width='10%'><a href='delete_category.jsp?cid=<%=rs.getInt(1)%>' class='btn'>DELETE</a></td>
<td width='10%'><a href='update_category.jsp?cid=<%=rs.getInt(1)%>' class='btn'>UPDATE</a></td>
</tr>
<%
	}
%>
</table>
</form>
</article>
</body>
