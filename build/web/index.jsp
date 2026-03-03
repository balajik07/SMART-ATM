<%--
    Document   : home
    Created on : 28 Dec 2025, 11:17:56 pm
    Author     : k balaji
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart ATM Portal</title>

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
            background: linear-gradient(135deg, #1c1c1c, #2c3e50);
            color: #fff;
            display: flex;
            flex-direction: column;
        }

        /* Header Cyber Styling */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background: rgba(0,0,0,0.5);
        }

        header h1 {
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            font-size: 28px;
            color: #00ff9d; /* Neon green */
            
        }

        header nav a {
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            text-decoration: none;
            color: #e0f7fa; /* Light cyan */
            margin-left: 20px;
            padding: 10px 22px;
            border-radius: 30px;
            border: 1px solid #00ff9d; /* Neon green border */
            transition: 0.3s;
        }

        header nav a:hover {
            background: #00ff9d;
            color: #1c1c1c;
            box-shadow: 0 0 12px #00ff9d, 0 0 24px #00ff9d;
        }

        /* HERO SECTION */
        .hero {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 50px;
            position: relative;
            background: url('https://images.unsplash.com/photo-1573164574391-1735c498b82b?auto=format&fit=crop&w=1470&q=80') no-repeat center/cover;
        }

        .overlay {
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.6);
        }

        .hero-wrapper {
            position: relative;
            z-index: 2;
            display: flex;
            align-items: center;
            max-width: 1200px;
            width: 100%;
            gap: 50px;
        }

        /* LEFT CONTENT */
        .hero-content {
            flex: 1;
            text-align: left;
        }

        /* Title & Subtitle Animation */
        @keyframes cyberSlideOnce {
            from {
                opacity: 0;
                transform: translateX(-60px) scale(0.96);
                text-shadow: 0 0 0 rgba(0,255,200,0);
            }
            to {
                opacity: 1;
                transform: translateX(0) scale(1);
                text-shadow: 0 0 14px rgba(0,255,200,0.6);
            }
        }

        .cyber-title {
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            font-size: 48px;
            animation: cyberSlideOnce 1.3s ease-out forwards;
            letter-spacing: 2px;
            margin-bottom: 6px;
            
        }

        .cyber-subtitle {
            font-family: 'Orbitron', sans-serif;
            font-weight: 500;
            font-size: 25px;
            color: #4fd1c5;
            animation: cyberSlideOnce 1.6s ease-out forwards;
            letter-spacing: 1.5px;
            margin-bottom: 18px;
        }

        /* Paragraph & List Styling (Cyber Theme, No Animation) */
        .hero-content p {
            font-family: 'Orbitron', sans-serif;
            font-weight: 400;
            font-size: 18px;
            line-height: 1.7;
            color: #e0f7fa;
            letter-spacing: 0.5px;
            margin-bottom: 20px;
            max-width: 520px;
        }

        .hero-content ul {
            font-family: 'Orbitron', sans-serif;
            font-weight: 500;
            font-size: 17px;
            line-height: 1.8;
            color: #00ff9d;
            list-style: none;
            margin-left: 10px;
        }

        .hero-content ul li {
            margin-bottom: 12px;
            position: relative;
            padding-left: 25px;
        }

        .hero-content ul li::before {
            content: "✔";
            position: absolute;
            left: 0;
            color: #00ff9d;
        }

        /* RIGHT IMAGE */
        .hero-image {
            flex: 1;
            text-align: right;
        }

        .hero-image img {
            max-width: 100%;
            height: auto;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.6);
        }

        footer {
            text-align: center;
            padding: 15px 0;
            font-size: 14px;
            background: rgba(0,0,0,0.5);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero-wrapper {
                flex-direction: column;
                text-align: center;
            }

            .hero-image {
                text-align: center;
            }

            .cyber-title {
                font-size: 36px;
            }

            .hero-content p {
                max-width: 100%;
            }
        }

    </style>
</head>

<body>

<header>
    <h1>Smart ATM Portal</h1>
    <nav>
        <a href="signin.jsp">Sign In</a>
        <a href="signup.jsp">Sign Up</a>
    </nav>
</header>

<section class="hero">
    <div class="overlay"></div>

    <div class="hero-wrapper">

        <!-- LEFT CONTENT -->
        <div class="hero-content">
            <h2 class="cyber-title">ATM Smart Track</h2>
            <h3 class="cyber-subtitle">– Live Cash Availability & Status Monitoring</h3>
            <p>
                Check real-time ATM cash availability and working status before visiting.
                Save time and avoid unnecessary trips.
            </p>
            <ul>
                <li>Location-based ATM search</li>
                <li>Live cash availability</li>
                <li>ATM working / technical status updates</li>
                <li>Admin-controlled secure updates</li>
            </ul>
        </div>

        <!-- RIGHT IMAGE -->
        <div class="hero-image">
            <img src="images/image_stm.png" alt="Smart ATM Monitoring">
        </div>

    </div>
</section>
<footer>
    © 2025 Smart ATM Monitoring System
</footer>

</body>
</html>
