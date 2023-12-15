<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	String uid = session.getAttribute("uid").toString();

	Statement s1 = con.createStatement();
	ResultSet rs1 = s1.executeQuery("select * from category");

	Statement s2 = con.createStatement();
	ResultSet rs2 = s2.executeQuery("select * from security_questions");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from service_provider where email='"+uid+"'");
	rs.next();
%>

<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["email"];
	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email ID.");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["passwd"];
	y = document.forms["reg"]["cpasswd"];
	
	if(x.value != y.value)
	{
		alert("Password and Re-type password doesn't match");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["phone"];
	if(!x.value.match(/^\d{10}$/))
	{
		alert("Invalid Phone.");
		x.focus();
		return false;
	}

	return true;
}
</script>

<link rel="stylesheet" href="css/styles.css">
<body class='regbody'>

<form method='post' action='edit_profile.jsp' name="reg" onsubmit="return validate()">
<table width=600 height=500 align='center' class='regtable'>
<center><a href='user_home.jsp'><img src='images/home.png' width=100 height=100></a></center>
<tr>
	<td colspan=2 align='center'><b>View Profile</b></td>
</tr>
<tr>
	<td colspan=2 align='center'>
		<input type='text' name='email' placeholder='Email ID' class='txt' value='<%=rs.getString(1)%>' readOnly>
	</td>
</tr>	
<tr>
	<td colspan=2 align='center'>
		<input type='password' name='passwd' placeholder='Password' class='txt' value='<%=rs.getString(2)%>' required>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
		<input type='password' name='cpasswd' placeholder='Retype Password' class='txt' value='<%=rs.getString(2)%>' required>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
		<input type='text' name='name' placeholder='Company Name' class='txt' value='<%=rs.getString(3)%>' required>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
		<input type='text' name='addr' placeholder='Address' class='txt' value='<%=rs.getString(4)%>' required>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
		<input type='text' name='phone' placeholder='Phone (10 digits)' class='txt' value='<%=rs.getString(5)%>' required>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
		<select name='cat' required class='txt'>
		<option value=''>Select Your Category</option>
<%
	while(rs1.next()){
%>
		<option value='<%=rs1.getInt(1)%>' <% if(rs1.getInt(1)==rs.getInt(6)) out.print(" selected");%>><%=rs1.getString(2)%></option>
<%
	}
%>
		</select>
	</td>
</tr>

<tr>
	<td colspan=2 align='center'>
		<select name='sqtn' required class='txt'>
		<option value=''>Select Your Security Question</option>
<%
	while(rs2.next()){
%>
		<option value='<%=rs2.getInt(1)%>' <% if(rs2.getInt(1)==rs.getInt(7)) out.print(" selected");%>><%=rs2.getString(2)%></option>
<%
	}
%>
		</select>
	</td>
</tr>
<tr>
	<td colspan=2 align='center'>
		<input type='text' name='sans' placeholder='Security Answer' class='txt' value='<%=rs.getString(8)%>' required>
	</td>
</tr>
<tr>
	<td align='center'><input type='submit' value='UPDATE' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
</table>
</form>
