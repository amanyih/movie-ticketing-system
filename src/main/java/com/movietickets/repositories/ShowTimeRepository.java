package com.movietickets.repositories;

import com.movietickets.model.Genre;
import com.movietickets.model.Movie;
import com.movietickets.model.Showtime;
import com.movietickets.model.Theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class ShowTimeRepository {
    Connection connection;

    public ShowTimeRepository(Connection connection) {
        this.connection = connection;
    }

    public int addShowTime(int movieId, int theaterId, String startTime, String endTime, int availableSeats, double price,String showDate) throws SQLException {


        String sql3 = "Insert into showtime (movieId, theaterId, startTime, endTime, availableSeats, price,showDate) values (?, ?, ?, ?, ?, ?,?)";
        PreparedStatement ps3 = connection.prepareStatement(sql3);
        ps3.setInt(1, movieId);
        ps3.setInt(2, theaterId);
        ps3.setString(3, startTime);
        ps3.setString(4, endTime);
        ps3.setInt(5, availableSeats);
        ps3.setDouble(6, price);
        ps3.setString(7, showDate);

        return ps3.executeUpdate();
    }

    public ArrayList<Showtime> getShowTimeByMovieId(int movieId) throws SQLException {

        ArrayList<Showtime> showtimes = new ArrayList<>();
        String sql = "SELECT * FROM showtime WHERE movieId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, movieId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int showtimeId = rs.getInt("showtimeId");
            int movieId1 = rs.getInt("movieId");
            int theaterId2 = rs.getInt("theaterId");
            String startTime = rs.getString("startTime");
            String endTime = rs.getString("endTime");
            int availableSeats = rs.getInt("availableSeats");
            double price = rs.getDouble("price");
            Date showDate = rs.getDate("showDate");

            String sql2 = "SELECT * FROM movie WHERE movieId = ?";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, movieId);
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            String title = rs2.getString("title");
            String description = rs2.getString("description");
            int genreId = rs2.getInt("genreId");
            String releaseDate = rs2.getString("releaseDate");
            int duration = rs2.getInt("duration");
            String rating = rs2.getString("rating");
            String posterImage = rs2.getString("posterImage");
            String trailerLink = rs2.getString("trailerLink");

            String sql3 = "SELECT * FROM genre WHERE genreId = ?";
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            ps3.setInt(1, genreId);
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            String genreName = rs3.getString("genreName");
            Genre genre = new Genre(genreId, genreName);

            Movie movie = new Movie(movieId, title, description, genre, releaseDate, duration, rating, posterImage, trailerLink, null);

            String sql4 = "SELECT * FROM theater WHERE theaterId = ?";
            PreparedStatement ps4 = connection.prepareStatement(sql4);
            ps4.setInt(1, theaterId2);
            ResultSet rs4 = ps4.executeQuery();
            rs4.next();
            String name = rs4.getString("name");
            String location = rs4.getString("location");
            int capacity = rs4.getInt("capacity");
            String contactInfo = rs4.getString("contactInfo");
            String image = rs4.getString("image");
            String description2 = rs4.getString("description");
            Theater theater = new Theater(theaterId2, name, description2, location, capacity, image, contactInfo, null);

            Showtime showtime = new Showtime(showtimeId, movie, theater, startTime, endTime, availableSeats, price, showDate, null);

            showtimes.add(showtime);
        }

        return showtimes;

    }

    public ArrayList<Showtime> getShowTimeByTheaterId(int theaterId) throws SQLException {
        String sql = "SELECT * FROM showtime WHERE theaterId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, theaterId);
        ResultSet rs = ps.executeQuery();

        ArrayList<Showtime> showtimes = new ArrayList<>();

        while (rs.next()) {
            int showtimeId = rs.getInt("showtimeId");
            int movieId = rs.getInt("movieId");
            int theaterId2 = rs.getInt("theaterId");
            String startTime = rs.getString("startTime");
            String endTime = rs.getString("endTime");
            int availableSeats = rs.getInt("availableSeats");
            double price = rs.getDouble("price");
            Date showDate = rs.getDate("showDate");

            String sql2 = "SELECT * FROM movie WHERE movieId = ?";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, movieId);
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            String title = rs2.getString("title");
            String description = rs2.getString("description");
            int genreId = rs2.getInt("genreId");
            String releaseDate = rs2.getString("releaseDate");
            int duration = rs2.getInt("duration");
            String rating = rs2.getString("rating");
            String posterImage = rs2.getString("posterImage");
            String trailerLink = rs2.getString("trailerLink");

            String sql3 = "SELECT * FROM genre WHERE genreId = ?";
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            ps3.setInt(1, genreId);
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            String genreName = rs3.getString("genreName");
            Genre genre = new Genre(genreId, genreName);

            Movie movie = new Movie(movieId, title, description, genre, releaseDate, duration, rating, posterImage, trailerLink, null);

            String sql4 = "SELECT * FROM theater WHERE theaterId = ?";
            PreparedStatement ps4 = connection.prepareStatement(sql4);
            ps4.setInt(1, theaterId2);
            ResultSet rs4 = ps4.executeQuery();
            rs4.next();
            String name = rs4.getString("name");
            String location = rs4.getString("location");
            int capacity = rs4.getInt("capacity");
            String contactInfo = rs4.getString("contactInfo");
            String image = rs4.getString("image");
            String description2 = rs4.getString("description");
            Theater theater = new Theater(theaterId2, name, description2, location, capacity, image, contactInfo, null);

            Showtime showtime = new Showtime(showtimeId, movie, theater, startTime, endTime, availableSeats, price, showDate, null);

            showtimes.add(showtime);
        }
        return showtimes;
    }

    public Showtime getShowTime(int showTimeId) throws SQLException {

        String sql = "SELECT * FROM showtime WHERE showtimeId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, 1);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {


            int showtimeId = rs.getInt("showtimeId");
            int movieId = rs.getInt("movieId");
            int theaterId = rs.getInt("theaterId");
            String startTime = rs.getString("startTime");
            String endTime = rs.getString("endTime");
            int availableSeats = rs.getInt("availableSeats");
            double price = rs.getDouble("price");
            Date showDate = rs.getDate("showDate");

            MovieRepository movieRepository = new MovieRepository(connection);
            Movie movie = movieRepository.getMovieById(movieId);

            TheaterRepository theaterRepository = new TheaterRepository(connection);
            Theater theater = theaterRepository.getTheaterById(theaterId);

            Showtime showtime = new Showtime(showtimeId, movie, theater, startTime, endTime, availableSeats, price, showDate, null);
            return showtime;
        }


        return null;
    }

    public int subtractAvailableSeats(int showtimeId) throws SQLException {
        String sql = "UPDATE showtime SET availableSeats = availableSeats - ? WHERE showtimeId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, 1);
        ps.setInt(2, showtimeId);
        return ps.executeUpdate();
    }

    public ArrayList<Showtime> getShowTimes() throws SQLException{

        String sql = "SELECT * FROM showtime";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        ArrayList<Showtime> showtimes = new ArrayList<>();

        while (rs.next()) {
            int showtimeId = rs.getInt("showtimeId");
            int movieId = rs.getInt("movieId");
            int theaterId2 = rs.getInt("theaterId");
            String startTime = rs.getString("startTime");
            String endTime = rs.getString("endTime");
            int availableSeats = rs.getInt("availableSeats");
            double price = rs.getDouble("price");
            Date showDate = rs.getDate("showDate");

            String sql2 = "SELECT * FROM movie WHERE movieId = ?";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, movieId);
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            String title = rs2.getString("title");
            String description = rs2.getString("description");
            int genreId = rs2.getInt("genreId");
            String releaseDate = rs2.getString("releaseDate");
            int duration = rs2.getInt("duration");
            String rating = rs2.getString("rating");
            String posterImage = rs2.getString("posterImage");
            String trailerLink = rs2.getString("trailerLink");

            String sql3 = "SELECT * FROM genre WHERE genreId = ?";
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            ps3.setInt(1, genreId);
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            String genreName = rs3.getString("genreName");
            Genre genre = new Genre(genreId, genreName);

            Movie movie = new Movie(movieId, title, description, genre, releaseDate, duration, rating, posterImage, trailerLink, null);

            String sql4 = "SELECT * FROM theater WHERE theaterId = ?";
            PreparedStatement ps4 = connection.prepareStatement(sql4);
            ps4.setInt(1, theaterId2);
            ResultSet rs4 = ps4.executeQuery();
            rs4.next();
            String name = rs4.getString("name");
            String location = rs4.getString("location");
            int capacity = rs4.getInt("capacity");
            String contactInfo = rs4.getString("contactInfo");
            String image = rs4.getString("image");
            String description2 = rs4.getString("description");
            Theater theater = new Theater(theaterId2, name, description2, location, capacity, image, contactInfo, null);

            Showtime showtime = new Showtime(showtimeId, movie, theater, startTime, endTime, availableSeats, price, showDate, null);

            showtimes.add(showtime);
        }
        return showtimes;


    }

    public int updateShowTime(int showtimeId, int movieId, int theaterId, String startTime, String endTime, int availableSeats, double price,String showDate) throws SQLException {
        String sql = "UPDATE showtime SET movieId = ?, theaterId = ?, startTime = ?, endTime = ?, availableSeats = ?, price = ?, showDate = ? WHERE showtimeId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, movieId);
        ps.setInt(2, theaterId);
        ps.setString(3, startTime);
        ps.setString(4, endTime);
        ps.setInt(5, availableSeats);
        ps.setDouble(6, price);
        ps.setString(7, showDate);
        ps.setInt(8, showtimeId);
        return ps.executeUpdate();
    }

    public int deleteShowTime(int showtimeId) throws SQLException {
        String sql = "DELETE FROM showtime WHERE showtimeId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, showtimeId);
        return ps.executeUpdate();
    }
}

