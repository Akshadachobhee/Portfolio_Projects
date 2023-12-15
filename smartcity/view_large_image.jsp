<%@page import="java.sql.*" errorPage="err.jsp"%>
<link rel="stylesheet" href="css/styles.css">

<body class='main'>
<jsp:include page="header.jsp"></jsp:include>

<article style='padding:30px;'>

<%@page import="java.sql.*" errorPage="err.jsp"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");
	
	int id = Integer.parseInt(request.getParameter("id"));
	PreparedStatement ps = con.prepareStatement("select * from photos where photo_id=?");
	ps.setInt(1,id);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>	
<table style='background:white;' align='center'>	
<tr>
	<td align='right'><a href='view_gallery.jsp?email=<%=rs.getString(3)%>'>X</a></td>
</tr>
<tr>
	<td align='center'><img src='images/<%=rs.getString(2)%>' width=500 height=500/></td>
<tr>
</table>

</article>

<jsp:include page="footer.jsp"></jsp:include>
</body>
