package com.movietickets.servlets.User;

import com.movietickets.model.ErrorMessages;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ChangePasswordServlet", value = "/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if(oldPassword.isEmpty()
                || newPassword.isEmpty()
                || confirmPassword.isEmpty()) {
            request.setAttribute("error", ErrorMessages.ALL_FIELDS_REQUIRED);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        if(!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", ErrorMessages.PASSWORDS_DO_NOT_MATCH);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        Connection con = DatabaseConnectionPool.getConnection();
        String sql = "UPDATE users SET password = ? WHERE user_id = ?";

        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setInt(2, userId);
            int rows = stmt.executeUpdate();

            if(rows == 0){
                request.setAttribute("error", ErrorMessages.INVALID_PASSWORD);
                request.getRequestDispatcher("changePassword.jsp?message=success").forward(request, response);
            } else {
                request.setAttribute("success", "Password changed successfully");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}