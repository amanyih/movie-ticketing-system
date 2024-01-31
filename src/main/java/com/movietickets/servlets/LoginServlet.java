package com.movietickets.servlets;

import com.movietickets.model.ErrorMessages;
import com.movietickets.model.User;
import com.movietickets.util.DatabaseConnectionPool;
import com.movietickets.util.HashPassword;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");



        if (email.isEmpty() || password.isEmpty()) {
            request.setAttribute("message", ErrorMessages.INVALID_EMAIL_OR_PASSWORD);
            response.sendRedirect("login.jsp");
            return;
        }

        String query = "SELECT * FROM user WHERE email = ?";
        Connection con = DatabaseConnectionPool.getConnection();

        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                String fullName = rs.getString("fullName");
                String phone = rs.getString("phone");
                String role = rs.getString("role");
                int userId = (int) rs.getInt("userId");
                String user_email = rs.getString("email");
                String address = rs.getString("address");
                String profile_picture = rs.getString("profilePic");
                String hashedPassword = rs.getString("password");
               if (!HashPassword.verifyPassword(password, hashedPassword)) {
                   System.out.println("Password is incorrect");
                   System.out.println("Password: " + password);
                     System.out.println("Hashed Password: " + hashedPassword);
                   request.setAttribute("message", ErrorMessages.INVALID_EMAIL_OR_PASSWORD);
                   request.getRequestDispatcher("login.jsp").forward(request, response);
                   return;
                }

                User user = new User(userId, user_email, "", fullName, role, phone, profile_picture, address, null);
                session.setAttribute("user", user);
                session.setAttribute("success", "Logged in successfully");
                response.sendRedirect("home");

            } else {
                request.setAttribute("message", ErrorMessages.INVALID_EMAIL_OR_PASSWORD);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", ErrorMessages.SOMETHING_WENT_WRONG);
            response.sendRedirect("login.jsp");
        }

    }
}