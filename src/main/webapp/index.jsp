<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>

<body>
<h1>JDBC Connection example</h1>

<%
  String user = "owncloud";
  String password = "123";
  
  try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/owncloud", user, password);
    out.println (user + " database successfully opened.");
    
    String query="select * from Employees";
    Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(query);
%>	
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

