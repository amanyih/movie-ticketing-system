package com.movietickets.model;

public class Booking {
    private int bookingId;
    private User user;
    private Showtime showtime;
    private String seats;
    private double totalCost;
    private String status;

    public Booking() {
    }

    public Booking(int bookingId, User user, Showtime showtime, String seats, double totalCost, String status) {
        this.bookingId = bookingId;
        this.user = user;
        this.showtime = showtime;
        this.seats = seats;
        this.totalCost = totalCost;
        this.status = status;
    }

    //Getters and Setters

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Showtime getShowtime() {
        return showtime;
    }

    public void setShowtime(Showtime showtime) {
        this.showtime = showtime;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        if (status != null) {
            this.status = status;
        }
    }

    @Override
    public String toString() {
        return "Booking{" +
                "bookingId=" + bookingId +
                ", userId=" + user.toString() +
                ", theaterId=" + showtime.getTheater().toString() +
                ", showtimeId=" + showtime.getShowtimeId() +
                ", seats=" + seats +
                ", totalCost=" + totalCost +
                ", status='" + status + '\'' +
                '}';
    }
}

