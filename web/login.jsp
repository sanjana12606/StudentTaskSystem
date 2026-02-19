<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<style>
    body { background:#0d0d0d; color:white; height:100vh; display:flex; justify-content:center; align-items:center; font-family:Poppins; }
    .box { background:#111827; padding:35px; border-radius:12px; width:380px; box-shadow:0px 4px 20px rgba(0,0,0,0.6); border:1px solid #1e3a8a; }
    h2 { color:#60a5fa; margin-bottom:15px; }
    input { width:100%; padding:12px; margin:10px 0; background:#1f2937; border:1px solid #3b82f6; border-radius:8px; color:white; }
    .btn { width:100%; padding:12px; background:#2563eb; color:white; border:none; border-radius:8px; }
    .btn:hover { background:#1d4ed8; }
    a { color:#60a5fa; }
</style>

</head>
<body>

<div class="box">
    <h2>Login</h2>

    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>

        <button class="btn" type="submit">Login</button>
    </form>

</div>

</body>
</html>
