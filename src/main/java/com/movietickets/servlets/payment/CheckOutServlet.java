package com.movietickets.servlets.payment;

import com.movietickets.model.Genre;
import com.movietickets.model.Movie;
import com.movietickets.model.Showtime;
import com.movietickets.repositories.ShowTimeRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet( "/checkout")
public class CheckOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String showtimeId = request.getParameter("showtimeId");

        Connection con = DatabaseConnectionPool.getConnection();
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(con);

        try {
            Showtime showtime = showTimeRepository.getShowTime(Integer.parseInt(showtimeId));

            System.out.println(showtime);

            request.setAttribute("showtime", showtime);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}