<%@ page import="com.studenttask.model.Task" %>

<%
    Task task = (Task) request.getAttribute("task");
    if (task == null) {
        response.sendRedirect("viewTasks.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
</head>
<body>

<h2>Edit Task</h2>
<link rel="stylesheet" href="css/style.css">

<form action="UpdateTaskServlet" method="post">
    
    <input type="hidden" name="id" value="<%= task.getId() %>">

    Title:
    <input type="text" name="title" value="<%= task.getTitle() %>" required><br><br>

    Description:
    <textarea name="description" required><%= task.getDescription() %></textarea><br><br>

    Deadline:
    <input type="date" name="deadline" value="<%= task.getDeadline() %>" required><br><br>

    <input type="submit" value="Update Task">

</form>

</body>
</html>
