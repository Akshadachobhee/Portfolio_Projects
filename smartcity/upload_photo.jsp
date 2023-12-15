<%@page import="java.sql.*"%>
<%
	if(session.getAttribute("uname")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String uid = session.getAttribute("uid").toString();
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
	<a href='user_home.jsp'><img src='images/user.jpg' style='width:10%;height:20%;border-radius:50%;'/></a>
	<h3>WELCOME - <%=session.getAttribute("uname")%></h3>
</div>
</header>

<article style='padding:20px;'>
<form method='post' action='http://localhost:8080/smartcity/addphoto' enctype = "multipart/form-data">
<table>
<tr>
	<td align='center' colspan=2><input type = "file" name = "file"/></td>
</tr>

<tr>
	<td align='center'><input type='submit' value='ADD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
<input type='hidden' name='uid' value='<%=uid%>'>
</form>
<table width='30%'>
<%
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from photos where email='"+uid+"' order by photo_id");
	while(rs.next()){
%>
<tr>
<td width='5%'><%=rs.getString(1)%></td>
<td width='30%'><img src='images/<%=rs.getString(2)%>' width=100 height=100/></td>
<td width='10%'><a href='delete_photo.jsp?pid=<%=rs.getInt(1)%>' class='btn'>DELETE</a></td>
</tr>
<%
	}
%>
</table>
</article>
</body>
