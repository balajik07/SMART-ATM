<%--
    Document   : process
    Created on : 23 Dec 2025, 10:52:32 am
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("signin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Orbitron:wght@500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --bg-dark: #1f2937;
            --bg-darker: #111827;
            --main-bg: #1c1c2a; /* theme color for main content */
            --accent: #4fd1c5;
            --txt-light: #F9FAFB;
            --txt-dark: #111827;
        }

        body {
            margin: 0;
            height: 100vh;
            font-family: 'Inter', sans-serif;
            background: var(--bg-dark);
            color: var(--txt-light);
        }

        /* Topbar */
        .topbar {
            height: 60px;
            width: 100%;
            background: var(--bg-darker);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 25px;
            font-weight: 600;
            font-size: 18px;
            box-sizing: border-box;
        }

        .logout-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: var(--txt-light);
            text-decoration: none;
            padding: 8px 18px;
            border: 2px solid var(--accent);
            border-radius: 22px;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .logout-btn:hover {
            background: var(--accent);
            color: var(--txt-dark);
        }

        /* Container */
        .container {
            display: flex;
            height: calc(100vh - 60px);
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            background: var(--bg-darker);
            padding: 30px 20px;
            box-sizing: border-box;
            border-right: 1px solid #2d3748;
        }

        .sidebar h2 {
            text-align: center;
            color: var(--accent);
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 800;
            letter-spacing: 1px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            margin-bottom: 10px;
            text-decoration: none;
            color: var(--txt-light);
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
            transition: all 0.25s ease;
        }

        .sidebar a i {
            width: 20px;
            text-align: center;
        }

        .sidebar a:hover, .sidebar a.active {
            background: var(--accent);
            color: var(--txt-dark);
        }

        /* Main content */
        .main {
            flex: 1;
            background: var(--main-bg);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            color: var(--txt-light);
        }

        iframe {
            width: 100%;
            flex: 1;
            border: none;
            background: var(--main-bg);
        }

        /* Welcome Content */
        .welcome {
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            color: var(--accent);
            margin-top: 50px;
        }

        .welcome h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .welcome p {
            font-size: 20px;
            color: #a0f0e5; /* softer teal for text */
        }

    </style>
</head>

<body>

<!-- Top bar -->
<div class="topbar">
    <div>SMART ATM ADMIN DASHBOARD</div>
    <a href="index.jsp" class="logout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> LOGOUT
    </a>
</div>

<!-- Body -->
<div class="container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>ADMIN</h2>

        <a href="showrecords.jsp" target="contentFrame" onclick="hideWelcome()"> 
            <i class="fa-solid fa-table-list"></i> VIEW RECORDS
        </a>

        <a href="addrecords.jsp" target="contentFrame" onclick="hideWelcome()">
            <i class="fa-solid fa-circle-plus"></i> ADD RECORDS
        </a>

        <a href="modifyrecords.jsp" target="contentFrame" onclick="hideWelcome()">
            <i class="fa-solid fa-pen-to-square"></i> MODIFY RECORDS
        </a>

        <a href="deleterecords.jsp" target="contentFrame" onclick="hideWelcome()">
            <i class="fa-solid fa-trash"></i> DELETE RECORDS
        </a>

        <a href="searchrecords.jsp" target="contentFrame" onclick="hideWelcome()">
            <i class="fa-solid fa-magnifying-glass"></i> SEARCH RECORDS
        </a>

    </div>

    <!-- Main content area -->
    <div class="main">
        <div class="welcome" id="welcomeMessage">
            <h1>Welcome, Admin!</h1>
            <p>Manage your Smart ATM portal efficiently using the sidebar options.</p>
        </div>

        <!-- Iframe -->
        <iframe name="contentFrame" onload="checkIframe()"></iframe>
    </div>

</div>

<script>
    const welcome = document.getElementById("welcomeMessage");

    // Hide welcome message if iframe has content
    function hideWelcome() {
        welcome.style.display = "none";
    }

    function checkIframe() {
        const iframe = document.querySelector("iframe");
        try {
            const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;
            if(iframeDoc.body.innerHTML.trim() !== "") {
                hideWelcome();
            }
        } catch(e) {
            // cross-origin, ignore
        }
    }
</script>

</body>
</html>
