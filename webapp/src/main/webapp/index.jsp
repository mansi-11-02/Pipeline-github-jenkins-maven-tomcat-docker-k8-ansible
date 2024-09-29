<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Example</title>
    <style>
        body {
            background-color: #f0f8ff; /* Light blue background */
            color: #333; /* Dark text color */
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #4682b4; /* Steel blue header */
            color: white;
            padding: 10px;
            text-align: center;
        }
        .content {
            margin: 20px;
            padding: 20px;
            background-color: #ffffff; /* White content background */
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to My JSP Page</h1>
    </div>
    <div class="content">
        <h2>Current Date and Time</h2>
        <p>The current date and time is: <%= new Date() %></p>
    </div>
</body>
</html>
