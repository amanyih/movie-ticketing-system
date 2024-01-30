package com.movietickets.servlets.movie;

import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "DeleteMovieServlet", value = "/DeleteMovieServlet")
public class DeleteMovieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("movieId"));

        String sql = "DELETE FROM movie WHERE movieId = ?";
        Connection connection = DatabaseConnectionPool.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, movieId);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("admindDashboard.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}