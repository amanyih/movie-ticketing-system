package com.movietickets.Filters;

import javax.servlet.Filter;
import javax.servlet.annotation.*;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

@WebFilter("/lgoin")
public class BookingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Check if the required parameters (email and password) are present
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            return;
        }

        System.out.println("Login request received at: " + System.currentTimeMillis());
        System.out.println("Email: " + email);

        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}