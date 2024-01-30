package com.movietickets.repositories;

import com.movietickets.model.Genre;
import com.movietickets.util.DatabaseConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GenreRepository {

    Connection connection;

    public GenreRepository(Connection connection) {
        this.connection = connection;
    }

    public int addGenre(String genreName){
        String sql = "INSERT INTO genre (genreName) VALUES (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, genreName);
            return ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Genre> getGenres(){
        String sql = "SELECT * FROM genre";
        ArrayList<Genre> genres = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int genreId = rs.getInt("genreId");
                String genreName = rs.getString("genreName");
                Genre genre = new Genre(genreId, genreName);
                genres.add(genre);
            }
            return genres;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
