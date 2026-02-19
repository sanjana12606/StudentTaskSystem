<%@ page import="java.util.*,com.studenttask.model.*,com.studenttask.dao.*" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) { response.sendRedirect("login.jsp"); return; }

    TaskDAO dao = new TaskDAO();
    List<Task> tasks = dao.getTasksByUser(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
<title>Your Tasks</title>

<style>
    body {
        background:#0d0d0d;
        color:white;
        font-family:Poppins;
        padding:30px;
        display:flex;
        justify-content:center;
        align-items:flex-start;
    }

    .wrapper {
        width: 90%;
        max-width: 700px;
        background:#111827;
        padding:30px;
        border-radius:12px;
        border:1px solid #1e3a8a;
        box-shadow:0px 4px 20px rgba(0,0,0,0.6);
    }

    h2 {
        text-align:center;
        color:#60a5fa;
        margin-bottom:20px;
    }

    table {
        width:100%;
        border-collapse:collapse;
        margin-top:20px;
        border-radius:12px;
        overflow:hidden;
    }

    table th {
        background:#1e3a8a;
        color:white;
        padding:12px;
        text-align:center;
        font-weight:500;
    }

    table td {
        padding:12px;
        background:#111827;
        border-bottom:1px solid #1f2937;
        text-align:center;
    }

    table tr:nth-child(even) td {
        background:#0f172a;
    }

    /* Buttons */
    a.btn {
        padding:8px 12px;
        color:white;
        text-decoration:none;
        border-radius:6px;
        font-size:14px;
    }

    .edit-btn { background:#2563eb; }
    .edit-btn:hover { background:#1d4ed8; }

    .delete-btn { background:#dc2626; }
    .delete-btn:hover { background:#b91c1c; }

    .complete-btn { background:#10b981; }
    .complete-btn:hover { background:#059669; }

    .completed-icon {
        color:#10b981;
        font-size:18px;
        font-weight:bold;
    }

    .btn-top {
        display:block;
        width:200px;
        margin:auto;
        background:#2563eb;
        padding:12px;
        text-align:center;
        border-radius:8px;
        margin-bottom:20px;
        color:white;
        text-decoration:none;
    }

    .btn-top:hover {
        background:#1d4ed8;
    }

</style>

</head>
<body>

<div class="wrapper">

    <h2>Your Tasks</h2>

    <a class="btn-top" href="addTask.jsp">Add New Task</a>

    <table>
        <tr>
            <th>Title</th>
            <th>Deadline</th>
            <th>Status</th>
            <th>Edit</th>
            <th>Delete</th>
            <th>Complete</th>
        </tr>

        <% for (Task t : tasks) { %>
        <tr>
            <td><%= t.getTitle() %></td>
            <td><%= t.getDeadline() %></td>

            <td>
                <% if(t.getStatus().equals("Completed")) { %>
                    <span class="completed-icon"> Completed</span>
                <% } else { %>
                    <span style="color:#fbbf24;">Pending</span>
                <% } %>
            </td>

            <td>
                <a class="btn edit-btn" href="EditTaskServlet?id=<%= t.getId() %>">Edit</a>
            </td>

            <td>
                <a class="btn delete-btn"
                   href="DeleteTaskServlet?id=<%= t.getId() %>"
                   onclick="return confirm('Delete this task?');">Delete</a>
            </td>

            <td>
                <% if (!t.getStatus().equals("Completed")) { %>
                    <a class="btn complete-btn" href="CompleteTaskServlet?id=<%= t.getId() %>">Complete</a>
                <% } else { %>
                    <span class="completed-icon">done</span>
                <% } %>
            </td>

        </tr>
        <% } %>

    </table>

</div>

</body>
</html>
