<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<style>
    body { background:#0d0d0d; color:#e5e5e5; display:flex; justify-content:center; align-items:center; height:100vh; font-family:Poppins; }
    .form-container { background:#111827; padding:35px; width:380px; border-radius:12px; box-shadow:0px 4px 20px rgba(0,0,0,0.6); border:1px solid #1e3a8a; }
    h2 { color:#60a5fa; margin-bottom:20px; }
    input { width:100%; padding:12px; margin:10px 0; border-radius:8px; border:1px solid #3b82f6; background:#1f2937; color:white; }
    input:focus { border-color:#60a5fa; }
    .btn { width:100%; padding:12px; background:#2563eb; color:white; border:none; border-radius:8px; cursor:pointer; }
    .btn:hover { background:#1d4ed8; }
    a { color:#60a5fa; text-decoration:none; }
</style>

</head>
<body>

<div class="form-container">
    <h2>Register</h2>

    <form action="RegisterServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="password" name="password" placeholder="Password" required>

        <button class="btn" type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>

</body>
</html>
