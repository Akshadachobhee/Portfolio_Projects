<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");

	Statement s = con.createStatement();
	
	ResultSet rs = s.executeQuery("select * from category");
%>

<link rel="stylesheet" href="css/styles.css">
<body class='main'>
<jsp:include page="header.jsp"/>

<link rel="stylesheet" href="css/w3.css">
<style>
.mySlides {display:none;}
</style>
</head>

<body>

<div class="w3-content w3-section" style="max-width:1500px;padding:50px;" align='center'>
  <img class="mySlides" src="images/back1.jpg" style="width:1000px;height:550px;">
  <img class="mySlides" src="images/back2.jpg" style="width:1000px;height:550px;">
  <img class="mySlides" src="images/back3.jpg" style="width:1000px;height:550px;">
  <img class="mySlides" src="images/back4.jpg" style="width:1000px;height:550px;">
  <img class="mySlides" src="images/back5.jpg" style="width:1000px;height:550px;">
  <img class="mySlides" src="images/back6.jpg" style="width:1000px;height:550px;">
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>


<div style='padding:50px;' id='cat'>
<table align='center'>
<tr>
<%
	int i=0;

	while(rs.next()){
%>
	<td align='center' width=200 height=200 style='border:1px solid black;'>
	<a href='view_providers.jsp?cid=<%=rs.getInt(1)%>' style='text-decoration:none;'>
	<img src='images/<%=rs.getString(3)%>' width=100 height=100/><br>
	<span style='font-size:15px;font-weight:bold;color:white;'><%=rs.getString(2)%></span>
	</a>
	</td>
<%
		i++;
		if(i%3==0){
%>
			</tr><tr>
<%		}
	}
%>
</table>
</div>
<jsp:include page="footer.jsp"/>
</body>
