<%@ page import="com.movietickets.model.Movie" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movietickets.model.Showtime" %>
<%@ page import="com.movietickets.model.Theater" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<%
    Movie movie = (Movie) request.getAttribute("movie");
    ArrayList<Showtime> showtimes = (ArrayList<Showtime>) request.getAttribute("showtimes");
    String trailerLink = movie.getTrailerLink();
    if (trailerLink.contains("watch?v=")) {
        trailerLink = trailerLink.replace("watch?v=", "embed/");
    } else if (trailerLink.contains("youtu.be/")) {
        trailerLink = trailerLink.replace("youtu.be/", "youtube.com/embed/");
    }

    movie.setTrailerLink(trailerLink);
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
        "Watch <%= movie.getTitle() %> at Cineplex"
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
                <img src=<%=movie.getPosterImage()%> class="h-full" alt="">
            </div>

            <div class="flex flex-col gap-4 justify-between">
                <div class="">
                    <h2 class="text-gray-600 font-bold text-3xl">
                        <%= movie
                                .
                                getTitle
                                        (
                                        ) %>
                    </h2>

                    <p class="pt-4 text-gray-400 text-lg pr-24">
                        <%= movie
                                .
                                getDescription
                                        (
                                        ) %>
                    </p>
                </div>


                <div class="grid grid-cols-4 w-max gap-4 gap-x-6 pt-4">
                    <div class="bg-white p-4 px-8 flex flex-col items-center rounded-xl col-span-2">
                        <p class=" text-gray-400">
                            Rating
                        </p>
                        <p class="text-gray-500 text-2xl">
                            <%= movie
                                    .
                                    getRating
                                            (
                                            ) %>
                        </p>
                    </div>
                    <div class="bg-white p-4 px-8 flex flex-col items-center rounded-xl col-span-2">
                        <p class=" text-gray-400">
                            Recommendation
                        </p>
                        <p class="text-gray-500 text-2xl">
                            Must Watch
                        </p>
                    </div>
                    <div class="bg-white p-4 px-8 flex flex-col items-center rounded-xl">
                        <p class=" text-gray-400">
                            Duration
                        </p>
                        <p class="text-gray-500 text-xl">
                            <%= movie
                                    .
                                    getDuration
                                            (
                                            ) %>
                        </p>
                    </div>
                    <div class="bg-white p-4 px-8 flex flex-col items-center rounded-xl">
                        <p class=" text-gray-400">
                            Genre
                        </p>
                        <p class="text-gray-500 text-xl">
                            <%= movie
                                    .
                                    getGenre
                                            (
                                            )
                                            .
                                    getGenreName
                                            (
                                            ) %>
                        </p>
                    </div>
                    <div class="bg-white p-4 px-8 flex flex-col items-center rounded-xl">
                        <p class=" text-gray-400">
                            Released
                        </p>
                        <p class="text-gray-500 text-xl">
                            <%= movie
                                    .
                                    getReleaseDate
                                            (
                                            ) %>
                        </p>
                    </div>
                    <div class="bg-white p-4 px-8 flex flex-col items-center rounded-xl">
                        <p class=" text-gray-400">
                            Type
                        </p>
                        <p class="text-gray-500 text-xl">
                            Full Length
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="background-color: #f7f7f7;" class="p-12 rounded-xl shadow-sm mt-12">
        <h2 class="text-gray-600 font-bold text-3xl">
            Trailer
        </h2>

        <iframe
                style="height: 40rem;"
                class="rounded-xl mt-4 w-full"
                src="<%= movie.getTrailerLink() %>"
                title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen
        ></iframe>
    </div>


    <div style="background-color: #f7f7f7;" class="p-12 rounded-xl shadow-sm mt-12">
        <h2 class="text-gray-600 font-bold text-3xl">
            Watch at
        </h2>

        <div class="flex gap-8 pt-8">
            <% for
            (
                    Showtime
                            showtime
                    :
                    showtimes
            ) { %>

            <a href="/checkout?showtimeId=<%= showtime.getShowtimeId() %>" class="flex-1">
            <div class="bg-white p-8 rounded-xl flex flex-col gap-4 cursor-pointer hover:bg-gray-100">
                <div class="flex-1">
                    <p class="text-gray-500 text-3xl">
                        <%= showtime
                                .
                                getTheater
                                        (
                                        )
                                        .
                                getName
                                        (
                                        ) %>
                    </p>
                </div>

                <div class="flex-1">
                    <p class="text-gray-400 ">
                        <%= showtime
                                .
                                getTheater
                                        (
                                        )
                                        .
                                getLocation
                                        (
                                        ) %>
                    </p>
                    <p class="text-gray-400 ">
                        <%= showtime
                                .
                                getStartTime
                                        (
                                        ) %> - <%= showtime
                            .
                            getEndTime
                                    (
                                    ) %>
                    </p>
                </div>

                <div class="flex gap-4">
                    <div class="text-gray-400 bg-gray-100 px-3 py-1 rounded-xl">
                        Price   
                    </div>
                    <div class="text-gray-400 bg-gray-100 px-3 py-1 rounded-xl">
                        <%= showtime.getPrice()%> ETB
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
    