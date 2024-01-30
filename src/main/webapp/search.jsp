<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movietickets.model.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movietickets.model.Genre" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% request.setAttribute("page", "search"); %>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<%
    ArrayList<Movie> movies = (ArrayList<Movie>) request.getAttribute("movies");
    String key =  request.getParameter("key");

    if (key == null) {
        key = "";
    }

%>
<body>

<%@include file="nav.jsp" %>

<div class=" w-full text-gray-900 dark:text-white dark:border-gray-700 px-10 mt-20 flex flex-col items-center justify-center">

    <form class="w-[96rem]" action="/search">
        <label for="key"
               class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
        <div class="relative">

            <div class="mb-6 mx-auto flex w-3/5 rounded-l-lg">
                <input type="key" id="key"
                       name="key"
                       class=" rounded-l-lg block w-full p-4 ps-10 text-base text-gray-900 border border-gray-300  bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 h-20"
                       placeholder="Spiderman " required
                          value=<%=key%>
                >
                <button type="submit"
                        class="text-white end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-r-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    Search
                </button>
            </div>
        </div>
    </form>

</div>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-2 mt-4 mb-4 w-full items-center justify-center px-24 gap-y-10">
    <%for (Movie movie : movies) {%>
    <%
        session.setAttribute("movie", movie);

    %>
    <div>

        <div class="max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">

            <img class="rounded-t-lg" src=<%= movie.getPosterImage()%> alt=""/>
            <div class="p-5">

                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                    <%=movie.getTitle()%>
                </h5>

                <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
                    <%=movie.getDescription()%>
                </p>
                <a class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300
                   dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                   href=<%="/GetMovieDetailServlet?movieId=" + movie.getMovieId()%>>
                    View Details
                </a>
            </div>
        </div>

    </div>
    <%}%>
</div>
<%if (movies.size() == 0) {%>
<div class="text-2xl font-bold tracking-tight text-gray-900 text-center my-40">
    No results found :(
</div>
<%}%>
<%@include file="footer.jsp" %>
</body>
</html>
