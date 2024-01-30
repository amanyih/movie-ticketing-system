package com.movietickets.servlets.movie;

import com.movietickets.model.Genre;
import com.movietickets.model.Movie;
import com.movietickets.model.Showtime;
import com.movietickets.repositories.MovieRepository;
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

@WebServlet("/GetMovieDetailServlet")
public class GetMovieDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("movieId"));

        Connection connection = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(connection);
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(connection);

        try {

            Movie movie = movieRepository.getMovieById(movieId);
            ArrayList<Showtime> showtimes = showTimeRepository.getShowTimeByMovieId(movieId);


            request.setAttribute("movie", movie);
            request.setAttribute("showtimes", showtimes);
            request.getRequestDispatcher("movieDetail.jsp").forward(request, response);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}