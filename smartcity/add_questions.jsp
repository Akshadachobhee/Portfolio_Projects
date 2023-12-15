<%
	if(session.getAttribute("aname")==null)
		response.sendRedirect("index.jsp");
%>
<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	String qtn = request.getParameter("qtn");
	if(qtn!=null)
	{
		s.executeUpdate("insert into security_questions(security_qtn) values('"+qtn+"')");
	}
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
<form method='post' action='add_questions.jsp'>
<table>
<tr>
	<td align='center' colspan=2><input type='text' name='qtn' placeholder='Enter security question' required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='ADD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
<table width='80%'>
<%
	Statement s1 = con.createStatement();
	ResultSet rs1 = s1.executeQuery("select * from security_questions order by security_id");
	while(rs1.next()){
%>
<tr>
<td width='5%'><%=rs1.getString(1)%></td>
<td width='50%'><%=rs1.getString(2)%></td>
<td width='10%'><a href='delete_question.jsp?qid=<%=rs1.getInt(1)%>' class='btn'>DELETE</a></td>
<td width='10%'><a href='update_question.jsp?qid=<%=rs1.getInt(1)%>' class='btn'>UPDATE</a></td>
</tr>
<%
	}
%>
</table>
</form>
</article>
</body>
