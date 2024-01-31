package com.movietickets.servlets.User;

import com.movietickets.model.User;
import com.movietickets.repositories.MovieRepository;
import com.movietickets.repositories.UserRepository;
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

        User user = (User) request.getSession().getAttribute("user");
        Connection connection = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(connection);

        UserRepository userRepository = new UserRepository(connection, movieRepository);

        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            int rows = userRepository.updateUser(user.getUserId(),email, fullname, phone, address );
            if (rows > 0) {
                User user1 = userRepository.getUser(user.getUserId());
                request.getSession().setAttribute("user", user1);
                response.sendRedirect("profile?tab=My%20Account");
            } else {

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}