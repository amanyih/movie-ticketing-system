<%@ page import="com.movietickets.model.Showtime" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<Showtime> showtimes = (ArrayList<Showtime>) request.getAttribute("showtimes");
    ArrayList<Movie> movies = (ArrayList<Movie>) request.getAttribute("movies");
    ArrayList<Theater> theaters = (ArrayList<Theater>) request.getAttribute("theaters");

    Showtime toBeEditedShowtime = (Showtime) request.getAttribute("showtime");
    String mode = request.getParameter("mode");
    if (mode == null) {
        mode = "list";
    }
    boolean isEdit = mode.equals("edit");
    System.out.println("showtime that's to be edited is " + toBeEditedShowtime);
%>
<script>
    function validate(){
        let movie = document.getElementById("movie");
        let cinema = document.getElementById("cinema");
        let showDate = document.getElementById("showDate");
        let starttime = document.getElementById("starttime");
        let endtime = document.getElementById("endtime");
        let price = document.getElementById("price");
        let availableSeats = document.getElementById("availableSeats");

        let movieError = document.getElementById("movieError");
        let cinemaError = document.getElementById("cinemaError");
        let showDateError = document.getElementById("showDateError");
        let starttimeError = document.getElementById("starttimeError");
        let endtimeError = document.getElementById("endtimeError");
        let priceError = document.getElementById("priceError");
        let availableSeatsError = document.getElementById("availableSeatsError");

        function resetErrorsExcept(element){
            if(element !== movie){
                movieError.innerHTML = "";
            }
            if(element !== cinema){
                cinemaError.innerHTML = "";
            }
            if(element !== showDate){
                showDateError.innerHTML = "";
            }
            if(element !== starttime){
                starttimeError.innerHTML = "";
            }
            if(element !== endtime){
                endtimeError.innerHTML = "";
            }
            if(element !== price){
                priceError.innerHTML = "";
            }
            if(element !== availableSeats){
                availableSeatsError.innerHTML = "";
            }
        }

        if(movie.value === ""){
            movieError.innerHTML = "Please select a movie";
            resetErrorsExcept(movieError);
            return false;
        }

        if(cinema.value === ""){
            cinemaError.innerHTML = "Please select a cinema";
            resetErrorsExcept(cinemaError);
            return false;
        }

        if(showDate.value === ""){
            showDateError.innerHTML = "Please select a show date";
            resetErrorsExcept(showDateError);
            return false;
        }

        if(starttime.value === ""){
            starttimeError.innerHTML = "Please select a start time";
            resetErrorsExcept(starttime);
            return false;
        }

        if(endtime.value === ""){
            endtimeError.innerHTML = "Please select an end time";
            resetErrorsExcept(endtime);
            return false;
        }

        if(price.value === ""){
            priceError.innerHTML = "Please enter a price";
            resetErrorsExcept(price);
            return false;
        }

        if (availableSeats.value === ""){
            availableSeatsError.innerHTML = "Please enter available seats";
            return false;
        }

        return true;
    }

</script>
<div class="flex gap-4 w-full">
    <div class="px-4 sm:px-6 lg:px-8 w-2/3">
        <div class="sm:flex sm:items-center">
            <div class="sm:flex-auto">
                <h1 class="text-base font-semibold leading-6 text-gray-900">Showtimes</h1>
                <p class="mt-2 text-sm text-gray-700">
                    A list of all the showtimes in the system
                </p>
            </div>

        </div>
        <div class="mt-8 flow-root">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                    <table class="min-w-full divide-y divide-gray-300">
                        <thead>
                        <tr>
                            <th scope="col"
                                class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-0">Movie
                                Title
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Cinema
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Available
                                Seats
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                                Price
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                                <span class="sr-only">Edit</span>
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-red-300">
                                <span class="sr-only">Delete</span>
                            </th>

                        </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                        <% for (Showtime showtime : showtimes) { %>
                        <tr>
                            <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0">
                                <%= showtime.getMovie().getTitle() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= showtime.getTheater().getName() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= showtime.getAvailableSeats() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= showtime.getPrice() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <a
                                        class="text-indigo-600"
                                        href="<%="/dashboard?tab=showtime&mode=edit&showtime="+showtime.getShowtimeId()%>">
                                    edit
                                </a>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm font-medium text-right">
                                <a href="/dashboard?tab=showtime&mode=delete&showtime=<%=showtime.getShowtimeId()%>" class="text-red-600 hover:text-red-900">Remove</a>
                            </td>

                        </tr>
                        <% } %>

                        <!-- More people... -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class=" w-1/3 border-l-2 border-gray-200 px-4 sm:px-6 lg:px-8 py-4 sm:py-6 lg:py-8">
        <form onsubmit="return validate()" action="<%=isEdit? "/dashboard?tab=showtime&mode=edit&showtime="+toBeEditedShowtime.getShowtimeId() : "/dashboard?tab=showtime" %>"
              method="post">
            <div class=" text-center text-lg font-semibold text-gray-900 sm:text-xl lg:text-2xl mb-4">
                <%= isEdit ? "Edit Showtime" : "Add Showtime" %>
            </div>
            <div>
                <div class="mt-4">
                    <label for="movie" class="block text-sm font-medium text-gray-700">Movie</label>
                    <div class="mt-1">
                        <select
                                type="text" id="movie" name="movie" autocomplete="email"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            <% for (Movie movie : movies) { %>
                            <option
                                    selected=<%=isEdit && movie.getMovieId() ==toBeEditedShowtime.getMovie().getMovieId()%>
                                            value="<%= movie.getMovieId() %>"><%= movie.getTitle() %>
                            </option>
                            <% } %>

                        </select>
                    </div>
                    <p id="movieError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="cinema" class="block text-sm font-medium text-gray-700">Cinema</label>
                    <div class="mt-1">
                        <select
                                id="cinema" name="cinema" autocomplete="email"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                            <% for (Theater theater : theaters) { %>
                            <option
                                    <%=isEdit && theater.getTheaterId() == toBeEditedShowtime.getTheater().getTheaterId() ? "selected" : ""%>
                                    value="<%= theater.getTheaterId() %>"><%= theater.getName() %>
                            </option>
                            <% } %>

                        </select>
                    </div>
                    <p id="cinemaError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="showDate" class="block text-sm font-medium text-gray-700">Show Date</label>
                    <div class="mt-1">
                        <input
                                type="date"
                                id="showDate" name="showDate" autocomplete="email"
                                value="<%= isEdit ? toBeEditedShowtime.getShowDate() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="showDateError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="starttime" class="block text-sm font-medium text-gray-700">Start Time</label>
                    <div class="mt-1">
                        <input
                                id="starttime" name="starttime" autocomplete="email"
                                value="<%= isEdit ? toBeEditedShowtime.getStartTime() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="starttimeError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="endtime" class="block text-sm font-medium text-gray-700">End Time</label>
                    <div class="mt-1">
                        <input
                                id="endtime" name="endtime" autocomplete="email"
                                value="<%= isEdit ? toBeEditedShowtime.getEndTime() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="endtimeError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="price" class="block text-sm font-medium text-gray-700">Price</label>
                    <div class="mt-1">
                        <input
                                type="number"
                                id="price" name="price" autocomplete="email"
                                value="<%= isEdit ? toBeEditedShowtime.getPrice() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="priceError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="availableSeats" class="block text-sm font-medium text-gray-700">Avaliable Seats</label>
                    <div class="mt-1">
                        <input
                                type="text"
                                id="availableSeats" name="availableSeats" autocomplete="email"
                                value="<%= isEdit ? toBeEditedShowtime.getAvailableSeats() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="availableSeatsError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>


            </div>
            <div class="mt-4 flex justify-end">

                <button type="submit"
                        class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                    <%= isEdit ? "Edit Showtime" : "Add Showtime" %>
                </button>
            </div>

        </form>
    </div>

</div>

</body>
</html>
