package com.movietickets.Filters;
import javax.servlet.annotation.WebFilter;


@WebFilter("/sginup")
public class SignUpFilter {

    public static boolean isValidUsername(String username) {
        
        return username.length() >= 5;
    }

    public static boolean isValidPassword(String password) {
        
        return password.length() >= 8 && password.matches(".*\\d.*");
    }

    public static boolean isUsernameAvailable(String username) {
        
        
        return true;
    }

    public static void main(String[] args, String username, String password) {
        
        if (isValidUsername(username) && isValidPassword(password) && isUsernameAvailable(username)) {
            
            System.out.println("Signup successful!");
        } else {
            
            System.out.println("Invalid username or password. Please try again.");
        }
    }
}
