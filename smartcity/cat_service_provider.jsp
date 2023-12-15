<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from category");
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
	padding: 10px;
}
</style>

<script type='text/javascript'>
function get(cat)
{
	obj = new XMLHttpRequest();
	obj.open("GET","get_providers.jsp?cat="+cat,true);
	obj.send();
	obj.onreadystatechange = function()
	{
		if(obj.readyState == 4 && obj.status==200)
		{
			document.getElementById("result").innerHTML=
			obj.responseText;
		}
	};
}
</script> 

<body style='background:#EEE;'>

<header>
<div style='text-align:center;'>
	<a href='admin_home.jsp'><img src='images/admin.jpg' style='width:10%;height:20%;border-radius:50%;'/></a>
	<h3>WELCOME - <%=session.getAttribute("aname")%></h3>
</div>
</header>

<article style='padding:20px;'>

<select name='cat' required class='txt' onchange='get(this.value)'>
<option value=''>Select Your Category</option>
<%
while(rs.next()){
%>
	<option value='<%=rs.getInt(1)%>'><%=rs.getString(2)%></option>
<%
}
%>
</select><br>
<div id='result'>
</div>
</article>
</body>
