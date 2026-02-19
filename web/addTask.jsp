<%@ page import="com.studenttask.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) { response.sendRedirect("login.jsp"); return; }
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Task</title>

<style>
    body { background:#0d0d0d; color:white; padding:20px; font-family:Poppins; }
    .container { background:#111827; padding:35px; border-radius:12px; border:1px solid #1e3a8a; width:450px; margin:auto; }
    input, textarea { width:100%; padding:12px; margin:10px 0; background:#1f2937; border:1px solid #3b82f6; border-radius:8px; color:white; }
    button { width:100%; padding:12px; background:#2563eb; color:white; border:none; border-radius:8px; }
    button:hover { background:#1d4ed8; }
</style>

</head>

<body>

<div class="container">
<h2>Add Task</h2>

<form action="AddTaskServlet" method="post">
    <input type="text" name="title" placeholder="Task Title" required>
    <textarea name="description" placeholder="Task Description" required></textarea>
    <input type="date" name="deadline" required>

    <button type="submit">Save Task</button>
</form>
</div>

</body>
</html>
