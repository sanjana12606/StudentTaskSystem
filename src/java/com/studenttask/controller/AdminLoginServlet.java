package com.studenttask.controller;

import com.studenttask.dao.UserDAO;
import com.studenttask.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User admin = dao.loginUser(email, password);

        if (admin != null && "admin".equals(admin.getRole())) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);

            response.sendRedirect("admin_dashboard.jsp");

        } else {
            response.getWriter().println("<h3 style='color:red;'>Invalid Admin Credentials!</h3>");
        }
    }
}
