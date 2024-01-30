package com.movietickets.model;

import java.util.ArrayList;

public class User {

    private int userId;
    private String email;
    private String password;
    private String fullName;
    private String role;
    private String phone;
    private String profilePic;
    private String address;
    private ArrayList<Movie> favoriteMovies;


    public User(int userId, String email, String password, String fullName, String role, String phone, String profilePic, String address, ArrayList<Movie>  favoriteMovies) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.role = role;
        this.phone = phone;
        this.profilePic = profilePic;
        this.address = address;
        this.favoriteMovies = favoriteMovies;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
    	this.email = email;
    }

    public String getFullName(){
        return fullName;
    }

    public void setFullName(String fullName){
        this.fullName = fullName;
    }

    public String getRole(){
        return role;
    }

    public void setRole(String role){
        this.role = role;
    }

    public String getPhone(){
        return phone;
    }

    public void setPhone(String phone){
        this.phone = phone;
    }

    public ArrayList<Movie>  getFavoriteMovies() {
        return favoriteMovies;
    }

    public void setFavoriteMovies(ArrayList<Movie>  favoriteMovies) {
        this.favoriteMovies = favoriteMovies;
    }


    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


}
