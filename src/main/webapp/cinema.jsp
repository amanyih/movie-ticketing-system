<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movietickets.model.Theater" %>
<%@ page import="com.movietickets.model.User" %><%--
  Created by IntelliJ IDEA.
  User: amanuel
  Date: 1/26/24
  Time: 10:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% request.setAttribute("page", "cinema"); %>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%
    ArrayList<Theater> cinemas = (ArrayList<Theater>) request.getAttribute("cinemas");
    if (cinemas == null) {
        cinemas = new ArrayList<>();
    }
%>
<%@include file="nav.jsp" %>
<h1 class="text-3xl font-bold items-center mt-4 px-20 py-4 justify-center">Cinema</h1>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-2 mt-4 mb-4 px-20 items-center justify-center">
    <% for (Theater cinema : cinemas) { %>
    <div class="max-w-sm rounded overflow-hidden shadow-lg">
        <img class="
        w-full
        h-64
" src=<%=cinema.getImage()%> alt="Sunset in the mountains">
        <div class="px-6 py-4">
            <div class="font-bold text-xl mb-2"><%=cinema.getName()%></div>
            <p class="text-gray-700 text-base">
<%--               all description should be the same length --%>
                <%=
                    cinema.getDescription().length() > 100 ?
                            cinema.getDescription().substring(0, 100) + "..." :
                            cinema.getDescription()
                %>
            </p>
        </div>
        <div class="px-6 pt-4 pb-2">
            <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">Seats : <%=cinema.getCapacity()%></span>
        </div>
        <div class="px-4 py-2">
            <a class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300
                   dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
               href=<%="/cinemaDetail?cinemaId=" + cinema.getTheaterId()%>>
                View Details
            </a>

        </div>

    </div>
    <% } %>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
