package com.movietickets.servlets.User;

import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "UpdateUserServlet", value = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");

        String sql = "UPDATE user SET email = ?, fullname = ?, phone = ? WHERE userId = ?";
        Connection connection = DatabaseConnectionPool.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, fullname);
            ps.setString(3, phone);
            ps.setInt(4, userId);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("adminDashboard.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}