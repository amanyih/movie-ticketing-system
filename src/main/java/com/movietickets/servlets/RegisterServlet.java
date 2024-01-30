package com.movietickets.servlets;

import com.movietickets.model.ErrorMessages;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        System.out.println("User: " + fullName + " " + email + " " + phone + " " + password + " " + confirmPassword);

        RequestDispatcher fail = request.getRequestDispatcher("register.jsp");
        RequestDispatcher success = request.getRequestDispatcher("login.jsp");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", ErrorMessages.PASSWORDS_DO_NOT_MATCH);
            response.sendRedirect("register.jsp");
            return;
        }
        Connection con = DatabaseConnectionPool.getConnection();

        System.out.println("Password confirmed");

        String query = "SELECT * FROM user WHERE email = ? OR phone = ?";
        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, phone);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                request.setAttribute("message", ErrorMessages.USER_ALREADY_EXISTS);
                response.sendRedirect("register.jsp");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", ErrorMessages.SOMETHING_WENT_WRONG);
            response.sendRedirect("register.jsp");
            return;
        }

        System.out.println("User does not exist");

        String EMAIL_REGEX = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern emailPattern = Pattern.compile(EMAIL_REGEX);
        Matcher emailMatcher = emailPattern.matcher(email);

        if (!emailMatcher.matches()) {
            request.setAttribute("message", ErrorMessages.INVALID_EMAIL);
            response.sendRedirect("register.jsp");
            return;
        }

        String PHONE_REGEX = "^[0-9]*$";
        Pattern phonePattern = Pattern.compile(PHONE_REGEX);
        Matcher phoneMatcher = phonePattern.matcher(phone);

        System.out.println("Email  valid");

        if (!phoneMatcher.matches()) {
            request.setAttribute("message", ErrorMessages.INVALID_PHONE);
            response.sendRedirect("register.jsp");
            return;
        }

        System.out.println("Phone valid");

        String insert_query= "INSERT INTO user (email, password, fullName, role, phone, profilePic, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = con.prepareStatement(insert_query);
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, fullName);
            statement.setString(4, "user");
            statement.setString(5, phone);
            statement.setString(6, "");
            statement.setString(7, "");
            statement.executeUpdate();
            response.sendRedirect("login.jsp");

            System.out.println("User registered but haven't redirected");


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("User not registered");
            request.setAttribute("message", ErrorMessages.SOMETHING_WENT_WRONG);
            response.sendRedirect("register.jsp");
        }


    }
}