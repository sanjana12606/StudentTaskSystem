<%@ page import="java.util.*,com.studenttask.model.*,com.studenttask.dao.*" %>

<%
    User admin = (User) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect("admin_login.jsp"); return; }

    TaskDAO tdao = new TaskDAO();
    UserDAO udao = new UserDAO();

    List<Task> tasks = null;

    // FILTERING
    String userId = request.getParameter("userId");
    String status = request.getParameter("status");

    if (userId != null) {
        tasks = tdao.getTasksByUserAdmin(Integer.parseInt(userId));
    } else if (status != null) {
        tasks = tdao.getTasksByStatus(status);
    } else {
        tasks = tdao.getAllTasks();
    }

    List<User> users = udao.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Tasks</title>

<style>
    body {
        background:#0a0a0a;
        color:white;
        font-family:Poppins;
        padding:30px;
    }

    .title {
        text-align:center;
        color:#c084fc;
        font-size:28px;
        margin-bottom:20px;
        text-shadow:0 0 12px rgba(192,132,252,0.7);
    }

    .container {
        background:#1a1a1f;
        border:1px solid #6a0dad;
        border-radius:14px;
        padding:25px;
        width:95%;
        max-width:1100px;
        margin:auto;
        box-shadow:0 0 25px rgba(106,13,173,0.45);
    }

    .filter-box {
        display:flex;
        justify-content:space-between;
        margin-bottom:25px;
        flex-wrap:wrap;
    }

    select {
        background:#111;
        color:white;
        padding:10px;
        border-radius:8px;
        border:1px solid #9333ea;
        width:200px;
    }

    select:hover {
        border-color:#c084fc;
    }

    table {
        width:100%;
        border-collapse:collapse;
        border-radius:12px;
        overflow:hidden;
    }

    th {
        background:#4c1d95;
        padding:12px;
        color:white;
        font-weight:500;
        border-bottom:2px solid #6a0dad;
        text-align:center;
    }

    td {
        padding:12px;
        background:#111;
        border-bottom:1px solid #2d1b3d;
        text-align:center;
    }

    tr:nth-child(even) td {
        background:#0f0f15;
    }

    .btn-delete {
        background:#dc2626;
        padding:8px 15px;
        border-radius:8px;
        color:white;
        text-decoration:none;
    }
    .btn-delete:hover {
        background:#b91c1c;
    }

    .back-btn {
        display:block;
        margin:20px auto;
        width:220px;
        background:#9333ea;
        padding:12px;
        color:white;
        text-align:center;
        text-decoration:none;
        border-radius:10px;
    }

    .back-btn:hover {
        background:#7e22ce;
    }
</style>

</head>
<body>

<a class="back-btn" href="admin_dashboard.jsp"> Back to Admin Dashboard</a>

<h2 class="title">Manage All Tasks</h2>

<div class="container">

    <!-- FILTERS -->
    <div class="filter-box">

        <!-- Filter by User -->
        <form method="get">
            <select name="userId" onchange="this.form.submit()">
                <option value="">Filter by User</option>
                <% for (User u : users) { %>
                    <option value="<%= u.getId() %>"><%= u.getName() %></option>
                <% } %>
            </select>
        </form>

        <!-- Filter by Status -->
        <form method="get">
            <select name="status" onchange="this.form.submit()">
                <option value="">Filter by Status</option>
                <option value="Pending">Pending</option>
                <option value="Completed">Completed</option>
            </select>
        </form>

    </div>

    <!-- TASK TABLE -->
    <table>
        <tr>
            <th>ID</th>
            <th>User</th>
            <th>Title</th>
            <th>Deadline</th>
            <th>Status</th>
            <th>Delete</th>
        </tr>

        <% for (Task t : tasks) { %>
        <tr>
            <td><%= t.getId() %></td>
            <td><%= t.getUserName() %></td>
            <td><%= t.getTitle() %></td>
            <td><%= t.getDeadline() %></td>

            <td>
                <% if("Completed".equals(t.getStatus())) { %>
                    <span style="color:#10b981; font-weight:600;">Completed</span>
                <% } else { %>
                    <span style="color:#fbbf24; font-weight:600;">Pending</span>
                <% } %>
            </td>

            <td>
                <a class="btn-delete"
                   onclick="return confirm('Delete this task?');"
                   href="DeleteTaskServlet?id=<%= t.getId() %>">
                   Delete
                </a>
            </td>
        </tr>

        <% } %>

    </table>

</div>

</body>
</html>
