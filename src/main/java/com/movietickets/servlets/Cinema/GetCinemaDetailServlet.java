package com.movietickets.servlets.Cinema;

import com.movietickets.model.Theater;
import com.movietickets.repositories.TheaterRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "GetCinemaDetailServlet", value = "/GetCinemaDetailServlet")
public class GetCinemaDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = DatabaseConnectionPool.getConnection();
        TheaterRepository theaterRepository = new TheaterRepository(connection);

        int theaterId = Integer.parseInt(request.getParameter("theaterId"));

        try {
            Theater theater = theaterRepository.getTheaterById(theaterId);
            request.setAttribute("theater", theater); //TODO: change to admin page
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}