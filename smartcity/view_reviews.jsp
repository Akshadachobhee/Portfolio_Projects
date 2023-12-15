<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["gmail"];
	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email ID.");
		x.focus();
		return false;
	}

	return true;
}
</script>

<style>
td, th
{
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
	String email = request.getParameter("email");
	String gmail = request.getParameter("gmail");
	String name = request.getParameter("name");
	String msg = request.getParameter("msg");

	if(gmail!=null && name!=null && msg!=null){
		Statement s = con.createStatement();
		s.executeUpdate("insert into comments(provider_email, guest_name, guest_email, comment_msg, comment_date) values('"+email+"','"+name+"','"+gmail+"','"+msg+"',current_date)");
	}

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from comments where provider_email='"+email+"'");
%>
<div style='overflow:scroll; width:500px;height:300px;'>
<%
	while(rs.next()){
%>
<b>Date:</b><%=rs.getString(6)%><br>
<b>Name:</b><%=rs.getString(3)%><br>
<b>Email:</b><%=rs.getString(4)%><br>
<b>Review:</b><%=rs.getString(5)%><br><br>
<%
	}
%>
</div>
<form method='post' action='view_reviews.jsp' name='reg' onsubmit='return validate()'>
<table>
<tr>
	<td colspan=2 align='center'>
	<input type='text' name='name' placeholder='Enter your name' required>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
	<input type='text' name='gmail' placeholder='Enter your email' required>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
	<textarea name='msg' rows=4 cols=50 placeholder='Enter your name' required></textarea>
	</td>
</tr>
<tr>
	<td><input type='submit' value='POST' class='btn'></td>
	<td><input type='reset' value='RESET' class='btn'></td>
</tr>
</table>
<input type='hidden' name='email' value='<%=email%>'> 
</form>
</article>

<footer>
	<jsp:include page="footer.jsp"/>
</footer>
</body>
