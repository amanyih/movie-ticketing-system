package com.movietickets.model;

import java.util.List;

public class Theater {

    // Attributes
    private int theaterId;
    private String name;
    private String description;
    private String location;
    private int capacity;
    private String contactInfo;
    private String image;
    private Showtime[] showtimes;

    // Constructor
    public Theater(int theaterId, String name,String description, String location, int capacity,String image, String contactInfo, Showtime[] showtimes) {
        this.theaterId = theaterId;
        this.name = name;
        this.location = location;
        this.description = description;
        this.capacity = capacity;
        this.contactInfo = contactInfo;
        this.showtimes = showtimes;
        this.image = image;
    }

    // Getters and Setters
    public int getTheaterId() {
        return theaterId;
    }

    public void setTheaterId(int theaterId) {
        this.theaterId = theaterId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name != null) {
            this.name = name;
        }
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        if (description != null) {
            this.description = description;
        }
    }

    public String getLocation() {
        return location;
    }

    public int getCapacity() {
        return capacity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        if (image != null) {
            this.image = image;
        }
    }

    public void setCapacity(int capacity) {
        if (capacity > 0) {
            this.capacity = capacity;
        }
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        if (contactInfo != null) {
            this.contactInfo = contactInfo;
        }
    }

    public Showtime[] getShowtime() {
        return showtimes;
    }

    public void setShowtime(Showtime[] showtimes) {
        this.showtimes = showtimes;
    }

    public Showtime addShowtime(Showtime showtime) {
        Showtime[] newShowtimes = new Showtime[this.showtimes.length + 1];
        for (int i = 0; i < this.showtimes.length; i++) {
            newShowtimes[i] = this.showtimes[i];
        }
        newShowtimes[this.showtimes.length] = showtime;
        this.showtimes = newShowtimes;
        return showtime;
    }

}
