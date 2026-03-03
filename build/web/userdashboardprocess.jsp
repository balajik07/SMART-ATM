<%--
    Document   : userdashboardprocess
    Created on : 2 Jan 2026, 11:16:33 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Orbitron:wght@500;600;700&display=swap" rel="stylesheet">

    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #e8f0f5, #c8d6e0);
            margin: 0;
            padding: 20px;
            color: #1c1c1c;
            background: #1f2937;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: rgba(0,0,0,0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }

        header h1 {
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            font-size: 22px;
            color: #1c1c1c;
            letter-spacing: 1px;
        }

        h2 {
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            color: #4fd1c5;
            margin-bottom: 20px;
        }

        #map {
            height: 500px;
            width: 100%;
            margin-top: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .card {
            background: #ffffff;
            padding: 18px 20px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .card h3 {
            font-family: 'Orbitron', sans-serif;
            font-weight: 600;
            color: #00796b;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 16px;
            color: #333;
            margin-bottom: 6px;
        }

        @media(max-width:768px){
            body { padding: 10px; }
            #map { height: 350px; }
        }
    </style>
</head>

<body>

<h2>Nearest ATM Route</h2>

<%
double atmLat = 0.0;
double atmLng = 0.0;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ATM","root","mysql@9014");

    String city = request.getParameter("city");
    String area = request.getParameter("area");
    String bankname = request.getParameter("bankname");

    String sql = "SELECT * FROM atm_details WHERE ATM_CITY=? AND ATM_AREA_LANDMARK=? AND BANK_NAME=?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, city);
    ps.setString(2, area);
    ps.setString(3, bankname);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        atmLat = rs.getDouble("LATITUDE");
        atmLng = rs.getDouble("LONGITUDE");
%>

<div class="card">
    <h3>ATM Details</h3>
    <p><b>Bank:</b> <%= rs.getString("BANK_NAME") %></p>
    <p><b>Area:</b> <%= rs.getString("ATM_AREA_LANDMARK") %></p>
    <p><b>Status:</b> <%= rs.getString("ATM_STATUS") %></p>
</div>

<%
    } else {
        out.println("<p style='color:red;'>No ATM found</p>");
    }
    conn.close();
} catch(Exception e) {
    out.println("<p style='color:red;'>"+e.getMessage()+"</p>");
}
%>

<div id="map"></div>

<!-- Leaflet JS -->
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<script>
const atmLat = <%= atmLat %>;
const atmLng = <%= atmLng %>;

const orsApiKey = "eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6ImQzOGI0ODg1YTJhYjQ3M2ZhOTVhNTIwMzg1ZjFiYzZjIiwiaCI6Im11cm11cjY0In0=";

// Initialize map
const map = L.map('map').setView([atmLat, atmLng], 13);

// Tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap'
}).addTo(map);

// ATM marker
L.marker([atmLat, atmLng]).addTo(map)
    .bindPopup("ATM Location")
    .openPopup();

// Get user location
navigator.geolocation.getCurrentPosition(position => {
    const userLat = position.coords.latitude;
    const userLng = position.coords.longitude;

    // User marker
    L.marker([userLat, userLng]).addTo(map)
        .bindPopup("You are here");

    // ORS Route (Two-Wheeler)
    fetch("https://api.openrouteservice.org/v2/directions/cycling-regular/geojson", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": orsApiKey
        },
        body: JSON.stringify({
            coordinates: [
                [userLng, userLat],
                [atmLng, atmLat]
            ]
        })
    })
    .then(res => res.json())
    .then(data => {
        L.geoJSON(data, {
            style: {
                color: "blue",
                weight: 5
            }
        }).addTo(map);
    });

});
</script>

</body>
</html>
