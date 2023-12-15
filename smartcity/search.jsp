<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s1 = con.createStatement();
	ResultSet rs1 = s1.executeQuery("select * from category");
%>
<body bgcolor='cyan'>
<header>
	<jsp:include page="header.jsp"/>
</header>

<article style='padding:30px;'>
<form method='post' action='search1.jsp'>
<table align='center' style='background:linen;padding:20px;'>
<tr>
	<td style='padding:10px;'>
	<select name='cat' required class='txt'>
	<option value=''>Select Your Category</option>
<%
	while(rs1.next()){
%>
		<option value='<%=rs1.getInt(1)%>'><%=rs1.getString(2)%></option>
<%
	}
%>
	</select>
	</td>

	<td style='padding:10px;'>
	<select name='area' required class='txt'>
	<option value=''>Select Your Area</option>
<%
	String qual[] = new String[]{"Pune","Chinchwad","Akurdi","Pimpri","Bhosari","Nigdi"};
	for(String val : qual){
%>
		<option value='<%=val%>'><%=val%></option>
<%
	}
%>
	</select>
	</td>

	<td><input type='submit' value='Search' class='btn'></td>
</tr>
</table>
</form>
</article>

<footer>
	<jsp:include page="footer.jsp"/>
</footer>
</body>
