<%@page import="java.sql.*" errorPage="err.jsp"%>
<link rel="stylesheet" href="css/styles.css">

<body class='main'>
<jsp:include page="header.jsp"></jsp:include>
<article style='padding:30px;'>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");
	
	String email = request.getParameter("email");
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from photos where email='"+email+"'");

	if(rs.next()){
%>	
<table style='background:white;' align='center'>	
<tr>
<%
		int i=0;
		do{
%>
			<td width='30%' height='30%' align='center' style='padding:15px;border:1px solid black;'><a href='view_large_image.jsp?id=<%=rs.getInt(1)%>'><img src='images/<%=rs.getString(2)%>' width=200 height=200></a></td>
<%
			i++;
			if(i%4==0) out.print("</tr><tr>");
		}while(rs.next());
%>
</table>
<%
	}
	else{
%>
<h3>No photos uploaded.</h3>
<%
	}
%>
</article>

<jsp:include page="footer.jsp"></jsp:include>
</body>
