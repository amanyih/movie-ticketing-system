package com.movietickets.servlets.User;

import com.movietickets.model.User;
import com.movietickets.repositories.MovieRepository;
import com.movietickets.repositories.UserRepository;
import com.movietickets.util.DatabaseConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Connection con = DatabaseConnectionPool.getConnection();
        MovieRepository movieRepository = new MovieRepository(con);
        UserRepository userRepository = new UserRepository(con,movieRepository);

        try {
            int rows = userRepository.deleteUser(user.getUserId());
            if (rows > 0) {
                session.invalidate();
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Something went wrong");
                request.getRequestDispatcher("profile.jsp?tab=profile").forward(request, response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}