<%-- 
    Document   : deleterecordprocess
    Created on : 2 Jan 2026, 3:23:56 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <%
        try  
        {
            /* TODO output your page here. You may use following sample code. */
         String atm_id=(String)request.getParameter("atm_id");
         
         
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM","root","mysql@9014");
   
         String update_qry="delete from atm_details where ATM_ID="+atm_id+";";
   
         Statement st=conn.createStatement();
         st.executeUpdate(update_qry);
         conn.close();
         out.println("<style>");
         out.println("body {background-color:lavenderblush; text-align:center}");
         out.println("</style>");
         out.println("<h1>RECORD DELETED!</h1>");
        }
        catch(ClassNotFoundException ex)
        {
        out.println(ex.getMessage());
        }
        catch(SQLException ex)
        {
        out.println(ex.getMessage());
        }
            
            %>
    </body>
</html>
