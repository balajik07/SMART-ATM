<%-- 
    Document   : helpsubmit
    Created on : 4 Jan 2026, 6:48:14 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help Submit</title>

<style>
body {
    background-color: #1f2937;
    color: #F9FAFB;
    font-family: Arial, sans-serif;
    text-align: center;
    padding-top: 100px;
}
.success {
    background: #111827;
    display: inline-block;
    padding: 30px 40px;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.4);
}
.success h2 {
    color: #4fd1c5;
}
</style>
</head>

<body>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ATM", "root", "mysql@9014"
    );

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String issue = request.getParameter("issue_type");
    String message = request.getParameter("message");

    String query = "INSERT INTO help_requests (USERNAME, EMAIL, ISSUE_TYPE, MESSAGE) VALUES (?, ?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(query);

    ps.setString(1, username);
    ps.setString(2, email);
    ps.setString(3, issue);
    ps.setString(4, message);

    ps.executeUpdate();
    conn.close();
%>

<div class="success">
    <h2>Request Submitted ✔</h2>
    <p>Your issue has been sent to admin.</p>
    <p>We will contact you soon.</p>
</div>

<%
} catch (Exception e) {
    out.println("<p style='color:red'>" + e.getMessage() + "</p>");
}
%>

</body>
</html>
