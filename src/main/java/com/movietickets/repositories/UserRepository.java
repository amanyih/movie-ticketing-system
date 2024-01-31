package com.movietickets.repositories;

import com.movietickets.model.Movie;
import com.movietickets.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserRepository {

    Connection connection;

    public UserRepository(Connection connection, MovieRepository movieRepository) {
        this.connection = connection;
    }

    public int addUser(String email, String password, String fullName, String phone, String profilePic, String address) throws SQLException {
        String insert_query = "INSERT INTO user (email, password, fullName, role, phone, profilePic, address) VALUES (?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(insert_query);
        statement.setString(1, email);
        statement.setString(2, password);
        statement.setString(3, fullName);
        statement.setString(4, "user");
        statement.setString(5, phone);
        statement.setString(6, "");
        statement.setString(7, "");
        return statement.executeUpdate();

    }

    public boolean checkUserEmailExists(String email) throws SQLException {
        String sql = "SELECT * FROM user WHERE email = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, email);
        return ps.executeQuery().next();
    }

    public boolean checkUserPhoneExists(String phone) throws SQLException {
        String sql = "SELECT * FROM user WHERE phone = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, phone);
        return ps.executeQuery().next();
    }

    public ArrayList<User> getAllUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rows = ps.executeQuery();

        while (rows.next()) {
            int userId = rows.getInt("userId");
            String email = rows.getString("email");
            String password = rows.getString("password");
            String fullName = rows.getString("fullName");
            String role = rows.getString("role");
            String phone = rows.getString("phone");
            String profilePic = rows.getString("profilePic");
            String address = rows.getString("address");

            String sql2 = "SELECT * FROM FavoriteMovies WHERE userId = ?";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, userId);
            ResultSet rs2 = ps2.executeQuery();
            ArrayList<Movie> favoriteMovies = new ArrayList<>();
            while(rs2.next()){
                int movieId = rs2.getInt("movieId");
                Movie movie = new MovieRepository(connection).getMovieById(movieId);
                favoriteMovies.add(movie);
            }

            User user = new User(userId, email, password, fullName, role, phone, profilePic, address,favoriteMovies);
            users.add(user);
        }
        return users;
    }

    public boolean checkUserValid(String email, String password) throws SQLException {
        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        return ps.executeQuery().next();
    }

    public int deleteUser(int userId) throws SQLException {
        String sql = "DELETE FROM user WHERE userId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, userId);
        return ps.executeUpdate();
    }

    public int updateUser(int userId, String email, String fullName, String phone, String address) throws SQLException {
        String sql = "UPDATE user SET email = ?, fullName = ?, phone = ?, address = ? WHERE userId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, fullName);
        ps.setString(3, phone);
        ps.setString(4, address);
        ps.setInt(5, userId);
        return ps.executeUpdate();
    }

    public User getUser(int id) throws SQLException {
        String sql = "SELECT * FROM user WHERE userId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int userId = rs.getInt("userId");
        String email = rs.getString("email");
        String password = rs.getString("password");
        String fullName = rs.getString("fullName");
        String role = rs.getString("role");
        String phone = rs.getString("phone");
        String profilePic = rs.getString("profilePic");
        String address = rs.getString("address");

        String sql2 = "SELECT * FROM FavoriteMovies WHERE userId = ?";
        PreparedStatement ps2 = connection.prepareStatement(sql2);
        ps2.setInt(1, userId);
        ResultSet rs2 = ps2.executeQuery();
        ArrayList<Movie> favoriteMovies = new ArrayList<>();

        User user = new User(userId, email, password, fullName, role, phone, profilePic, address,favoriteMovies);
        return user;
    }


}
