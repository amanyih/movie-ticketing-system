package com.movietickets.servlets.payment;

import com.movietickets.model.ErrorMessages;
import com.movietickets.model.Showtime;
import com.movietickets.model.User;
import com.movietickets.repositories.BookingRepository;
import com.movietickets.repositories.ShowTimeRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/gateway")
public class GateWayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String showtimeId = request.getParameter("showtimeId");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String cardNumber = request.getParameter("cardnumber");
        String cardName = request.getParameter("nameoncard");
        String expDate = request.getParameter("expirationdate");
        String cvv = request.getParameter("cvc");

        if (email.isEmpty()
                || fullname.isEmpty()
                || city.isEmpty()
                || phone.isEmpty()
                || cardNumber.isEmpty()
                || cardName.isEmpty()
                || expDate.isEmpty()
                || cvv.isEmpty()) {
            request.setAttribute("error", ErrorMessages.ALL_FIELDS_REQUIRED);
            request.getRequestDispatcher("paymentFailed.jsp").forward(request, response);
            return;
        }

        Connection connection = DatabaseConnectionPool.getConnection();
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(connection);
        BookingRepository bookingRepository = new BookingRepository(connection);
        User user = (User) request.getSession().getAttribute("user");


        try {
            Showtime showtime = showTimeRepository.getShowTime(Integer.parseInt(showtimeId));
            int rows = bookingRepository.createBooking(user.getUserId(), Integer.parseInt(showtimeId), ""+showtime.getAvailableSeats() , showtime.getPrice(), "success");
            if (rows > 0) {
                int res = showTimeRepository.subtractAvailableSeats(Integer.parseInt(showtimeId));
                if (res > 0) {
                    request.setAttribute("showtime", showtime);
                    request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
                    return;
                }
            }


        } catch (Exception e) {
            request.getRequestDispatcher("paymentFailed.jsp").forward(request, response);
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("paymentFailed.jsp").forward(request, response);

    }
}