package com.movietickets.servlets.ShowTime;

import com.movietickets.model.Movie;
import com.movietickets.model.Theater;
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

@WebServlet(name = "AddShowTimeServlet", value = "/AddShowTimeServlet")
public class AddShowTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int movieId = Integer.parseInt(request.getParameter("movieId"));
        int theaterId = Integer.parseInt(request.getParameter("theaterId"));
        int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));
        double price = Double.parseDouble(request.getParameter("price"));
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        Connection con = DatabaseConnectionPool.getConnection();
        ShowTimeRepository showTimeRepository = new ShowTimeRepository(con);

        String sql = "SELECT * FROM movie WHERE movieId = ?";
        String sql2 = "SELECT * FROM theater WHERE theaterId = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, movieId);

            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps.setInt(1, theaterId);

            ResultSet rs1 = ps.executeQuery();
            ResultSet rs2 = ps2.executeQuery();

            if(!rs1.next() || !rs2.next()){
                response.sendRedirect("error.jsp");
                return;
            }



            String sql3 = "Insert into showtime (movieId, theaterId, startTime, endTime, availableSeats, price) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setInt(1, movieId);
            ps3.setInt(2, theaterId);
            ps3.setString(3, startTime);
            ps3.setString(4, endTime);
            ps3.setInt(5, availableSeats);
            ps3.setDouble(6, price);

            int rows = showTimeRepository.addShowTime(movieId,theaterId,startTime,endTime,availableSeats,price,"");

            if(rows > 0){
                response.sendRedirect("admin.jsp");  //TODO change to admin page
            }else{
                response.sendRedirect("error.jsp"); //TODO change to error page
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}