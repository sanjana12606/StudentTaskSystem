package com.studenttask.controller;

import com.studenttask.dao.UserDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("admin_login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();
        boolean deleted = dao.deleteUser(id);

        if (deleted) {
            response.sendRedirect("admin_users.jsp");
        } else {
            response.getWriter().println("<h3 style='color:red;'>Failed to delete user.</h3>");
        }
    }
}
