<%@ page import="com.movietickets.model.Movie" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movietickets.model.Showtime" %>
<%@ page import="com.movietickets.model.Theater" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<%
    Theater cinema = (Theater) request.getAttribute("cinema");
    ArrayList<Showtime> showtimes = (ArrayList<Showtime>) request.getAttribute("showtimes");
%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link
            href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
            rel="stylesheet"
    />
    <title>
        "Watch at <%= cinema.getName() %>"
    </title>
</head>
<body
        class=""
>

<%@include file="nav.jsp" %>
<main style="max-width: 100rem;" class="mx-auto py-8">
    <div style="background-color: #f7f7f7;" class="p-12 rounded-xl shadow-sm">
        <div class="flex gap-12">
            <div
                    style="height: 20rem;"
                    class="overflow-hidden rounded-xl w-max flex-shrink-0">
                <img src="lotr_poster.jpg" class="h-full" alt="">
            </div>

            <div class="flex flex-col gap-4 justify-between">
                <div class="">
                    <h2 class="text-gray-600 font-bold text-3xl">
                        <%= cinema.getName() %>
                    </h2>

                    <p class="pt-4 text-gray-400 text-lg pr-24">
                        <%= cinema.getDescription() %>
                    </p>
                </div>


                <div class="grid grid-cols-4 w-max gap-4 gap-x-6 pt-4">
                    <div class="bg-white p-4 px-8 flex flex-col items-center rounded-xl col-span-2">
                        <p class=" text-gray-400">
                            Seats
                        </p>
                        <p class="text-gray-500 text-2xl">
                            <%= cinema.getCapacity() %>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div style="background-color: #f7f7f7;" class="p-12 rounded-xl shadow-sm mt-12">
        <h2 class="text-gray-600 font-bold text-3xl">
            Watch at <%= cinema.getName() %>
        </h2>

        <div class="flex gap-8 pt-8">
            <% for
            (Showtime showtime:showtimes) { %>

            <a href="/checkout?showtimeId=<%= showtime.getShowtimeId() %>" class="flex-1">
                <div class="bg-white p-8 rounded-xl flex flex-col gap-4 cursor-pointer hover:bg-gray-100">
                    <div class="flex-1">
                        <p class="text-gray-500 text-3xl">
                            <%= showtime.getMovie().getTitle() %>
                        </p>
                    </div>

                    <div class="flex-1">
                        <p class="text-gray-400 ">
                            <%= showtime.getMovie().getRating() %>
                        </p>
                        <p class="text-gray-400 ">
                            <%= showtime.getStartTime() %> - <%= showtime.getEndTime() %> PM
                        </p>
                    </div>

                    <div class="flex gap-4">
                        <div class="text-gray-400 bg-gray-100 px-3 py-1 rounded-xl">
                            Price
                        </div>
                        <div class="text-gray-400 bg-gray-100 px-3 py-1 rounded-xl">
                            <%= showtime.getPrice()%>
                        </div>
                    </div>
                </div>
                <% } %>
            </a>

        </div>
    </div>


</main>
<%@include file="footer.jsp" %>
</body>
</html>
</head>
<body>
