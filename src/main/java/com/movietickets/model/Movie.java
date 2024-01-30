package com.movietickets.model;

public class Movie {
    //attributes
    private int movieId;
    private String title;
    private String description;
    private Genre genre;
    private String releaseDate;
    private int duration;
    private String rating;
    private String posterImage;
    private String trailerLink;

    //constructors
    public Movie() {
    }

    public Movie(int movieId, String title, String description, Genre genre, String releaseDate, int duration, String rating, String posterImage, String trailerLink, Showtime[] showtimes) {
        this.movieId = movieId;
        this.title = title;
        this.description = description;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.duration = duration;
        this.rating = rating;
        this.posterImage = posterImage;
        this.trailerLink = trailerLink;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description= description;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate= releaseDate;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration= duration;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating= rating;
    }

    public String getPosterImage() {
        return posterImage;
    }

    public void setPosterImage(String posterImage) {
        this.posterImage= posterImage;
    }

    public String getTrailerLink() {
        return trailerLink;
    }

    public void setTrailerLink(String trailerLink) {
        this.trailerLink= trailerLink;
    }

    @Override
    public String toString() {
        return "Movie{" + "movieId=" + movieId + ", title=" + title + ", description=" + description + ", genre=" + genre + ", releaseDate=" + releaseDate + ", duration=" + duration + ", rating=" + rating + ", posterImage=" + posterImage + ", trailerLink=" + trailerLink  + '}';
    }

}
