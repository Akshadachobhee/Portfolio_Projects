<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	String qid = request.getParameter("qid");
	ResultSet rs = s.executeQuery("select * from security_questions where security_id="+qid);
	rs.next();
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
<form method='post' action='update_question1.jsp'>
<table>
<tr>
	<td align='center' colspan=2><input type='text' name='qtn' placeholder='Enter security question' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='UPDATE' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
<input type='hidden' name='qid' value=<%=rs.getString(1)%>>
</form>
</article>
</body>
