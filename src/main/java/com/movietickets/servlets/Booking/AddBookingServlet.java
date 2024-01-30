package com.movietickets.servlets.Booking;

import com.movietickets.repositories.BookingRepository;
import com.movietickets.repositories.ShowTimeRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/book")
public class AddBookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));
        String seats = request.getParameter("seats");
        double totalCost = Double.parseDouble(request.getParameter("totalCost"));
        String status = request.getParameter("status");

        Connection connection = DatabaseConnectionPool.getConnection();
        BookingRepository bookingRepository = new BookingRepository(connection);
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(connection);

        try {
            int rows = bookingRepository.createBooking(userId, showtimeId, seats, totalCost, status);
            if (rows > 0) {
               int res = showTimeRepository.subtractAvailableSeats(showtimeId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}