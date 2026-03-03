<%-- 
    Document   : searchrecordprocess
    Created on : 2 Jan 2026, 3:36:01 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    String atm_id = request.getParameter("atm_id");
    if(atm_id != null && !atm_id.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ATM","root","mysql@9014");

            String query = "SELECT * FROM atm_details WHERE ATM_ID = " + atm_id;
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);

            if(rs.next()) {
%>
                <h2>RECORD FOUND</h2>
                <table>
                    <tr>
                        <th>ATM ID</th>
                        <th>ATM CITY</th>
                        <th>ATM AREA LANDMARK</th>
                        <th>BANK NAME</th>
                        <th>ATM STATUS</th>
                    </tr>
                    <tr>
                        <td><%= rs.getInt("ATM_ID") %></td>
                        <td><%= rs.getString("ATM_CITY") %></td>
                        <td><%= rs.getString("ATM_AREA_LANDMARK") %></td>
                        <td><%= rs.getString("BANK_NAME") %></td>
                        <td><%= rs.getString("ATM_STATUS") %></td>
                    </tr>
                </table>
<%
            } else {
%>
                <div class="message">No record found for User ID <%= atm_id %></div>
<%
            }

            conn.close();
        } catch(Exception ex) {
%>
            <div class="message"><%= ex.getMessage() %></div>
<%
        }
    }
%>

    </body>
</html>
