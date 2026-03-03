<%-- 
    Document   : nearbyatm
    Created on : 4 Jan 2026, 12:02:14 pm
    Author     : k balaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nearby ATMs</title>

    <!-- Leaflet CSS -->
    <link
        rel="stylesheet"
        href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
    />

    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #1f2937;
        }

        .wrapper {
            padding: 20px;
        }

        h2 {
            color: #f9fafb;
            margin-bottom: 10px;
        }

        .detect-btn {
            background: #1f2937;
            color: #f9fafb;
            border: none;
            padding: 10px 18px;
            border-radius: 10px;
            font-size: 14px;
            cursor: pointer;
            font-weight: 600;
        }

        .detect-btn:hover {
            background: #4fd1c5;
            color: #111827;
        }

        #map {
            margin-top: 15px;
            width: 100%;
            height: 450px;
            border-radius: 14px;
            border: 1px solid #e5e7eb;
        }
    </style>
</head>

<body>

<div class="wrapper">
    <h2>📍 Nearby ATMs</h2>

    <!-- A. Detect Location Button -->
    <button class="detect-btn" onclick="detectLocation()">
        📍 Detect My Location
    </button>

    <!-- B. Map Section -->
    <div id="map"></div>
</div>

<!-- Leaflet JS -->
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<script>
    let map;

    function detectLocation() {
        if (!navigator.geolocation) {
            alert("Geolocation not supported");
            return;
        }

        navigator.geolocation.getCurrentPosition(
            position => {
                const lat = position.coords.latitude;
                const lng = position.coords.longitude;

                // Initialize map
                if (!map) {
                    map = L.map('map').setView([lat, lng], 14);

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '© OpenStreetMap'
                    }).addTo(map);
                } else {
                    map.setView([lat, lng], 14);
                }

                // User marker
                L.marker([lat, lng])
                    .addTo(map)
                    .bindPopup("📍 You are here")
                    .openPopup();

                // 🔴 SAMPLE ATM MARKERS (replace later from DB)
                addAtmMarker(13.0710991, 80.2017632, "ICICI ATM - Koyembedu");
                addAtmMarker(13.067439, 80.205873, "SBI ATM - CMBT");
            },
            error => {
                alert("Location access denied");
            },
            {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 0
            }
        );
    }

    function addAtmMarker(lat, lng, name) {
        L.marker([lat, lng])
            .addTo(map)
            .bindPopup("🏦 " + name);
    }
</script>

</body>
</html>

