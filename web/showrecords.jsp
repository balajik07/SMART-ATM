<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ATM Records</title>

<style>
    body {
        margin: 0;
        padding: 30px;
        background-color: #1f2937;
        color: #F9FAFB;
        font-family: 'Inter', sans-serif;
    }

    h2 {
        color: #4fd1c5;
        text-align: center;
        margin-bottom: 10px;
        font-size: 28px;
        letter-spacing: 1px;
    }

    p {
        text-align: center;
        color: #9ca3af;
        margin-bottom: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: #111827;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0,0,0,0.4);
    }

    th, td {
        padding: 14px 18px;
        text-align: center;
    }

    th {
        background-color: #4fd1c5;
        color: #111827;
        font-weight: 700;
        text-transform: uppercase;
        font-size: 14px;
    }

    tr {
        border-bottom: 1px solid #374151;
    }

    tr:last-child {
        border-bottom: none;
    }

    tr:hover {
        background-color: #1f2937;
    }

    td {
        color: #e5e7eb;
        font-size: 15px;
    }

    /* Status colors */
    .FULL { color: #22c55e; font-weight: 700; }
    .MEDIUM { color: #facc15; font-weight: 700; }
    .EMPTY { color: #ef4444; font-weight: 700; }

</style>
</head>

<body>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ATM","root","mysql@9014");

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM atm_details");

    out.println("<h2>ATM RECORDS</h2>");
    out.println("<p>All ATM availability details</p>");

    out.println("<table>");
    out.println("<tr>");
    out.println("<th>ATM ID</th>");
    out.println("<th>City</th>");
    out.println("<th>Area / Landmark</th>");
    out.println("<th>Bank</th>");
    out.println("<th>Cash Status</th>");
    out.println("</tr>");

    while(rs.next()) {
        String status = rs.getString(5);

        out.println("<tr>");
        out.println("<td>" + rs.getInt(1) + "</td>");
        out.println("<td>" + rs.getString(2) + "</td>");
        out.println("<td>" + rs.getString(3) + "</td>");
        out.println("<td>" + rs.getString(4) + "</td>");
        out.println("<td class='"+status+"'>" + status + "</td>");
        out.println("</tr>");
    }

    out.println("</table>");
    conn.close();

} catch(Exception e) {
    out.println("<p style='color:red'>" + e.getMessage() + "</p>");
}
%>

</body>
</html>
