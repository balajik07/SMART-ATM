<%-- 
    Document   : signup
    Created on : 25 Dec 2025, 6:23:54 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Smart ATM Sign Up</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Inter', sans-serif;
    }

    body {
        min-height: 100vh;
        background: linear-gradient(135deg, #1c1c1c, #2c3e50); /* original portal theme */
        color: #fff;
        display: flex;
        flex-direction: column;
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 50px;
        background: rgba(0,0,0,0.5);
    }

    header h1 {
        font-size: 28px;
        font-weight: 700;
        color: #fff;
    }

    nav a {
        text-decoration: none;
        color: #fff;
        margin-left: 15px;
        padding: 8px 20px;
        border-radius: 30px;
        border: 1px solid #fff;
        transition: 0.3s;
        font-weight: 600;
    }

    nav a:hover {
        background: #fff;
        color: #2c3e50;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }

    .hero {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 60px 20px;
        position: relative;
    }

    .signup-container {
        position: relative;
        z-index: 2;
        background: rgba(255,255,255,0.1);
        padding: 40px 35px;
        border-radius: 12px;
        backdrop-filter: blur(10px);
        width: 100%;
        max-width: 400px;
        color: #fff;
    }

    .signup-container h2 {
        text-align: center;
        font-size: 35px;
        font-weight: 800;
        margin-bottom: 25px;
        color: #4fd1c5; /* softer teal color */
    }

    .signup-container form input[type="text"],
    .signup-container form input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 20px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        background: rgba(255,255,255,0.2);
        color: #fff;
    }

    .signup-container form input::placeholder {
        color: #eee;
    }

    .signup-container form input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: #4fd1c5;
        border: none;
        border-radius: 8px;
        color: #2c3e50;
        font-weight: 700;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .signup-container form input[type="submit"]:hover {
        background: #3bb3a7;
        color: #fff;
    }

    .signup-footer {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #fff;
    }

    @media(max-width:768px){
        header { padding: 15px 20px; }
        .signup-container { padding: 30px 20px; }
        .signup-container h2 { font-size: 24px; }
    }
</style>
</head>
<body>

<header>
    <h1>Smart ATM Portal</h1>
    <nav>
        <a href="index.jsp">Need Help?</a>
        <a href="signin.jsp">Sign In</a> <!-- link to signin page -->
    </nav>
</header>

<section class="hero">
    <div class="signup-container">
        <h2>SIGN UP</h2>
        <form action="signupprocess.jsp" method="post">
            <input type="text" name="name" placeholder="Enter New User Name" required>
            <input type="text" name="email" placeholder="Enter Valid Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="password" name="cpassword" placeholder="Confirm Password" required>
            <input type="submit" name="action" value="SIGN UP">
        </form>
        <div class="signup-footer">
            © 2025 Smart ATM Monitoring System
        </div>
    </div>
</section>

</body>
</html>
