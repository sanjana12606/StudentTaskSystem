<%@ page import="com.studenttask.model.User" %>
<%@ page import="com.studenttask.dao.TaskDAO" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) { response.sendRedirect("login.jsp"); return; }

    TaskDAO dao = new TaskDAO();
    int total = dao.getTotalTasks(user.getId());
    int completed = dao.getCompletedTasks(user.getId());
    int pending = dao.getPendingTasks(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<style>
    body {
        background:#0d0d0d;
        color:white;
        font-family:Poppins;
        padding:20px;
    }

    /* Navbar */
    .navbar {
        background:#1e3a8a;
        padding:18px 25px;
        border-radius:12px;
        display:flex;
        justify-content:space-between;
        align-items:center;
    }

    .navbar h2 {
        color:white;
        font-size:22px;
        font-weight:600;
    }

    .logout-btn {
        background:#2563eb;
        padding:10px 16px;
        color:white;
        border-radius:8px;
        text-decoration:none;
        font-size:14px;
    }

    .logout-btn:hover {
        background:#1d4ed8;
    }

    /* Main dashboard container */
    .main-box {
        background:#111827;
        border:1px solid #1e3a8a;
        border-radius:12px;
        padding:35px;
        margin-top:30px;
    }

    .main-box h2 {
        color:#60a5fa;
        margin-bottom:25px;
        text-align:left;
    }

    /* Analytics grid */
    .stats-grid {
        display:flex;
        justify-content:space-around;
        margin-bottom:35px;
        flex-wrap:wrap;
    }

    .stat-box {
        background:#0f172a;
        width:180px;
        padding:25px;
        border-radius:12px;
        text-align:center;
        margin:10px;
        border:1px solid #1e3a8a;
        box-shadow:0px 4px 15px rgba(0,0,0,0.5);
    }

    .stat-box h3 {
        color:#60a5fa;
        margin-bottom:10px;
    }

    .stat-box p {
        font-size:30px;
        font-weight:600;
    }

    /* Buttons container CENTERED */
    .btn-center {
        display:flex;
        justify-content:center;
        gap:20px;
        margin-top:15px;
    }

    .btn {
        background:#2563eb;
        padding:12px 20px;
        color:white;
        border-radius:8px;
        text-decoration:none;
        font-size:14px;
    }

    .btn:hover {
        background:#1d4ed8;
    }
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Welcome, <%= user.getName() %></h2>
    <a class="logout-btn" href="LogoutServlet">Logout</a>
</div>

<!-- DASHBOARD CONTENT -->
<div class="main-box">

    <h2>Dashboard</h2>

    <!-- STATISTICS -->
    <div class="stats-grid">

        <div class="stat-box">
            <h3>Total Tasks</h3>
            <p><%= total %></p>
        </div>

        <div class="stat-box">
            <h3>Completed</h3>
            <p style="color:#10b981;"><%= completed %></p>
        </div>

        <div class="stat-box">
            <h3>Pending</h3>
            <p style="color:#fbbf24;"><%= pending %></p>
        </div>

    </div>

    <!-- CENTER BUTTONS -->
    <div class="btn-center">
        <a class="btn" href="addTask.jsp">Add New Task</a>
        <a class="btn" href="viewTasks.jsp">View Tasks</a>
    </div>

</div>

</body>
</html>
