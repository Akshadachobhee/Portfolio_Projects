<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String cat = request.getParameter("cat");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select email, company_name, address, phone from service_provider where active=1 and cat_id="+cat);

	if(rs.next())
	{
		do
		{
%>
<table width='40%' border=1>
<tr>
	<td width='40%'><b>Email ID:</b></td>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Company Name:</b></td>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><%=rs.getString(4)%></td>
</tr>
</table><br>
<%
		}while(rs.next());
	}
	else
	{
%>
<h3>No match found.</h3>
<%
	}
%>
</table>


