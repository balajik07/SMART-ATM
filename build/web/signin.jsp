<%--
    Document   : signin
    Created on : 28 Dec 2025, 11:30:17 pm
    Author     : k balaji
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Smart ATM Sign In</title>

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;600;700&display=swap" rel="stylesheet">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Inter', sans-serif;
    }

    body {
        min-height: 100vh;
        background: linear-gradient(135deg, #222, #3a4a60); /* brighter background */
        color: #fff;
        display: flex;
        flex-direction: column;
    }

    /* Header Styling */
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 40px;
        background: rgba(0,0,0,0.6);
    }

    header h1 {
        font-family: 'Orbitron', sans-serif;
        font-weight: 600;
        font-size: 22px; /* clean, readable */
        color: #ffffff; /* plain white */
        text-shadow: none; /* removed neon glow */
        letter-spacing: 1px;
    }

    nav a {
        font-family: 'Orbitron', sans-serif;
        font-weight: 600;
        text-decoration: none;
        color: #e0f7fa; /* light cyan */
        margin-left: 15px;
        padding: 8px 20px;
        border-radius: 30px;
        border: 1px solid #00ffb3; /* subtle neon border */
        transition: 0.3s;
    }

    nav a:hover {
        background: #00ffb3;
        color: #1c1c1c;
        box-shadow: 0 0 12px #00ffb3, 0 0 24px #00ffb3;
    }

    /* HERO / SIGNIN SECTION */
    .hero {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 60px 20px;
        position: relative;
    }

    .signin-container {
        position: relative;
        z-index: 2;
        background: rgba(255,255,255,0.1);
        padding: 40px 35px;
        border-radius: 12px;
        backdrop-filter: blur(10px);
        width: 100%;
        max-width: 400px;
        color: #ffffff;
    }

    .signin-container h2 {
        text-align: center;
        font-size: 35px;
        font-weight: 800;
        margin-bottom: 25px;
        color: #4fd1c5; /* softer teal color */
    }

    .signin-container form input[type="text"],
    .signin-container form input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 20px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        background: rgba(255,255,255,0.2);
        color: #ffffff;
    }

    .signin-container form input::placeholder {
        color: #eee;
    }

    .signin-container form input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: #4fd1c5; /* softer teal color */
        border: none;
        border-radius: 8px;
        color: #1c1c1c; /* dark text for contrast */
        font-weight: 700;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .signin-container form input[type="submit"]:hover {
        background: #3bb3a7; /* darker shade on hover */
        color: #fff;
    }

    .signin-footer {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #fff;
    }

    /* Responsive */
    @media(max-width:768px){
        header { padding: 15px 20px; }
        .signin-container { padding: 30px 20px; }
        .signin-container h2 { font-size: 28px; }
    }

</style>
</head>
<body>

<header>
    <h1>Smart ATM Portal</h1>
    <nav>
        <a href="help.jsp">Need Help?</a>
        <a href="signup.jsp">SIGN UP</a>
    </nav>
</header>

<section class="hero">
    <div class="signin-container">
        <h2>SIGN IN</h2>
        <form action="process.jsp" method="post">
            <input type="text" name="user" placeholder="Enter Name or Email" required>
            <input type="password" name="userpassword" placeholder="Enter Valid Password" required>
            <input type="submit" name="action" value="SIGN IN">
        </form>
        <div class="signin-footer">
            © 2025 Smart ATM Monitoring System
        </div>
    </div>
</section>

</body>
</html>
