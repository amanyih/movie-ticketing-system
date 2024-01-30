package com.movietickets.repositories;

import com.movietickets.model.*;
import com.movietickets.util.DatabaseConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class BookingRepository {

    private Connection connection;

    public BookingRepository(Connection connection) {
        this.connection = connection;
    }

    public int createBooking(int userId, int showtimeId, String seats, double totalCost, String status) throws SQLException {
        String sql = "INSERT INTO booking (userId, showtimeId, seats, totalCost, status) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, showtimeId);
            ps.setString(3, seats);
            ps.setDouble(4, totalCost);
            ps.setString(5, status);
            return ps.executeUpdate();

    }

    public ArrayList<Booking> getBookingsByUserId(User user) throws SQLException {

        String sql = "SELECT * FROM booking WHERE userId = ?";
        ArrayList<Booking> bookings = new ArrayList<>();

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user.getUserId());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int bookingId = rs.getInt("bookingId");
                int userId1 = rs.getInt("userId");
                int showtimeId = rs.getInt("showtimeId");
                String seats = rs.getString("seats");
                double totalCost = rs.getDouble("totalCost");
                String status = rs.getString("status");


                String sql2 = "SELECT * FROM showtime WHERE showtimeId = ?";
                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.setInt(1, showtimeId);
                ResultSet rs2 = ps2.executeQuery();
                rs2.next();
                int showtimeId1 = rs2.getInt("showtimeId");
                int movieId = rs2.getInt("movieId");
                int theaterId = rs2.getInt("theaterId");
                String startTime = rs2.getString("startTime");
                String endTime = rs2.getString("endTime");
                int availableSeats = rs2.getInt("availableSeats");
                double price = rs2.getDouble("price");
                Date showDate = rs2.getDate("showDate");

                String sql3 = "SELECT * FROM movie WHERE movieId = ?";
                PreparedStatement ps3 = connection.prepareStatement(sql3);
                ps3.setInt(1, movieId);
                ResultSet rs3 = ps3.executeQuery();
                rs3.next();
                int movieId1 = rs3.getInt("movieId");
                String title = rs3.getString("title");
                String description = rs3.getString("description");
                int genreId = rs3.getInt("genreId");
                String releaseDate = rs3.getString("releaseDate");
                int duration = rs3.getInt("duration");
                String rating = rs3.getString("rating");
                String posterImage = rs3.getString("posterImage");
                String trailerLink = rs3.getString("trailerLink");

                String sql4 = "SELECT * FROM theater WHERE theaterId = ?";
                PreparedStatement ps4 = connection.prepareStatement(sql4);
                ps4.setInt(1, theaterId);
                ResultSet rs4 = ps4.executeQuery();
                rs4.next();
                int theaterId1 = rs4.getInt("theaterId");
                String theaterName = rs4.getString("name");
                String location = rs4.getString("location");
                int capacity = rs4.getInt("capacity");
                String contactInfo = rs4.getString("contactInfo");
                String image = rs4.getString("image");
                String description2 = rs4.getString("description");


                Theater theater = new Theater(theaterId1, theaterName,description2, location, capacity, image, contactInfo,null);
                Movie movie = new Movie(movieId1, title, description, new Genre(1,"Comedy"), releaseDate, duration, rating, posterImage, trailerLink,null);
                Showtime showtime = new Showtime(showtimeId1, movie, theater, startTime, endTime, availableSeats, price, showDate, null);
                Booking booking = new Booking(bookingId, user, showtime,seats, totalCost, status);

                bookings.add(booking);
            }
            return bookings;


    }

    public boolean bookingExists(int id) throws SQLException {
        String sql = "SELECT * FROM booking WHERE bookingId = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();

    }



}
