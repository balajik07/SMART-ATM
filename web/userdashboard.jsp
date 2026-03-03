<%-- 
    Document   : userdashboard
    Created on : 2 Jan 2026, 10:42:14 pm
    Author     : k balaji
--%>
<%-- 
    Document   : userdashboard
    Author     : K Balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard | Smart ATM</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        :root {
            --bg-dark: #1f2937;
            --bg-darker: #111827;
            --accent: #4fd1c5;
            --hover-light: #ffffff33;
            --txt-light: #F9FAFB;
            --txt-dark: #111827;
        }

        body {
            margin: 0;
            height: 100vh;
            font-family: 'Inter', sans-serif;
            background: var(--bg-dark);
        }

        /* ===== Topbar ===== */
        .topbar {
            height: 60px;
            width: 100%;
            background: var(--bg-darker);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 25px;
            box-sizing: border-box;
            color: var(--txt-light);
            font-weight: 600;
            font-size: 18px;
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

        /* ===== Layout ===== */
        .container {
            display: flex;
            height: calc(100vh - 60px);
        }

        /* ===== Sidebar ===== */
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
            transition: 0.25s;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background: var(--accent);
            color: var(--txt-dark);
        }

        /* ===== Main ===== */
        .main {
            flex: 1;
            background: white;
            display: flex;
            flex-direction: column;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>

<body>

<!-- Top Bar -->
<div class="topbar">
    <div>SMART ATM USER DASHBOARD</div>
    <a href="index.jsp" class="logout-btn">
        <i class="fa-solid fa-right-from-bracket"></i> LOGOUT
    </a>
</div>

<!-- Body -->
<div class="container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>USER</h2>

        <a href="findatm.jsp" target="contentFrame">
            <i class="fa-solid fa-location-dot"></i> FIND ATM
        </a>

        <a href="nearbyatm.jsp" target="contentFrame">
            <i class="fa-solid fa-map"></i> NEARBY ATMs
        </a>

        <a href="help.jsp" target="contentFrame">
            <i class="fa-solid fa-circle-info"></i> HELP
        </a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <iframe name="contentFrame" src="findatm.jsp"></iframe>
    </div>

</div>

</body>
</html>
