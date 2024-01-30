package com.movietickets.servlets.Home;

import com.movietickets.model.Theater;
import com.movietickets.repositories.TheaterRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "FeaturedCinemaServlet", value = "/FeaturedCinemaServlet")
public class FeaturedCinemaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DatabaseConnectionPool.getConnection();
        TheaterRepository theaterRepository = new TheaterRepository(con);



        try {

                ArrayList<Theater> theaters = theaterRepository.getFeaturedTheater();

                request.setAttribute("cinemas", theaters);
                request.getRequestDispatcher("index.jsp").forward(request, response);



        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}