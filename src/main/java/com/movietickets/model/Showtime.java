package com.movietickets.model;

import java.util.Date;

public class Showtime {

    private int showtimeId;
    private Movie movie;
    private Theater theater;
    private String startTime;
    private String endTime;
    private int availableSeats;
    private double price;

    private Date showDate;


public Showtime() {
    }

    public Showtime(int showtimeId, Movie movie, Theater theater, String startTime, String endTime, int availableSeats, double price,Date showDate, Booking[] bookings) {
        this.showtimeId = showtimeId;
        this.movie = movie;
        this.theater = theater;
        this.startTime = startTime;
        this.endTime = endTime;
        this.availableSeats = availableSeats;
        this.price = price;
        this.showDate = showDate;
    }


    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public Theater getTheater() {
        return theater;
    }

    public void setTheater(Theater theater) {
        this.theater = theater;
        theater.addShowtime(this);
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    public double getPrice() {
        return price;
    }

    public Date getShowDate() {
        return showDate;
    }

    public void setShowDate(Date showDate) {
        this.showDate = showDate;
    }

    public void setPrice(double price) {
        if (price > 0) {
            this.price = price;
        }
    }



}
