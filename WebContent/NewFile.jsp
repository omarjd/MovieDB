<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.omarjd.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
out.println("Welcome to the Movie List Application!");
%>
<br />
<br />
<%
Connection myConn = null;
Statement myStmt = null;
ResultSet myRs = null;



try {
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(DBsettings.url, DBsettings.user, DBsettings.pass);


		myStmt = myConn.createStatement();
		myRs = myStmt.executeQuery("SELECT * FROM movie");
		
		
		out.println ("	<table>"
				+"<tr>"
				+"<th>ID</th>"
				+"<th>Move_Name</th>"
				+"<th>Category</th>"
				+"</tr>");
		
		while (myRs.next()) {
			int id = myRs.getInt("id");
			String name = myRs.getString("name");
			String cat = myRs.getString("category");
			
			out.println("<tr>");
			out.println("<td>" + id + "</td><td>" + name + "</td><td>"
					+ cat + "</td>");
			out.println("</tr>");
		
		
		}

		
} catch (Exception exc) {
	exc.printStackTrace();
} finally {
	if (myRs != null) {
		myRs.close();
	}

	if (myStmt != null) {
		myStmt.close();
	}

	if (myConn != null) {
		myConn.close();
	}
}
%>
</body>
</html>