package com.movietickets.util;

import java.sql.*;

public class DatabaseConnectionPool {

    private static Connection connection;

    private DatabaseConnectionPool() {
    }

    public static Connection getConnection() {

        if (connection == null ) {
            try {
                initConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return connection;
    }

    private static void initConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("JDBC driver not found.");
        }

        String url = "jdbc:mysql://localhost:3306/";
        String username = "root";
        String password = "sqlpass";
        String databaseName = "MovieTickets";

        createDatabaseIfNotExists("MovieTickets");
        connection = DriverManager.getConnection(url + databaseName, username, password);
        createTablesIfNotExists();

    }

    private static void createDatabaseIfNotExists(String databaseName) throws SQLException {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "sqlpass");
        Statement statement = connection.createStatement();
        statement.executeUpdate("CREATE DATABASE IF NOT EXISTS " + databaseName);
        statement.close();
        connection.close();
    }

    private static void createTablesIfNotExists() throws SQLException {
        Connection connection = getConnection();
        Statement statement = connection.createStatement();

        statement.executeUpdate("CREATE TABLE IF NOT EXISTS user ("
                + "userId INT NOT NULL AUTO_INCREMENT,"
                + "email VARCHAR(255) NOT NULL,"
                + "password VARCHAR(255) NOT NULL,"
                + "fullName VARCHAR(255) NOT NULL,"
                + "role VARCHAR(255) NOT NULL,"
                + "phone VARCHAR(255) NOT NULL,"
                + "profilePic VARCHAR(10000) NOT NULL,"
                + "address VARCHAR(255) NOT NULL,"
                + "PRIMARY KEY (userId))");

        statement.executeUpdate("CREATE TABLE IF NOT EXISTS genre ("
                + "genreId INT NOT NULL AUTO_INCREMENT,"
                + "genreName VARCHAR(255) NOT NULL,"
                + "PRIMARY KEY (genreId))");
        statement.executeUpdate("CREATE TABLE IF NOT EXISTS theater ("
                + "theaterId INT NOT NULL AUTO_INCREMENT,"
                + "name VARCHAR(255) NOT NULL,"
                + "description VARCHAR(255) NOT NULL,"
                + "location VARCHAR(255) NOT NULL,"
                + "capacity INT NOT NULL,"
                + "contactInfo VARCHAR(255) NOT NULL,"
                + "image VARCHAR(10000) NOT NULL,"  // Added image column
                + "PRIMARY KEY (theaterId))");


        statement.executeUpdate("CREATE TABLE IF NOT EXISTS movie ("
                + "movieId INT NOT NULL AUTO_INCREMENT,"
                + "title VARCHAR(255) NOT NULL,"
                + "description VARCHAR(255) NOT NULL,"
                + "genreId INT NOT NULL,"
                + "releaseDate VARCHAR(255) NOT NULL,"
                + "duration INT NOT NULL,"
                + "rating VARCHAR(255) NOT NULL,"
                + "posterImage VARCHAR(10000) NOT NULL,"
                + "trailerLink VARCHAR(1000) NOT NULL,"
                + "PRIMARY KEY (movieId),"
                + "FOREIGN KEY (genreId) REFERENCES genre(genreId))");

        statement.executeUpdate("CREATE TABLE IF NOT EXISTS showtime ("
                + "showtimeId INT NOT NULL AUTO_INCREMENT,"
                + "movieId INT NOT NULL,"
                + "theaterId INT NOT NULL,"
                + "showDate DATE NOT NULL,"
                + "startTime VARCHAR(255) NOT NULL,"
                + "endTime VARCHAR(255) NOT NULL,"
                + "availableSeats INT NOT NULL,"
                + "price DOUBLE NOT NULL,"
                + "PRIMARY KEY (showtimeId),"
                + "FOREIGN KEY (movieId) REFERENCES movie(movieId),"
                + "FOREIGN KEY (theaterId) REFERENCES theater(theaterId))");


        statement.executeUpdate("CREATE TABLE IF NOT EXISTS booking ("
                + "bookingId INT NOT NULL AUTO_INCREMENT,"
                + "userId INT NOT NULL,"
                + "showtimeId INT NOT NULL,"
                + "seats VARCHAR(255) NOT NULL,"
                + "totalCost DOUBLE NOT NULL,"
                + "status VARCHAR(255) NOT NULL,"
                + "PRIMARY KEY (bookingId),"
                + "FOREIGN KEY (userId) REFERENCES user(userId),"
                + "FOREIGN KEY (showtimeId) REFERENCES showtime(showtimeId))");

        statement.executeUpdate("CREATE TABLE IF NOT EXISTS FavoriteMovies ("
                + "userId INT NOT NULL,"
                + "movieId INT NOT NULL,"
                + "PRIMARY KEY (userId, movieId),"
                + "FOREIGN KEY (userId) REFERENCES user(userId),"
                + "FOREIGN KEY (movieId) REFERENCES movie(movieId))");

    }

}