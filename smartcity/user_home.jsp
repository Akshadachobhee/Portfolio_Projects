<%
	if(session.getAttribute("uname")==null){
		response.sendRedirect("index.jsp");
		return;
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
</style>
<body style='background:#EEE;'>

<header>
<div style='text-align:center;'>
	<img src='images/user.jpg' style='width:10%;height:20%;border-radius:50%;'/><br>
	<h1>WELCOME - <%=session.getAttribute("uname").toString().toUpperCase()%></h1>
</div>
</header>

<article style='padding:20px;'>
	<table align='center' width='50%' height='50%' style='background:lightblue;font-size:10pt;'>
	<tr>
		<td style='padding:20px;text-align:center;'><a href='view_profile.jsp' class='btn'>View Profile</a></td>
		<td style='padding:20px;text-align:center;'><a href='upload_photo.jsp' class='btn'>Upload Photo</a></td>
		<td style='padding:20px;text-align:center;'><a href='logout.jsp' class='btn'>Logout</a></td>
	</tr>
	</table>
</article>

</body>
