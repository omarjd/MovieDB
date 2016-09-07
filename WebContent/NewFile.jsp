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
Connection myConn = null;
PreparedStatement myStmt = null;
ResultSet myRs = null;

out.println("Welcome to the Movie List Application!\n");
out.println("There are 13 movies in this list.");

try {
	Class.forName("com.mysql.jdbc.Driver");
	myConn = DriverManager.getConnection(DBsettings.url, DBsettings.user, DBsettings.pass);

	myStmt = (PreparedStatement) myConn
			.prepareStatement("select name from movie where category=? order by name");
	myStmt.setString(1, request.getParameter("genre"));

	
// 		System.out.println("What Category are you interested in?\n" + "1. Animated \n" + "2. Drama \n"
// 				+ "3. Horror \n" + "4. Scifi\n" + "5. Comedy");
// 		switch (chose) {
// 		case 1:
// 			myStmt.setString(1, "animated");
// 			break;
// 		case 2:
// 			myStmt.setString(1, "drama");
// 			break;
// 		case 3:
// 			myStmt.setString(1, "horror");
// 			break;
// 		case 4:
// 			myStmt.setString(1, "scifi");
// 			break;
// 		case 5:
// 			myStmt.setString(1, "comedy");
// 			break;
// 		default:
// 			System.out.println("Sorry, you enter wrong value. ");
// 			break;
// 		}
		myRs = myStmt.executeQuery();

		while (myRs.next()) {
			out.println(myRs.getString("name") + "<br />");
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