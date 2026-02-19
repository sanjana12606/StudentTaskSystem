package com.studenttask.controller;

import com.studenttask.dao.TaskDAO;
import com.studenttask.model.Task;
import com.studenttask.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditTaskServlet")
public class EditTaskServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int taskId = Integer.parseInt(request.getParameter("id"));

        TaskDAO dao = new TaskDAO();
        Task task = dao.getTasksByUser(user.getId())
                       .stream()
                       .filter(t -> t.getId() == taskId)
                       .findFirst()
                       .orElse(null);

        if (task == null) {
            response.getWriter().println("Task Not Found!");
            return;
        }

        request.setAttribute("task", task);
        request.getRequestDispatcher("editTask.jsp").forward(request, response);
    }
}
