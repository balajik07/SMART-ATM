<%-- 
    Document   : findatm
    Created on : 4 Jan 2026, 11:47:21 am
    Author     : k balaji
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find ATM</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: #1f2937;
        }

        .card {
            max-width: 520px;
            margin: 60px auto;
            background: #111827;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 20px 45px rgba(0,0,0,0.15);
            animation: fadeUp 0.5s ease;
        }

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(25px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            text-align: center;
            color: #f9fafb;
            margin-bottom: 8px;
        }

        p {
            text-align: center;
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            color: #d1d5db;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border-radius: 10px;
            border: 1px solid #d1d5db;
            font-size: 14px;
            outline: none;
            transition: 0.3s;
            background: #1f2937;
            color: #f9fafb;
            border: 1px solid #374151;
        }

        input[type="text"]:focus {
            border-color: #4fd1c5;
            box-shadow: 0 0 8px rgba(79,209,197,0.4);
        }

        button {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(to right, #1f2937, #111827);
            color: #ffffff;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background: linear-gradient(to right, #4fd1c5, #38b2ac);
            color: #111827;
            transform: scale(1.02);
        }

        .hint {
            text-align: center;
            margin-top: 15px;
            font-size: 12px;
            color: #6b7280;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>🔍 Find ATM</h2>
    <p>Search ATM cash & working status in your area</p>

    <form action="userdashboardprocess.jsp" method="post">

        <label>City</label>
        <input type="text" name="city" placeholder="Eg: Chennai" required>

        <label>Area / Landmark</label>
        <input type="text" name="area" placeholder="Eg: Koyembedu Bus Stand" required>

        <label>Bank Name</label>
        <input type="text" name="bankname" placeholder="Eg: SBI, ICICI, HDFC" required>

        <button type="submit">Find ATM</button>
    </form>

    <div class="hint">
        📍 Tip: Use a popular landmark for better accuracy
    </div>
</div>

</body>
</html>

