package com.movietickets.repositories;

import com.movietickets.model.Genre;
import com.movietickets.model.Movie;

import java.sql.*;
import java.util.ArrayList;

public class MovieRepository {

    Connection connection;

    public MovieRepository(Connection connection) {
        this.connection = connection;
    }

    public int addMovie(Movie movie) throws SQLException {
        String sql = "INSERT INTO movie (title, description, genreId, releaseDate, duration, rating, posterImage, trailerLink) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, movie.getTitle());
        ps.setString(2, movie.getDescription());
        ps.setInt(3, movie.getGenre().getGenreId());
        ps.setString(4, movie.getReleaseDate());
        ps.setInt(5, movie.getDuration());
        ps.setString(6, movie.getRating());
        ps.setString(7, movie.getPosterImage());
        ps.setString(8, movie.getTrailerLink());
        return ps.executeUpdate();

    }

    public ArrayList<Movie> getMovies() throws SQLException {
        String sql = "SELECT * FROM movie";
        ArrayList<Movie> movies = new ArrayList<>();

        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            Movie movie = new Movie();
            Genre genre = new Genre();
            movie.setMovieId(rs.getInt("movieId"));
            movie.setTitle(rs.getString("title"));
            movie.setDescription(rs.getString("description"));
            movie.setGenre(genre);
            movie.setReleaseDate(rs.getString("releaseDate"));
            movie.setDuration(rs.getInt("duration"));
            movie.setRating(rs.getString("rating"));
            movie.setPosterImage(rs.getString("posterImage"));
            movie.setTrailerLink(rs.getString("trailerLink"));
            movies.add(movie);
        }


        return movies;
    }

    public ArrayList<Movie> getFeaturedMovies() throws SQLException {
        String sql = "SELECT * FROM movie WHERE movieId <= 5";
        ArrayList<Movie> movies = new ArrayList<>();


        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
            Movie movie = new Movie();
            Genre genre = new Genre();
            movie.setMovieId(rs.getInt("movieId"));
            movie.setTitle(rs.getString("title"));
            movie.setDescription(rs.getString("description"));
            movie.setGenre(genre);
            movie.setReleaseDate(rs.getString("releaseDate"));
            movie.setDuration(rs.getInt("duration"));
            movie.setRating(rs.getString("rating"));
            movie.setPosterImage(rs.getString("posterImage"));
            movie.setTrailerLink(rs.getString("trailerLink"));
            movies.add(movie);
        }


        return movies;
    }

    public Movie getMovieById(int id) throws SQLException {

        String sql = "SELECT * FROM movie WHERE movieId = ?";
        Movie movie = new Movie();

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Genre genre = new Genre();
            genre.setGenreName(rs.getString("genreId"));
            movie.setMovieId(rs.getInt("movieId"));
            movie.setTitle(rs.getString("title"));
            movie.setDescription(rs.getString("description"));
            movie.setGenre(genre);
            movie.setReleaseDate(rs.getString("releaseDate"));
            movie.setDuration(rs.getInt("duration"));
            movie.setRating(rs.getString("rating"));
            movie.setPosterImage(rs.getString("posterImage"));
            movie.setTrailerLink(rs.getString("trailerLink"));
        }


        return movie;

    }

    public ArrayList<Movie> searchMovies(String key) throws SQLException {
        String sql = "SELECT * FROM movie WHERE title LIKE ?";
        ArrayList<Movie> movies = new ArrayList<>();

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, "%" + key + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Movie movie = new Movie();
            Genre genre = new Genre();
            movie.setMovieId(rs.getInt("movieId"));
            movie.setTitle(rs.getString("title"));
            movie.setDescription(rs.getString("description"));
            movie.setGenre(genre);
            movie.setReleaseDate(rs.getString("releaseDate"));
            movie.setDuration(rs.getInt("duration"));
            movie.setRating(rs.getString("rating"));
            movie.setPosterImage(rs.getString("posterImage"));
            movie.setTrailerLink(rs.getString("trailerLink"));
            movies.add(movie);
        }
        return movies;

    }

    public int updateMovie(Movie movie) throws SQLException {
        String sql = "UPDATE movie SET title = ?, description = ?, genreId = ?, releaseDate = ?, duration = ?, rating = ?, posterImage = ?, trailerLink = ? WHERE movieId = ?";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, movie.getTitle());
        ps.setString(2, movie.getDescription());
        ps.setInt(3, movie.getGenre().getGenreId());
        ps.setString(4, movie.getReleaseDate());
        ps.setInt(5, movie.getDuration());
        ps.setString(6, movie.getRating());
        ps.setString(7, movie.getPosterImage());
        ps.setString(8, movie.getTrailerLink());
        ps.setInt(9, movie.getMovieId());
        return ps.executeUpdate();

    }

    public int deleteMovie(int movieId) throws SQLException {
        String sql = "DELETE FROM movie WHERE movieId = ?";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, movieId);
        return ps.executeUpdate();

    }
}
