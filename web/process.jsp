<%-- 
    Document   : process
    Created on : 23 Dec 2025, 10:52:32 am
    Author     : k balaji
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
        <%
            String action=(String)request.getParameter("action");
            if("SIGN UP".equals(action))
            {
                response.sendRedirect("signup.jsp");
            }
            
            if("SIGN IN".equals(action))
            {
                
                        String user=(String)request.getParameter("user");
                        String userpassword=(String)request.getParameter("userpassword");
                        
                        if (user == null || user.trim().isEmpty() || userpassword == null || userpassword.trim().isEmpty()) 
                        {

                            response.sendRedirect("index.jsp?error=empty");
                            return;
                        }
                        try
                        {
                            
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM","root","mysql@9014");
                        Statement st1=conn.createStatement();
                         
                        String admin_qry="select * from admin_login where ADMIN_EMAIL='"+user+"' AND ADMIN_PASSWORD='"+userpassword+"';";
                        ResultSet admin_rs=st1.executeQuery(admin_qry);
                        if(admin_rs.next())
                        {
                            session.setAttribute("admin", user);
                            response.sendRedirect("admindashboard.jsp");
                            return;
                        }
                        String select_qry="select * from users where (USER_NAME='"+user+"' OR USER_EMAIL='"+user+"') AND USER_PASSWORD='"+userpassword+"';";
                        Statement st2=conn.createStatement();
                        ResultSet user_rs=st2.executeQuery(select_qry);
                        if(user_rs.next())
                        {
                            response.sendRedirect("userdashboard.jsp");
                            return;
                        }
                        else
                        {
                            response.sendRedirect("index.jsp?error=invalid");
                        }
                        conn.close();
                    }
                    catch(ClassNotFoundException ex)
                    {
                        out.println(ex.getMessage());
                    }
                    catch(SQLException ex)
                    {
                        out.println(ex.getMessage());
                    }
            }
            %>
