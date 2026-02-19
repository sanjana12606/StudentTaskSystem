package com.studenttask.controller;

import com.studenttask.dao.TaskDAO;
import com.studenttask.model.Task;
import com.studenttask.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateTaskServlet")
public class UpdateTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String deadline = request.getParameter("deadline");

        Task task = new Task();
        task.setId(id);
        task.setUserId(user.getId());
        task.setTitle(title);
        task.setDescription(description);
        task.setDeadline(deadline);

        TaskDAO dao = new TaskDAO();

        if (dao.updateTask(task)) {
            response.sendRedirect("viewTasks.jsp");
        } else {
            response.getWriter().println("Update Failed!");
        }
    }
}
