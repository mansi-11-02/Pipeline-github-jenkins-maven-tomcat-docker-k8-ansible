<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic JSP Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        header, footer {
            background-color: #f8f9fa;
            padding: 10px;
            text-align: center;
        }
        nav {
            margin: 10px 0;
            text-align: center;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #007bff;
        }
        .content {
            margin: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to My JSP Website</h1>
    </header>
    <nav>
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
    </nav>
    <div class="content">
        <h2>Current Date and Time</h2>
        <p>The current date and time is: <%= new Date() %></p>
    </div>
    <footer>
        <p>© 2024 My JSP Website</p>
    </footer>
</body>
</html>
