package com.movietickets.servlets.Booking;

import com.movietickets.model.*;
import com.movietickets.repositories.BookingRepository;
import com.movietickets.repositories.MovieRepository;
import com.movietickets.repositories.ShowTimeRepository;
import com.movietickets.repositories.TheaterRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "GetBookingsServlet", value = "/GetBookingsServlet")
public class GetBookingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String sql = "SELECT * FROM booking WHERE userId = ?";
        Connection con = DatabaseConnectionPool.getConnection();
        BookingRepository bookingRepository = new BookingRepository(con);

        try {
            ArrayList<Booking> bookings = bookingRepository.getBookingsByUserId(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}