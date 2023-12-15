<%
	if(session.getAttribute("aname")==null)
		response.sendRedirect("index.jsp");
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
	<img src='images/admin.jpg' style='width:10%;height:20%;border-radius:50%;'/>
	<h3>WELCOME - <%=session.getAttribute("aname")%></h3>
</div>
</header>

<article style='padding:20px;'>
	<table align='center' width='90%' height='50%' style='background:lightblue;font-size:10pt;'>
	<tr>
		<td style='padding:20px;text-align:center;'><a href='view_service_provider.jsp' class='btn'>&nbsp;View Service Providers&nbsp;</a></td>
		<td style='padding:20px;text-align:center;'><a href='cat_service_provider.jsp' class='btn'>Search Service Providers</a></td>
		<td style='padding:20px;text-align:center;'><a href='add_category.jsp' class='btn'>&nbsp;&nbsp;&nbsp;&nbsp;Manage Category&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
		<td style='padding:20px;text-align:center;'><a href='add_questions.jsp' class='btn'>&nbsp;&nbsp;&nbsp;&nbsp;Manage Questions&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
		<td style='padding:20px;text-align:center;'><a href='logout.jsp' class='btn'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
	</tr>
	</table>
</article>

</body>
