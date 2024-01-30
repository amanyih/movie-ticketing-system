package com.movietickets.servlets.Cinema;

import com.movietickets.model.Showtime;
import com.movietickets.model.Theater;
import com.movietickets.repositories.TheaterRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(name = "GetCinemasServlet", value = "/GetCinemasServlet")
public class GetCinemasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = DatabaseConnectionPool.getConnection();
        TheaterRepository theaterRepository = new TheaterRepository(connection);



        try {

            ArrayList<Theater> theaters = theaterRepository.getAllTheaters();

            request.setAttribute("cinemas", theaters);
            request.getRequestDispatcher("cinema.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}