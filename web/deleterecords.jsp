<%-- 
    Document   : deleterecords
    Created on : 29 Dec 2025, 10:16:02 am
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete ATM Record</title>

<style>
    body {
        margin: 0;
        height: 100vh;
        background-color: #1f2937;
        font-family: 'Inter', sans-serif;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #F9FAFB;
    }

    .card {
        background: #111827;
        padding: 35px 40px;
        border-radius: 18px;
        width: 420px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.5);
        text-align: center;
    }

    h2 {
        color: #ef4444;
        margin-bottom: 25px;
        letter-spacing: 1px;
    }

    input[type="text"] {
        width: 100%;
        padding: 12px 14px;
        margin-bottom: 18px;
        border-radius: 10px;
        border: 1px solid #374151;
        background: #1f2937;
        color: #F9FAFB;
        font-size: 15px;
        text-align: center;
    }

    input::placeholder {
        color: #9ca3af;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: #ef4444;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
        color: white;
        transition: 0.3s ease;
    }

    input[type="submit"]:hover {
        background: #dc2626;
        transform: translateY(-2px);
    }
</style>
</head>

<body>

<div class="card">
    <h2>DELETE ATM RECORD</h2>

    <form action="deleterecordprocess.jsp" method="post">
        <input type="text" name="atm_id" placeholder="ATM ID to Delete" required>
        <input type="submit" value="DELETE RECORD">
    </form>
</div>

</body>
</html>
