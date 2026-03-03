<%-- 
    Document   : signupprocess
    Created on : 25 Dec 2025, 6:40:22 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Process Page</title>
    </head>
    <body>
        <%
            try
            {
               Class.forName("com.mysql.cj.jdbc.Driver");
               Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM","root","mysql@9014");
               String name=(String)request.getParameter("name");
               String email=(String)request.getParameter("email");
               String password=(String)request.getParameter("password");
               String cpassword=(String)request.getParameter("cpassword");
               if (!password.equals(cpassword)) 
               {
                out.println("❌ Password and Confirm Password do not match");
                return;
               }
               
               if(email.endsWith("@admin.com"))
               {
                   String admin_qry="insert into admin_login values ('"+name+"', '"+email+"', '"+password+"');";
                   
                   Statement st=conn.createStatement();
                   st.executeUpdate(admin_qry);
                   response.sendRedirect("index.jsp");
                   return;
               }
               
               String insert_qry="insert into users values ('"+name+"', '"+email+"', '"+password+"');";
               
               Statement st=conn.createStatement();
               st.executeUpdate(insert_qry);
               response.sendRedirect("index.jsp");
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
