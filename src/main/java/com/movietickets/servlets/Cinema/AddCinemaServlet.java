package com.movietickets.servlets.Cinema;

import com.movietickets.model.Showtime;
import com.movietickets.repositories.TheaterRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AddCinemaServlet", value = "/AddCinemaServlet")
public class AddCinemaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String location = request.getParameter("location");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String contactInfo = request.getParameter("contactInfo");
        String image = request.getParameter("image");
        String description = request.getParameter("description");

        Connection connection = DatabaseConnectionPool.getConnection();
        TheaterRepository theaterRepository = new TheaterRepository(connection);



        try {
           int rows  = theaterRepository.addTheater(name, location, capacity, contactInfo, image,description);
              if (rows > 0) {
                response.sendRedirect("GetCinemasServlet");
              }
        } catch (Exception e) {
            e.printStackTrace();
        }





    }
}