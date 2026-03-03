<%-- 
    Document   : modifyrecordprocess
    Created on : 2 Jan 2026, 3:13:52 pm
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
            
        try  
        {
            /* TODO output your page here. You may use following sample code. */
         String atm_id=(String)request.getParameter("atm_id");
         String city=(String)request.getParameter("city");
         String area=(String)request.getParameter("area");
         String status=(String)request.getParameter("status");
         
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM","root","mysql@9014");
   
         String update_qry="update atm_details set ATM_CITY='"+city+"', ATM_AREA_LANDMARK='"+area+"', ATM_STATUS='"+status+"' where ATM_ID="+atm_id+";";
   
         Statement st=conn.createStatement();
         st.executeUpdate(update_qry);
         conn.close();
         out.println("<style>");
         out.println("body {background-color:lavenderblush; text-align:center; margin-top:20px;}");
         out.println("</style>");
         out.println("<h1>RECORD UPDATED!</h1>");
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
