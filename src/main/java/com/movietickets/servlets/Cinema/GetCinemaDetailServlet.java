package com.movietickets.servlets.Cinema;

import com.movietickets.model.Showtime;
import com.movietickets.model.Theater;
import com.movietickets.repositories.ShowTimeRepository;
import com.movietickets.repositories.TheaterRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/cinemaDetail")
public class GetCinemaDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = DatabaseConnectionPool.getConnection();
        TheaterRepository theaterRepository = new TheaterRepository(connection);
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(connection);

        int theaterId = Integer.parseInt(request.getParameter("cinemaId"));

        try {
            Theater theater = theaterRepository.getTheaterById(theaterId);
            ArrayList<Showtime> showtimes = showTimeRepository.getShowTimeByTheaterId(theaterId);
            request.setAttribute("cinema", theater); //TODO: change to admin page
            request.setAttribute("showtimes", showtimes);
            request.getRequestDispatcher("cinemaDetail.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}