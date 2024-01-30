package com.movietickets.servlets;

import com.movietickets.model.Booking;
import com.movietickets.model.User;
import com.movietickets.repositories.BookingRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tab = request.getParameter("tab");
        if (tab == null) {
            tab = "profile";
        }

        Connection connection = DatabaseConnectionPool.getConnection();
        BookingRepository bookingRepository = new BookingRepository(connection);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        user.setProfilePic("");
        session.setAttribute("user", user);

        try {
            ArrayList<Booking> bookings = bookingRepository.getBookingsByUserId(user);
            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("profile.jsp?tab=" + tab).forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}