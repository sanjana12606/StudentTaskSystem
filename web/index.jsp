<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Student Task System</title>

<style>
    body {
        background:#0d0d0d; 
        color:#e5e5e5; 
        font-family:Poppins; 
        display:flex; 
        justify-content:center; 
        align-items:center; 
        height:100vh;
    }

    .box {
        background:#111827; 
        padding:40px; 
        width:400px; 
        border-radius:12px; 
        text-align:center; 
        border:1px solid #1e3a8a; 
        box-shadow:0px 4px 20px rgba(0,0,0,0.6);
    }

    h1 {
        color:#60a5fa; 
        margin-bottom:20px;
    }

    a {
        display:block; 
        margin:10px; 
        padding:12px; 
        color:white; 
        text-decoration:none; 
        border-radius:8px; 
        font-size:16px;
    }

    .btn-user {
        background:#2563eb;
    }

    .btn-user:hover {
        background:#1d4ed8;
    }

    .btn-admin {
        background:#7e22ce;
    }

    .btn-admin:hover {
        background:#6b21a8;
    }
</style>

</head>
<body>

<div class="box">
    <h1>Student Task System</h1>

    <a class="btn-user" href="register.jsp">Register</a>
    <a class="btn-user" href="login.jsp">User Login</a>

    <!-- ADMIN LOGIN BUTTON ADDED HERE -->
    <a class="btn-admin" href="admin_login.jsp">Admin Login</a>
</div>

</body>
</html>
