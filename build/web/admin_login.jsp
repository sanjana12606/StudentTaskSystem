<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>

<style>
    body {
        background: #0a0a0a;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Poppins;
        color: white;
    }

    .login-box {
        background: #1a1a1f;
        width: 420px;
        padding: 45px;
        border-radius: 14px;
        border: 1px solid #6a0dad;
        box-shadow: 0 0 25px rgba(106, 13, 173, 0.5);
        text-align: center;
    }

    h2 {
        color: #c084fc;
        font-size: 26px;
        margin-bottom: 25px;
        text-shadow: 0 0 10px rgba(192,132,252,0.7);
    }

    input {
        width: 100%;
        padding: 12px;
        margin: 12px 0;
        background: #111;
        border: 1px solid #9333ea;
        border-radius: 8px;
        font-size: 15px;
        color: white;
    }

    input:focus {
        border-color: #c084fc;
        outline: none;
        box-shadow: 0 0 10px rgba(192,132,252,0.5);
    }

    .btn {
        width: 100%;
        padding: 12px;
        background: #7e22ce;
        border: none;
        border-radius: 8px;
        color: white;
        font-size: 16px;
        margin-top: 12px;
        cursor: pointer;
        transition: 0.2s;
    }

    .btn:hover {
        background: #6b21a8;
        box-shadow: 0 0 12px rgba(192,132,252,0.7);
    }

    .back-link {
        margin-top: 18px;
        display: inline-block;
        color: #c084fc;
        text-decoration: none;
    }

    .back-link:hover {
        text-decoration: underline;
    }
</style>

</head>
<body>

<div class="login-box">

    <h2>Admin Login</h2>

    <form action="AdminLoginServlet" method="post">
        <input type="email" name="email" placeholder="Admin Email" required>
        <input type="password" name="password" placeholder="Admin Password" required>

        <button type="submit" class="btn">Login</button>
    </form>

    <a class="back-link" href="login.jsp">← Back to User Login</a>
</div>

</body>
</html>
