<%@ page import="com.movietickets.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movietickets.model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<%
    User userAccount = (User) request.getSession().getAttribute("user");
    ArrayList<Booking> bookings = (ArrayList<Booking>) request.getAttribute("bookings");
%>
<body>
<div class="max-w-[90rem] mx-auto">
    <div class="mt-10 bg-[#f7f7f7] rounded-2xl p-12 flex gap-12 items-center relative">
        <div class="aspect-square rounded-full w-[12rem] overflow-hidden">
            <img src="./images/profiletem.jpg"
                 class="w-full h-full" alt="">
        </div>

        <div>
            <p class="text-5xl font-bold text-gray-600">
                <%= userAccount.getFullName() %>
            </p>
            <p class="pt-4 text-xl text-gray-400">
                <%= userAccount.getEmail() %>
            </p>
        </div>

        <div class="absolute top-10 right-10 flex items-center gap-32 p-2 cursor-pointer flex flex-col justify-between">
            <div
                    class="text-white bg-red-400 hover:bg-red-500 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center me-2 ">
                <a href="/deleteUser">
                    Delete Account
                </a>
            </div>


            <a href="/logout.jsp">
                <div
                        class="text-white bg-blue-400 hover:bg-blue-500 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center me-2 ">

                    Logout

                </div>
            </a>

        </div>


    </div>

    <div class="mt-10 bg-[#f7f7f7] rounded-2xl p-12 flex gap-24 items-center">
        <div>
            <p class="text-sm text-gray-400">
                Phone Number
            </p>
            <p class="text-2xl font-bold text-gray-600">
                <%= userAccount.getPhone() %>
            </p>
        </div>

        <div>
            <p class="text-sm text-gray-400">
                Address
            </p>
            <p class="text-2xl font-bold text-gray-600">
                <%=userAccount.getAddress() != null && !userAccount.getAddress().isEmpty() ? userAccount.getAddress() : "Not Specified"%>
            </p>
        </div>
    </div>

    <div class="mt-10 bg-[#f7f7f7] rounded-2xl p-12">
        <h1 class="text-2xl font-bold text-gray-600">
            Bookings
        </h1>

        <div class="pt-10 flex flex-col gap-4">
            <% for (Booking booking : bookings) { %>

            <div class="bg-white p-8 rounded-2xl">
                <p class="text-3xl font-bold text-gray-600">
                    <%= booking.getShowtime().getMovie().getTitle() %>
                </p>
                <div class="flex gap-4 pt-4">
                    <div class="bg-[#f7f7f7] px-6 py-2 rounded-xl">
                        <p class="text-gray-400">
                            Cinema
                        </p>
                        <p class="text-xl font-bold text-gray-600">
                            <%= booking.getShowtime().getTheater().getName() %>
                        </p>
                    </div>

                    <div class="bg-[#f7f7f7] px-6 py-2 rounded-xl">
                        <p class="text-gray-400">
                            Date
                        </p>
                        <p class="text-xl font-bold text-gray-600">
                            <%= booking.getShowtime().getShowDate() %>
                        </p>
                    </div>

                    <div class="bg-[#f7f7f7] px-6 py-2 rounded-xl">
                        <p class="text-gray-400">
                            Time
                        </p>
                        <p class="text-xl font-bold text-gray-600">
                            <%= booking.getShowtime().getStartTime() %>
                        </p>
                    </div>

                    <div class="bg-[#f7f7f7] px-6 py-2 rounded-xl">
                        <p class="text-gray-400">
                            Seat
                        </p>
                        <p class="text-xl font-bold text-gray-600">
                            <%= booking.getSeats() %>
                        </p>
                    </div>

                    <div class="bg-[#f7f7f7] px-6 py-2 rounded-xl">
                        <p class="text-gray-400">
                            Total
                        </p>
                        <p class="text-xl font-bold text-gray-600">
                            <%= booking.getShowtime().getPrice()%>
                        </p>
                    </div>

                </div>
            </div>
            <% } %>
        </div>

        <%if (bookings.size() == 0) {%>
        <div class="bg-white p-8 rounded-2xl">
            <p class="text-3xl font-bold text-gray-600">
                No Bookings
            </p>
        </div>
        <%}%>

    </div>
</div>

</body>
</html>
