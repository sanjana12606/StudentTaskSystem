package com.studenttask.controller;

import com.studenttask.dao.TaskDAO;
import com.studenttask.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        TaskDAO dao = new TaskDAO();
        boolean deleted = dao.deleteTask(id, user.getId());

        if (deleted) {
            response.sendRedirect("viewTasks.jsp");
        } else {
            response.getWriter().println("Failed to delete task!");
        }
    }
}
