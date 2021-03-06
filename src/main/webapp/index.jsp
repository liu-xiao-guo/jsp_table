<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>

<body>
<h1>JDBC Connection example</h1>

<%
  String user = "demouser";
  String password = "123";
  
  try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demodb", user, password);
    out.println (user + " account opens database successfully opened.");
    
    String query="select * from Employees";
    Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(query);
%>	   
    <br />
    <h3>The data read from database is:</h3>
    <br />
    
	<table border="2">
	<tr>
		<td>Id</td>
		<td>Age</td>
		<td>First</td>
		<td>Last</td>
	</tr>
<%
	while(rs.next())
	{
%>
	<tr>
		<td><%=rs.getInt("id")%></td>
		<td><%=rs.getInt("age")%></td>
		<td><%=rs.getString("first")%></td>
		<td><%=rs.getString("last")%></td>
	</tr>
<%
	}
%>
	</table>
	
<%
    // close the connection
    rs.close();
    stmt.close();
    con.close();
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>

</body>
</html>
