<%@ page import="com.studenttask.model.User" %>
<%@ page import="com.studenttask.dao.TaskDAO" %>
<%@ page import="com.studenttask.dao.UserDAO" %>

<%
    User admin = (User) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect("admin_login.jsp"); return; }

    TaskDAO tdao = new TaskDAO();
    UserDAO udao = new UserDAO();

    int totalUsers = udao.getTotalUsers();
    int totalTasks = tdao.getAdminTotalTasks();
    int completed = tdao.getAdminCompletedTasks();
    int pending = tdao.getAdminPendingTasks();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
    body {
        background:#0a0a0a;
        font-family:Poppins;
        color:white;
        padding:30px;
    }

    /* Navbar */
    .navbar {
        background:#4c1d95;
        padding:18px 30px;
        border-radius:12px;
        display:flex;
        justify-content:space-between;
        align-items:center;
        margin-bottom:35px;
        box-shadow:0 0 20px rgba(139,92,246,0.4);
        border:1px solid #9333ea;
    }

    .navbar h2 {
        color:white;
        font-size:24px;
    }

    .logout-btn {
        background:#9333ea;
        padding:10px 16px;
        color:white;
        border-radius:8px;
        text-decoration:none;
    }
    .logout-btn:hover {
        background:#7e22ce;
    }

    /* Analytics Grid */
    .analytics-grid {
        display:flex;
        justify-content:space-between;
        flex-wrap:wrap;
    }

    .card {
        background:#1a1a1f;
        width: 260px;
        padding:35px 20px;
        border-radius:14px;
        text-align:center;
        margin:20px;
        border:1px solid #6a0dad;
        box-shadow:0px 0px 25px rgba(106,13,173,0.5);
    }

    .card h3 {
        color:#c084fc;
        font-size:20px;
        margin-bottom:10px;
    }

    .card p {
        font-size:36px;
        font-weight:600;
    }

    .btn-center {
        margin-top:40px;
        display:flex;
        justify-content:center;
        gap:25px;
    }

    .btn {
        background:#7e22ce;
        padding:14px 20px;
        border-radius:10px;
        text-decoration:none;
        color:white;
        font-size:15px;
        width:200px;
        text-align:center;
        transition:0.2s;
    }

    .btn:hover {
        background:#6b21a8;
        box-shadow:0 0 12px rgba(192,132,252,0.7);
    }

</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Admin Dashboard</h2>
    <a class="logout-btn" href="LogoutServlet">Logout</a>
</div>

<!-- ANALYTICS -->
<div class="analytics-grid">

    <div class="card">
        <h3>Total Users</h3>
        <p><%= totalUsers %></p>
    </div>

    <div class="card">
        <h3>Total Tasks</h3>
        <p><%= totalTasks %></p>
    </div>

    <div class="card">
        <h3>Completed Tasks</h3>
        <p style="color:#10b981;"><%= completed %></p>
    </div>

    <div class="card">
        <h3>Pending Tasks</h3>
        <p style="color:#fbbf24;"><%= pending %></p>
    </div>

</div>

<!-- ACTION BUTTONS -->
<div class="btn-center">
    <a class="btn" href="admin_users.jsp">Manage Users</a>
    <a class="btn" href="admin_tasks.jsp">Manage Tasks</a>
</div>

</body>
</html>
