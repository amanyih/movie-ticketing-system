package com.movietickets.servlets;

import com.movietickets.model.ErrorMessages;
import com.movietickets.model.User;
import com.movietickets.util.DatabaseConnectionPool;

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

        String query = "SELECT * FROM user WHERE email = ? AND password = ?";
        Connection con = DatabaseConnectionPool.getConnection();

        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                String fullName = rs.getString("fullName");
                String phone = rs.getString("phone");
                String role = rs.getString("role");
                int userId = (int) rs.getInt("userId");
                String user_email = rs.getString("email");
                String user_password = rs.getString("password");

                User user = new User(userId, user_email, user_password, fullName, role, phone, null, null, null);
                session.setAttribute("user", user);
                response.sendRedirect("home.jsp");

            } else {
                request.setAttribute("message", ErrorMessages.INVALID_EMAIL_OR_PASSWORD);
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", ErrorMessages.SOMETHING_WENT_WRONG);
            response.sendRedirect("login.jsp");
        }


    }
}