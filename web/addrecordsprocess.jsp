<%--  
    Document   : addrecordsprocess  
    Author     : k balaji  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.net.*, java.io.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Insert ATM</title>
</head>
<body>

<%
try {
    /* 1. JDBC CONNECTION */
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ATM", "root", "mysql@9014"
    );

    /* 2. READ ADMIN FORM DATA */
    String atm_id = request.getParameter("atm_id");
    String city = request.getParameter("city");
    String area = request.getParameter("area");
    String bank_name = request.getParameter("bank_name");
    String status = request.getParameter("status");

    /* 3. FREE GEOCODING USING OPENSTREETMAP */
    String locationQuery = area + "," + city;

    String apiUrl = "https://nominatim.openstreetmap.org/search?q="
            + URLEncoder.encode(locationQuery, "UTF-8")
            + "&format=json&limit=1";

    URL url = new URL(apiUrl);
    HttpURLConnection geoConn = (HttpURLConnection) url.openConnection();
    geoConn.setRequestMethod("GET");
    geoConn.setRequestProperty("User-Agent", "SmartATMMonitoring/1.0 (contact: kbalaji.project@gmail.com)");
    geoConn.setConnectTimeout(5000);
    geoConn.setReadTimeout(5000);



    BufferedReader br = new BufferedReader(
        new InputStreamReader(geoConn.getInputStream())
    );

    StringBuilder responseStr = new StringBuilder();
    String line;
    while ((line = br.readLine()) != null) {
        responseStr.append(line);
    }
    br.close();

    double latitude = 0.0;
    double longitude = 0.0;

    String apiResponse = responseStr.toString();

    if (apiResponse.startsWith("[")) {
        int latIndex = apiResponse.indexOf("\"lat\":\"");
        int lonIndex = apiResponse.indexOf("\"lon\":\"");

        if (latIndex != -1 && lonIndex != -1) {
            latitude = Double.parseDouble(
                apiResponse.substring(latIndex + 7, apiResponse.indexOf("\"", latIndex + 7))
            );
            longitude = Double.parseDouble(
                apiResponse.substring(lonIndex + 7, apiResponse.indexOf("\"", lonIndex + 7))
            );
        }
    }

    /* 4. INSERT INTO DATABASE */
    String query =
        "INSERT INTO atm_details " +
        "(ATM_ID, ATM_CITY, ATM_AREA_LANDMARK, BANK_NAME, ATM_STATUS, LATITUDE, LONGITUDE) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?)";

    PreparedStatement ps = conn.prepareStatement(query);
    ps.setInt(1, Integer.parseInt(atm_id));
    ps.setString(2, city);
    ps.setString(3, area);
    ps.setString(4, bank_name);
    ps.setString(5, status);
    ps.setDouble(6, latitude);
    ps.setDouble(7, longitude);

    ps.executeUpdate();
    conn.close();
%>

<style>
    body {
        background-color: #f4f6fb;
        text-align: center;
        font-family: Arial, sans-serif;
    }
    .card {
        background: white;
        padding: 30px;
        margin: 120px auto;
        width: 420px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.15);
    }
</style>

<div class="card">
    <h2>✅ ATM Record Added Successfully</h2>
    <p><b>Latitude:</b> <%= latitude %></p>
    <p><b>Longitude:</b> <%= longitude %></p>
</div>

<%
} catch (Exception e) {
    out.println("<p style='color:red; text-align:center;'>" + e.getMessage() + "</p>");
}
%>

</body>
</html>
