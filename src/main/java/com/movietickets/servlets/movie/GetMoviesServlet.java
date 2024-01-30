package com.movietickets.servlets.movie;

import com.movietickets.model.Genre;
import com.movietickets.model.Movie;
import com.movietickets.repositories.MovieRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/search")
public class GetMoviesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String key = request.getParameter("key");
        Connection connection = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(connection);
        try {
            ArrayList<Movie> movies;
            if (key == null) {
                movies = movieRepository.getMovies();
            } else {
                movies = movieRepository.searchMovies(key);
            }


            request.setAttribute("movies", movies);

            RequestDispatcher dispatcher = request.getRequestDispatcher( key == null?"search.jsp" : "search.jsp?key="+key );

            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}