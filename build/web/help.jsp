<%-- 
    Document   : help
    Created on : 4 Jan 2026, 12:10:18 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help & Support</title>

<style>
:root {
    --bg-dark: #1f2937;
    --bg-darker: #111827;
    --accent: #4fd1c5;
    --txt-light: #F9FAFB;
    --border: #374151;
}

body {
    margin: 0;
    font-family: 'Inter', sans-serif;
    background: var(--bg-dark);
    color: var(--txt-light);
}

/* Container */
.help-container {
    max-width: 600px;
    margin: 40px auto;
    background: var(--bg-darker);
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.4);
}

.help-container h2 {
    text-align: center;
    color: var(--accent);
    margin-bottom: 10px;
}

.help-container p {
    text-align: center;
    color: #cbd5f5;
    margin-bottom: 25px;
}

/* Inputs */
.help-container input,
.help-container textarea,
.help-container select {
    width: 100%;
    padding: 12px 14px;
    margin-bottom: 15px;
    border-radius: 10px;
    border: 1px solid var(--border);
    background: var(--bg-dark);
    color: var(--txt-light);
    font-size: 14px;
}

.help-container textarea {
    resize: none;
}

/* Button */
.help-container button {
    width: 100%;
    padding: 12px;
    background: var(--accent);
    border: none;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 600;
    color: #111827;
    cursor: pointer;
    transition: 0.3s ease;
}

.help-container button:hover {
    background: #38b2ac;
    color: white;
}

/* Small note */
.note {
    text-align: center;
    font-size: 13px;
    margin-top: 15px;
    color: #9ca3af;
}
</style>
</head>

<body>

<div class="help-container">
    <h2>Help & Support</h2>
    <p>Report ATM issues or contact admin</p>
    <form action="helpsubmit.jsp" method="post">
        <input type="text" name="username" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <select name="issue_type" required>
            <option value="">Select Issue Type</option>
            <option value="Cash Not Available">Cash Not Available</option>
            <option value="ATM Not Working">ATM Not Working</option>
            <option value="Wrong Location">Wrong Location</option>
            <option value="Other">Other</option>
        </select>
        <textarea name="message" rows="4" placeholder="Describe the issue..." required></textarea>
        <button type="submit">Submit Request</button>
    </form>

    <div class="note">
        Our admin team will review your request shortly.
    </div>
</div>

</body>
</html>
