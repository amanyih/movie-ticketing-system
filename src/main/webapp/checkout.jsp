<%@ page import="com.movietickets.model.Movie" %>
<%@ page import="com.movietickets.model.Showtime" %>
<%@ page import="com.movietickets.model.User" %>
<%@ page import="com.movietickets.model.Theater" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    System.out.println("Checkout page called");
    if(session == null || session.getAttribute("user") == null){response.sendRedirect("login.jsp");}
%>
<body>
<%@include file="nav.jsp" %>
<%
    Showtime showtime = (Showtime) request.getAttribute("showtime");
    Movie movie = showtime.getMovie();
    Theater theater = showtime.getTheater();
    User user = (User) request.getSession().getAttribute("user");
%>
<div class="bg-gray-50">
    <div class="mx-auto max-w-2xl px-4 pb-24 pt-16 sm:px-6 lg:max-w-7xl lg:px-8">
        <h2 class="sr-only">Checkout</h2>

        <form class="lg:grid lg:grid-cols-2 lg:gap-x-12 xl:gap-x-16" action="gateway?showtimeId=<%=showtime.getShowtimeId()%>" method="post">
            <div>
                <div>
                    <h2 class="text-lg font-medium text-gray-900">Contact information</h2>

                    <div class="mt-4">
                        <label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
                        <div class="mt-1">
                            <input

                                    type="email" id="email" name="email" autocomplete="email"
                                    class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                        </div>
                    </div>
                </div>

                <div class="mt-10 border-t border-gray-200 pt-10">
                    <h2 class="text-lg font-medium text-gray-900">
                        Personal Information
                    </h2>

                    <div class="mt-4 grid grid-cols-1 gap-y-6 sm:grid-cols-2 sm:gap-x-4">
                        <div>
                            <label for="fullname" class="block text-sm font-medium text-gray-700">Full name</label>
                            <div class="mt-1">
                                <input type="text" id="fullname" name="fullname" autocomplete="given-name"
                                       value="<%=user.getFullName()%>"
                                       class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>

                        <div>
                            <label for="city" class="block text-sm font-medium text-gray-700">Address</label>
                            <div class="mt-1">
                                <input type="text" name="city" id="city" autocomplete="address-level2"
                                       value="<%=user.getAddress()%>"
                                       class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>


                        <div class="sm:col-span-2">
                            <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
                            <div class="mt-1">
                                <input type="text" name="phone" id="phone" autocomplete="tel"
                                       value="<%=user.getPhone()%>"
                                       class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Payment -->
                <div class="mt-10 border-t border-gray-200 pt-10">
                    <h2 class="text-lg font-medium text-gray-900">Payment</h2>

                    <fieldset class="mt-4">
                        <legend class="sr-only">Payment type</legend>
                        <div class="space-y-4 sm:flex sm:items-center sm:space-x-10 sm:space-y-0">
                            <div class="flex items-center">
                                <input id="creditcard" name="paymenttype" type="radio" checked
                                       class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                <label for="creditcard" class="ml-3 block text-sm font-medium text-gray-700">Credit
                                    card</label>
                            </div>
                            <div class="flex items-center">
                                <input id="paypal" name="paymenttype" type="radio"
                                       class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                <label for="paypal" class="ml-3 block text-sm font-medium text-gray-700">PayPal</label>
                            </div>
                            <div class="flex items-center">
                                <input id="etransfer" name="paymenttype" type="radio"
                                       class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                <label for="etransfer"
                                       class="ml-3 block text-sm font-medium text-gray-700">eTransfer</label>
                            </div>
                        </div>
                    </fieldset>

                    <div class="mt-6 grid grid-cols-4 gap-x-4 gap-y-6">
                        <div class="col-span-4">
                            <label for="cardnumber" class="block text-sm font-medium text-gray-700">Card number</label>
                            <div class="mt-1">
                                <input type="text" id="cardnumber" name="cardnumber" autocomplete="cc-number"
                                       class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>

                        <div class="col-span-4">
                            <label for="nameoncard" class="block text-sm font-medium text-gray-700">Name on
                                card</label>
                            <div class="mt-1">
                                <input type="text" id="nameoncard" name="nameoncard" autocomplete="cc-name"
                                       class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>

                        <div class="col-span-3">
                            <label for="expirationdate" class="block text-sm font-medium text-gray-700">Expiration date
                                (MM/YY)</label>
                            <div class="mt-1">
                                <input type="text" name="expirationdate" id="expirationdate" autocomplete="cc-exp"
                                       class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>

                        <div>
                            <label for="cvc" class="block text-sm font-medium text-gray-700">CVC</label>
                            <div class="mt-1">
                                <input type="text" name="cvc" id="cvc" autocomplete="csc"
                                       class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order summary -->
            <div class="mt-10 lg:mt-0">
                <h2 class="text-lg font-medium text-gray-900">Order summary</h2>

                <div class="mt-4 rounded-lg border border-gray-200 bg-white shadow-sm">
                    <h3 class="sr-only">Items in your cart</h3>
                    <ul role="list" class="divide-y divide-gray-200">
                        <li class="flex px-4 py-6 sm:px-6">
                            <div class="flex-shrink-0">
                                <img src="./images/SpidermanBackground.jpg"
                                     class="w-20 rounded-md h-20"
                                     alt="Front of men&#039;s Basic Tee in black." class="w-20 rounded-md">
                            </div>

                            <div class="ml-6 flex flex-1 flex-col">
                                <div class="flex">
                                    <div class="min-w-0 flex-1">
                                        <h4 class="text-sm">
                                            <a href="#" class="font-medium text-gray-700 hover:text-gray-800">
                                                <%= movie.getTitle() %>
                                            </a>
                                        </h4>
                                        <p class="mt-1 text-sm text-gray-500">
                                            At <%=theater.getName()%>
                                        </p>
                                        <p class="mt-1 text-sm text-gray-500">
                                            1 Ticket
                                        </p>
                                        <p class="mt-1 text-sm text-gray-500">
                                           <%=showtime.getShowDate() %> At <%=showtime.getStartTime()%>
                                        </p>
                                    </div>
                                </div>

                                <div class="flex flex-1 items-end justify-between pt-2">
                                    <p class="mt-1 text-sm font-medium text-gray-900">
                                        <%=showtime.getPrice()%>
                                    </p>
                                </div>
                            </div>
                        </li>

                    </ul>
                    <dl class="space-y-6 border-t border-gray-200 px-4 py-6 sm:px-6">
                        <div class="flex items-center justify-between">
                            <dt class="text-sm">Subtotal</dt>
                            <dd class="text-sm font-medium text-gray-900">$64.00</dd>
                        </div>
                        <div class="flex items-center justify-between">
                            <dt class="text-sm">Taxes</dt>
                            <dd class="text-sm font-medium text-gray-900">$5.52</dd>
                        </div>
                        <div class="flex items-center justify-between border-t border-gray-200 pt-6">
                            <dt class="text-base font-medium">Total</dt>
                            <dd class="text-base font-medium text-gray-900">$69.52</dd>
                        </div>
                    </dl>

                    <div class="border-t border-gray-200 px-4 py-6 sm:px-6">
                        <button type="submit"
                                class="w-full rounded-md border border-transparent bg-indigo-600 px-4 py-3 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">
                            Book Now
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
