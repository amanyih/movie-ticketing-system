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
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "GetUsersServlet", value = "/GetUsersServlet")
public class GetUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection connection = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(connection);
        UserRepository userRepository = new UserRepository(connection,movieRepository);

        try {
            ArrayList<User> users = userRepository.getAllUsers();
            request.setAttribute("users", users); //TODO: change to admin page
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}