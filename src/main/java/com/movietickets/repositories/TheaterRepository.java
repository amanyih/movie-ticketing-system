package com.movietickets.repositories;




import com.movietickets.model.Showtime;
import com.movietickets.model.Theater;
import com.movietickets.util.DatabaseConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TheaterRepository {
    Connection connection;

    public TheaterRepository(Connection connection) {
        this.connection = connection;
    }

    public int addTheater(String name, String location, int capacity, String contactInfo, String image,String description) throws SQLException {
        String sql = "INSERT INTO theater (name, location, capacity, contactInfo,image,description) VALUES (?, ?, ?, ?,?,?)";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, location);
        ps.setInt(3, capacity);
        ps.setString(4, contactInfo);
        ps.setString(5, image);
        ps.setString(6, description);
        return ps.executeUpdate();
    }

    public ArrayList<Theater> getAllTheaters() throws SQLException {
        ArrayList<Theater> theaters = new ArrayList<>();
        String sql = "SELECT * FROM theater";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rows = ps.executeQuery();

        while (rows.next()) {
            int theaterId = rows.getInt("theaterId");
            String name = rows.getString("name");
            String location = rows.getString("location");
            int capacity = rows.getInt("capacity");
            String contactInfo = rows.getString("contactInfo");
            String image = rows.getString("image");
            String description = rows.getString("description");
            Showtime[] showtimes = new Showtime[0];
            Theater theater = new Theater(theaterId, name,description, location, capacity,image, contactInfo,null);
            theaters.add(theater);
        }
        return theaters;
    }
    public ArrayList<Theater> getFeaturedTheater() throws SQLException {
        ArrayList<Theater> theaters = new ArrayList<>();
        String sql = "SELECT * FROM theater WHERE theaterId <= 5";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rows = ps.executeQuery();

        while (rows.next()) {
            int theaterId = rows.getInt("theaterId");
            String name = rows.getString("name");
            String location = rows.getString("location");
            int capacity = rows.getInt("capacity");
            String contactInfo = rows.getString("contactInfo");
            String image = rows.getString("image");
            String description = rows.getString("description");
            Showtime[] showtimes = new Showtime[0];
            Theater theater = new Theater(theaterId, name,description, location, capacity,image, contactInfo,null);
            theaters.add(theater);
        }
        return theaters;
    }

    public Theater getTheaterById(int theaterId) throws SQLException {
        String sql = "SELECT * FROM theater WHERE theaterId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, theaterId);
        ResultSet rows = ps.executeQuery();
        if(rows.next()){
            String name = rows.getString("name");
            String location = rows.getString("location");
            int capacity = rows.getInt("capacity");
            String contactInfo = rows.getString("contactInfo");
            String image = rows.getString("image");
            String description = rows.getString("description");
            Showtime[] showtimes = new Showtime[0];
            return new Theater(theaterId, name,description, location, capacity,image, contactInfo,null);
        }
        return null;
    }

    public int updateTheater(int theaterId, String name, String location, int capacity, String contactInfo, String image,String description) throws SQLException {
        String sql = "UPDATE theater SET name = ?, location = ?, capacity = ?, contactInfo = ?, image = ?, description = ? WHERE theaterId = ?";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, location);
        ps.setInt(3, capacity);
        ps.setString(4, contactInfo);
        ps.setString(5, image);
        ps.setString(6, description);
        ps.setInt(7, theaterId);
        return ps.executeUpdate();
    }

    public int deleteTheater(int theaterId) throws SQLException {
        String sql = "DELETE FROM theater WHERE theaterId = ?";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, theaterId);
        return ps.executeUpdate();
    }

}
