<%@ page import="java.util.*,com.studenttask.model.User,com.studenttask.dao.UserDAO" %>

<%
    User admin = (User) session.getAttribute("admin");
    if (admin == null) { response.sendRedirect("admin_login.jsp"); return; }

    UserDAO dao = new UserDAO();
    List<User> users = dao.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>

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
        margin-bottom:25px;
        text-shadow:0 0 12px rgba(192,132,252,0.7);
    }

    .container {
        background:#1a1a1f;
        border:1px solid #6a0dad;
        border-radius:14px;
        padding:25px;
        width:90%;
        max-width:900px;
        margin:auto;
        box-shadow:0 0 25px rgba(106,13,173,0.45);
    }

    table {
        width:100%;
        border-collapse:collapse;
        margin-top:15px;
        border-radius:12px;
        overflow:hidden;
    }

    table th {
        background:#4c1d95;
        padding:12px;
        color:white;
        font-weight:500;
        border-bottom:2px solid #6a0dad;
    }

    table td {
        padding:12px;
        background:#111;
        border-bottom:1px solid #2d1b3d;
        text-align:center;
    }

    table tr:nth-child(even) td {
        background:#0f0f15;
    }

    .btn-delete {
        background:#dc2626;
        padding:8px 15px;
        color:white;
        border-radius:8px;
        text-decoration:none;
    }

    .btn-delete:hover {
        background:#b91c1c;
    }

    .btn-view {
        background:#9333ea;
        padding:8px 15px;
        color:white;
        border-radius:8px;
        text-decoration:none;
    }
    .btn-view:hover {
        background:#7e22ce;
    }

    .top-link {
        display:block;
        width:200px;
        margin:20px auto;
        text-align:center;
        background:#9333ea;
        padding:12px;
        border-radius:8px;
        color:white;
        text-decoration:none;
    }
    .top-link:hover {
        background:#7e22ce;
    }

</style>

</head>
<body>

<a class="top-link" href="admin_dashboard.jsp"> Back to Dashboard</a>

<h2 class="title">Manage Users</h2>

<div class="container">

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>View Tasks</th>
            <th>Delete</th>
        </tr>

        <% for (User u : users) { %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getRole() %></td>

            <td>
                <a class="btn-view" href="admin_tasks.jsp?userId=<%= u.getId() %>">View Tasks</a>
            </td>

            <td>
                <% if (!"admin".equals(u.getRole())) { %>
                    <a class="btn-delete"
                       onclick="return confirm('Delete this user?');"
                       href="DeleteUserServlet?id=<%= u.getId() %>">
                       Delete
                    </a>
                <% } else { %>
                    <span style="color:#9333ea; font-weight:600;">Admin</span>
                <% } %>
            </td>
        </tr>
        <% } %>

    </table>

</div>

</body>
</html>
