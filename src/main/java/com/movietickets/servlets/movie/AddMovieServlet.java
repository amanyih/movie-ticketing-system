package com.movietickets.servlets.movie;

import com.movietickets.model.Genre;
import com.movietickets.model.Movie;
import com.movietickets.model.Showtime;
import com.movietickets.repositories.MovieRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "AddMovieServlet", value = "/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String genre = request.getParameter("genre");
        String releaseDate = request.getParameter("releaseDate");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String rating = request.getParameter("rating");
        String posterImage = request.getParameter("posterImage");
        String trailerLink = request.getParameter("trailerLink");

        Connection connection = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(connection);

        String sql = "INSERT INTO movie (title, description, genre, releaseDate, duration, rating, posterImage, trailerLink) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            Movie movie = new Movie(0,title, description, new Genre(0,genre), releaseDate, duration, rating, posterImage, trailerLink,null);

            int rows = movieRepository.addMovie(movie);
            if (rows > 0) {
                response.sendRedirect("admin.jsp"); //TODO: change to admin page
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}