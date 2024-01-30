package com.movietickets.servlets.ShowTime;

import com.movietickets.model.Genre;
import com.movietickets.model.Movie;
import com.movietickets.model.Showtime;
import com.movietickets.model.Theater;
import com.movietickets.repositories.ShowTimeRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "GetTheaterShowtimeServlet", value = "/GetTheaterShowtimeServlet")
public class GetTheaterShowtimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int theaterId = Integer.parseInt(request.getParameter("theaterId"));

        Connection con = DatabaseConnectionPool.getConnection();
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(con);

        String sql = "SELECT * FROM showtime WHERE theaterId = ?";
        try {
            ArrayList<Showtime> showtimes = showTimeRepository.getShowTimeByTheaterId(theaterId);

            request.setAttribute("showtimes", showtimes);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}