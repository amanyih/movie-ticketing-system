package com.movietickets.servlets;

import com.movietickets.model.*;
import com.movietickets.repositories.*;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !user.getRole().equals("admin")) {
            response.sendRedirect("/login.jsp");
            return;
        }
        String tab = request.getParameter("tab");
        String mode = request.getParameter("mode");
        String id = "";
        String resource = "";
        if (tab == null) {
            tab = "users";
        }
        if (mode == null) {
            mode = "list";
        }

        Connection connection = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(connection);
        UserRepository userRepository = new UserRepository(connection, movieRepository);
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(connection);
        TheaterRepository theaterRepository = new TheaterRepository(connection);
        GenreRepository genreRepository = new GenreRepository(connection);
        DeleteRepository deleteRepository = new DeleteRepository(connection);

        if (mode.equals("edit")) {
            try {
                switch (tab) {
                    case "movies":
                        int movie = Integer.parseInt(request.getParameter("movie"));
                        request.setAttribute("movie", movieRepository.getMovieById(movie));
                        resource = "movie";
                        id = String.valueOf(movie);
                        break;
                    case "cinema":
                        int cinema = Integer.parseInt(request.getParameter("cinema"));
                        request.setAttribute("cinema", theaterRepository.getTheaterById(cinema));
                        resource = "cinema";
                        id = String.valueOf(cinema);
                        break;
                    case "showtime":
                        int showtime = Integer.parseInt(request.getParameter("showtime"));
                        request.setAttribute("showtime", showTimeRepository.getShowTime(showtime));
                        resource = "showtime";
                        id = String.valueOf(showtime);
                        System.out.println("inside dashboard servlet - "+showTimeRepository.getShowTime(showtime));
                        break;
                }

            } catch (SQLException e) {

            }
        } else if (mode.equals("delete")) {
            try {
                switch (tab) {
                    case "users":
                        int user2 = Integer.parseInt(request.getParameter("user"));
                        int rows = deleteRepository.deleteUser(user2);
                        if (rows > 0) {
                            session.setAttribute("success", "User deleted successfully");
                        } else {
                            session.setAttribute("error", "Failed to delete user");
                        }
                        break;
                    case "movies":
                        int movieToDelete = Integer.parseInt(request.getParameter("movie"));
                        int deleteMovieRows = deleteRepository.deleteMovie(movieToDelete);
                        if (deleteMovieRows > 0) {
                            session.setAttribute("success", "Movie deleted successfully");
                        } else {
                            session.setAttribute("error", "Failed to delete movie");
                        }
                        break;
                    case "cinema":
                        int cinemaToDelete = Integer.parseInt(request.getParameter("cinema"));
                        int deleteCinemaRows = deleteRepository.deleteTheater(cinemaToDelete);
                        if (deleteCinemaRows > 0) {
                            session.setAttribute("success", "Cinema deleted successfully");
                        } else {
                            session.setAttribute("error", "Failed to delete cinema");
                        }
                        break;
                    case "showtime":
                        int showtimeToDelete = Integer.parseInt(request.getParameter("showtime"));
                        int deleteShowtimeRows = deleteRepository.deleteShowtime(showtimeToDelete);
                        if (deleteShowtimeRows > 0) {
                            request.setAttribute("success", "Showtime deleted successfully");
                        } else {
                            session.setAttribute("error", "Failed to delete showtime");
                        }
                        break;

                }
            } catch (SQLException e) {

            }
        }


        try {
            ArrayList<Movie> movies = movieRepository.getMovies();
            ArrayList<Theater> theaters = theaterRepository.getAllTheaters();
            switch (tab) {
                case "users":
                    request.setAttribute("users", userRepository.getAllUsers());
                    break;
                case "movies":
                    request.setAttribute("movies", movies);
                    request.setAttribute("genres", genreRepository.getGenres());
                    break;
                case "showtime":
                    request.setAttribute("showtimes", showTimeRepository.getShowTimes());
                    request.setAttribute("movies", movies);
                    request.setAttribute("theaters", theaters);
                    break;
                case "cinema":
                    request.setAttribute("cinemas", theaters);
                    break;
            }

        } catch (SQLException e) {
            session.setAttribute("error","Something Went Wrong");
        }
        request.getRequestDispatcher("/adminDashboard.jsp?tab=" + tab + (mode.equals("edit") ? "&mode=edit&" + resource + "=" + id : "")).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !user.getRole().equals("admin") ) {
            response.sendRedirect("/login.jsp");
            return;
        }
        System.out.println("doing post");
        String tab = request.getParameter("tab");
        String mode = request.getParameter("mode");
        if (tab == null) {
            tab = "users";
        }
        if (mode == null) {
            mode = "list";
        }
        System.out.println("mode in post" + mode);
        boolean isEdit = mode.equals("edit");

        Connection connection = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(connection);
        UserRepository userRepository = new UserRepository(connection, movieRepository);
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(connection);
        TheaterRepository theaterRepository = new TheaterRepository(connection);

        try {
            switch (tab) {
                case "cinema":
                    String cinemaName = request.getParameter("name");
                    String description = request.getParameter("description");
                    String location = request.getParameter("location");
                    int capacity = Integer.parseInt(request.getParameter("capacity"));
                    String image = request.getParameter("image");
                    String contatct = request.getParameter("contactInfo");
                    int theater = isEdit ? Integer.parseInt(request.getParameter("cinema")) : 0;

                    int rows = isEdit ? theaterRepository.updateTheater(theater, cinemaName, location, capacity, contatct, image, description) : theaterRepository.addTheater(cinemaName, location, capacity, contatct, image, description);
                    if (rows > 0) {
                        session.setAttribute("success", isEdit ? "Cinema Edited Successfully" : "Cinema added successfully");
                    } else {
                        session.setAttribute("error", isEdit ? "Failed to Edit cinema" : "Failed to add cinema");
                    }
                    break;
                case "movies":
                    String title = request.getParameter("title");
                    String movieDescription = request.getParameter("description");
                    int genreId = Integer.parseInt(request.getParameter("genre"));
                    String releaseDate = request.getParameter("releaseDate");
                    String movieImage = request.getParameter("posterImage");
                    String rating = request.getParameter("rating");
                    String trailerLink = request.getParameter("trailerLink");
                    int duration = Integer.parseInt(request.getParameter("duration"));

                    int editmovieId = isEdit ? Integer.parseInt(request.getParameter("movie")) : 0;


                    Movie movie = new Movie(isEdit ? editmovieId : 0, title, movieDescription, new Genre(genreId, ""), releaseDate, duration, rating, movieImage, trailerLink, null);
                    int movieRows = isEdit ? movieRepository.updateMovie(movie) : movieRepository.addMovie(movie);
                    if (movieRows > 0) {
                        session.setAttribute("success", isEdit ? "Movie Edited Successfully" : "Movie added successfully");
                    } else {
                        session.setAttribute("error", isEdit ? "Failed to Edit Movie" : "Failed to add movie");
                    }
                    break;
                case "showtime":
                    int movieId = Integer.parseInt(request.getParameter("movie"));
                    int theaterId = Integer.parseInt(request.getParameter("cinema"));
                    String showtime = request.getParameter("showDate");
                    String starttime = request.getParameter("starttime");
                    String endtime = request.getParameter("endtime");
                    int price = Integer.parseInt(request.getParameter("price"));
                    int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));
                    int editshowtimeId = isEdit ? Integer.parseInt(request.getParameter("showtime")) : 0;

                    int showtimeRows = isEdit ? showTimeRepository.updateShowTime(editshowtimeId, movieId, theaterId, starttime, endtime, availableSeats, price, showtime) : showTimeRepository.addShowTime(movieId, theaterId, starttime, endtime, availableSeats, price, showtime);


                    if (showtimeRows > 0) {
                        session.setAttribute("success", isEdit ? "Showtime updated successfully" : "Showtime added successfully");
                    } else {
                        session.setAttribute("error", isEdit ? "Failed to updated showtime" : "Failed to add showtime");
                    }
                    break;

            }
        } catch (SQLException e) {
            session.setAttribute("error","Something Went Wrong");
        }


        response.sendRedirect("/dashboard?tab=" + tab + "&success=" + request.getAttribute("success"));

    }
}