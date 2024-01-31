<%@ page import="com.movietickets.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Cinema Ticket Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<%
    User user = (User) request.getSession().getAttribute("user");
    String success = (String) request.getSession().getAttribute("success");

    if (success != null) {
        request.getSession().removeAttribute("success");
    } else {
        success = "";
    }

    System.out.println("User: " + user);
%>
<% request.setAttribute("page", "home"); %>
<%@include file="nav.jsp" %>
<div class="bg-white">
    <div class="mx-auto max-w-7xl py-24 sm:px-6 sm:py-32 lg:px-8">
        <div class="relative isolate overflow-hidden bg-gray-900 px-6 pt-16 shadow-2xl sm:rounded-3xl sm:px-16 md:pt-24 lg:flex lg:gap-x-20 lg:px-24 lg:pt-0">
            <svg viewBox="0 0 1024 1024"
                 class="absolute left-1/2 top-1/2 -z-10 h-[64rem] w-[64rem] -translate-y-1/2 [mask-image:radial-gradient(closest-side,white,transparent)] sm:left-full sm:-ml-80 lg:left-1/2 lg:ml-0 lg:-translate-x-1/2 lg:translate-y-0"
                 aria-hidden="true">
                <circle cx="512" cy="512" r="512" fill="url(#759c1415-0410-454c-8f7c-9a820de03641)" fill-opacity="0.7"/>
                <defs>
                    <radialGradient id="759c1415-0410-454c-8f7c-9a820de03641">
                        <stop stop-color="#7775D6"/>
                        <stop offset="1" stop-color="#E935C1"/>
                    </radialGradient>
                </defs>
            </svg>
            <div class="mx-auto max-w-md text-center lg:mx-0 lg:flex-auto lg:py-32 lg:text-left">
                <h2 class="text-3xl font-bold tracking-tight text-white sm:text-4xl">Book your tickets Now.<br>Start
                    enjoying the show today.</h2>
                <p class="mt-6 text-lg leading-8 text-gray-300">Find your favorite movies, choose a cinema, select your
                    preferred seats, and book your tickets hassle-free.</p>
                <div class="mt-10 flex items-center justify-center gap-x-6 lg:justify-start">
                    <a href="/search"
                       class="rounded-md bg-white px-3.5 py-2.5 text-sm font-semibold text-gray-900 shadow-sm hover:bg-gray-100 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white">Get
                        started</a>
                    <a href="/about" class="text-sm font-semibold leading-6 text-white">Learn more <span
                            aria-hidden="true">→</span></a>
                </div>
            </div>
            <div class="relative mt-16 h-80 lg:mt-8">
                <img class="absolute left-0 top-0 w-[57rem] max-w-none rounded-md bg-white/5 ring-1 ring-white/10"
                     src="./images/FoodBackground.jpg" alt="App screenshot" width="1824" height="1080">
            </div>
        </div>
    </div>
</div>
<div class="bg-white py-24 sm:py-32">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <div class="mx-auto max-w-2xl lg:text-center">
            <h2 class="text-base font-semibold leading-7 text-indigo-600">Discover the magic of Cinema</h2>
            <p class="mt-2 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Everything you need for a
                cinematic experience</p>
            <p class="mt-6 text-lg leading-8 text-gray-600">Explore the latest movies, book your tickets, and enjoy a
                seamless cinema experience with our easy-to-use platform.</p>
        </div>
        <div class="mx-auto mt-16 max-w-2xl sm:mt-20 lg:mt-24 lg:max-w-4xl">
            <dl class="grid max-w-xl grid-cols-1 gap-x-8 gap-y-10 lg:max-w-none lg:grid-cols-2 lg:gap-y-16">
                <div class="relative pl-16">
                    <dt class="text-base font-semibold leading-7 text-gray-900">
                        <div class="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M12 16.5V9.75m0 0l3 3m-3-3l-3 3M6.75 19.5a4.5 4.5 0 01-1.41-8.775 5.25 5.25 0 0110.233-2.33 3 3 0 013.758 3.848A3.752 3.752 0 0118 19.5H6.75z"/>
                            </svg>
                        </div>
                        Explore Movies
                    </dt>
                    <dd class="mt-2 text-base leading-7 text-gray-600">Browse through a wide selection of movies, from
                        the latest releases to classic favorites.
                    </dd>
                </div>
                <div class="relative pl-16">
                    <dt class="text-base font-semibold leading-7 text-gray-900">
                        <div class="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"/>
                            </svg>
                        </div>
                        Secure Booking
                    </dt>
                    <dd class="mt-2 text-base leading-7 text-gray-600">Enjoy a secure and reliable booking process for
                        your favorite movies and seats.
                    </dd>
                </div>
                <div class="relative pl-16">
                    <dt class="text-base font-semibold leading-7 text-gray-900">
                        <div class="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M12 5v14M5 12h14M8.6 15.2l6.8-6.8"/>
                            </svg>
                        </div>
                        Convenient Payments
                    </dt>
                    <dd class="mt-2 text-base leading-7 text-gray-600">Make hassle-free payments for your movie tickets
                        using various payment methods.
                    </dd>
                </div>
                <div class="relative pl-16">
                    <dt class="text-base font-semibold leading-7 text-gray-900">
                        <div class="absolute left-0 top-0 flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-600">
                            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M12 5v14M5 12h14M8.6 15.2l6.8-6.8"/>
                            </svg>
                        </div>
                        Personalized Recommendations
                    </dt>
                    <dd class="mt-2 text-base leading-7 text-gray-600">Receive movie recommendations tailored to your
                        preferences and watch history.
                    </dd>
                </div>
                <!-- Add more points based on your features -->
            </dl>
        </div>
    </div>
</div>

<div class="bg-white py-24 sm:py-32">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <dl class="grid grid-cols-1 gap-x-8 gap-y-16 text-center lg:grid-cols-3">
            <div class="mx-auto flex max-w-xs flex-col gap-y-4">
                <dt class="text-base leading-7 text-gray-600">Movies playing every day</dt>
                <dd class="order-first text-3xl font-semibold tracking-tight text-gray-900 sm:text-5xl">Hundreds of
                    options
                </dd>
            </div>
            <div class="mx-auto flex max-w-xs flex-col gap-y-4">
                <dt class="text-base leading-7 text-gray-600">Cinemas in our network</dt>
                <dd class="order-first text-3xl font-semibold tracking-tight text-gray-900 sm:text-5xl">50+ locations
                </dd>
            </div>
            <div class="mx-auto flex max-w-xs flex-col gap-y-4">
                <dt class="text-base leading-7 text-gray-600">Happy customers</dt>
                <dd class="order-first text-3xl font-semibold tracking-tight text-gray-900 sm:text-5xl">Join our
                    satisfied users
                </dd>
            </div>
        </dl>
    </div>
</div>

<%@include file="footer.jsp" %>
</body>

</html>
