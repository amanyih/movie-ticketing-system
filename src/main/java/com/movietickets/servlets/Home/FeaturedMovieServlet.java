package com.movietickets.servlets.Home;

import com.movietickets.model.Movie;
import com.movietickets.repositories.MovieRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

@WebServlet(name = "FeaturedMovieServlet", value = "/FeaturedMovieServlet")
public class FeaturedMovieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(con);

        try {
            ArrayList<Movie> movies = movieRepository.getFeaturedMovies();
            request.setAttribute("movies", movies);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}