package com.movietickets.repositories;

import com.movietickets.model.Showtime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteRepository {

    Connection connection;
    BookingRepository bookingRepository;
    ShowTimeRepository showtimeRepository;
    TheaterRepository theaterRepository;
    MovieRepository movieRepository;
    UserRepository userRepository;

    public DeleteRepository(Connection connection) {
        this.connection = connection;
        bookingRepository = new BookingRepository(connection);
        showtimeRepository = new ShowTimeRepository(connection);
        theaterRepository = new TheaterRepository(connection);
        movieRepository = new MovieRepository(connection);
        userRepository = new UserRepository(connection, movieRepository);
    }

    public int deleteBooking(int bookingId) throws SQLException {
        String sql = "DELETE FROM booking WHERE bookingId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, bookingId);
        return ps.executeUpdate();
    }

    public int deleteShowtime(int showtimeId) throws SQLException {
        String sql1 = "DELETE FROM booking WHERE showtimeId = ?";
        PreparedStatement ps1 = connection.prepareStatement(sql1);
        ps1.setInt(1, showtimeId);
        ps1.executeUpdate();
        String sql = "DELETE FROM showtime WHERE showtimeId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, showtimeId);
        return ps.executeUpdate();
    }

    public int deleteTheater(int theaterId) throws SQLException {
        String sql1 = "SELECT * FROM showtime WHERE theaterId = ?";
        PreparedStatement ps1 = connection.prepareStatement(sql1);
        ps1.setInt(1, theaterId);
        ResultSet rs = ps1.executeQuery();
        while(rs.next()){
            int showtimeId = rs.getInt("showtimeId");
            deleteShowtime(showtimeId);
        }
        String sql = "DELETE FROM theater WHERE theaterId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, theaterId);
        return ps.executeUpdate();
    }

    public int deleteMovie(int movieId) throws SQLException {
        String sql1 = "SELECT * FROM showtime WHERE movieId = ?";
        PreparedStatement ps1 = connection.prepareStatement(sql1);
        ps1.setInt(1, movieId);
        ResultSet rs = ps1.executeQuery();
        while(rs.next()){
            int showtimeId = rs.getInt("showtimeId");
            deleteShowtime(showtimeId);
        }
        String sql = "DELETE FROM movie WHERE movieId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, movieId);
        return ps.executeUpdate();
    }

    public int deleteUser(int userId) throws SQLException {
        String sql1 = "SELECT * FROM booking WHERE userId = ?";
        PreparedStatement ps1 = connection.prepareStatement(sql1);
        ps1.setInt(1, userId);
        ResultSet rs = ps1.executeQuery();
        while(rs.next()){
            int bookingId = rs.getInt("bookingId");
            deleteBooking(bookingId);
        }
        String sql = "DELETE FROM user WHERE userId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, userId);
        return ps.executeUpdate();
    }

}
