<%@ page import="com.movietickets.model.Faq" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: amanuel
  Date: 1/26/24
  Time: 10:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<% request.setAttribute("page", "about"); %>

<% ArrayList<Faq> faqs = new ArrayList<>();
    faqs.add(new Faq(1, "What's the best thing about your product?",
            "The best thing about us is the seamless user experience we offer. From intuitive navigation to hassle-free bookings, we prioritize making the process enjoyable."));
    faqs.add(new Faq(2, "How do I book tickets?",
            "Booking is easy! Just choose your movie, showtime, and seats. Complete payment online, and your e-tickets will be sent to your email."));
    faqs.add(new Faq(3, "Can I cancel or modify my booking?",
            "Yes, you can. Visit \"My Bookings\" to cancel or modify under certain conditions. Policies may vary based on the cinema and time before the show."));
    faqs.add(new Faq(4, "Are there extra fees?",
            "We're transparent. While there may be a small convenience fee, it's communicated clearly before you finalize your booking. This fee ensures a seamless experience for you."));
    faqs.add(new Faq(5, "How do I book tickets?",
            "Booking is easy! Just choose your movie, showtime, and seats. Complete payment online, and your e-tickets will be sent to your email."));
    faqs.add(new Faq(6, "Can I cancel or modify my booking?",
            "Yes, you can. Visit \"My Bookings\" to cancel or modify under certain conditions. Policies may vary based on the cinema and time before the show."));
%>

        <body>
<%@include file="nav.jsp" %>
<div class="m-80 sm:mt-32 ">
    <div class="grid grid-cols-1 gap-y-16 lg:grid-cols-2 lg:grid-rows-[auto_1fr] lg:gap-y-12">
        <div class="lg:pl-20">
            <div class="max-w-xs px-2.5 lg:max-w-none">
                <div class="aspect-square rotate-3 rounded-2xl object-cover">
                    <img src="./images/FoodBackground.jpg" alt="" />
                </div>
            </div>
        </div>
        <div class="lg:order-first lg:row-span-2">
            <h1 class="
            text-3xl font-extrabold leading-9 tracking-tight text-zinc-900 sm:text-4xl sm:leading-10 md:text-5xl md:leading-14
">
                Book you ticket with us
            </h1>
            <div class="mt-6 space-y-7 text-base text-zinc-600 dark:text-zinc-400">
                <p>
                    Welcome to us, your go-to destination for effortless and enjoyable
                    online cinema bookings. Our mission is simple: to seamlessly
                    connect movie enthusiasts with the films they love. Navigating our
                    platform is a breeze, allowing you to effortlessly browse
                    showtimes, select your preferred seats, and secure tickets with
                    just a few clicks.
                </p>
                <p>
                    What sets us apart is our commitment to user-friendly design and
                    efficiency. We've partnered with a broad network of cinemas to
                    provide you with an extensive selection of the latest releases and
                    timeless classics. At us, we prioritize your satisfaction and
                    have a dedicated customer support team ready to assist you,
                    ensuring a smooth experience from start to finish.
                </p>
                <p>
                    Join us in celebrating the magic of movies, as we strive to be not
                    just a ticketing platform, but your trusted partner in creating
                    unforgettable cinematic memories. Discover, plan, and enhance your
                    movie adventures with us.
                </p>
            </div>
        </div>
    </div>
    <div class="bg-gray-900">
        <div class="mx-auto max-w-7xl px-6 py-16 sm:py-24 lg:px-8">
            <h2 class="text-2xl font-bold leading-10 tracking-tight text-white">
                Frequently asked questions
            </h2>
            <p class="mt-6 max-w-2xl text-base leading-7 text-gray-300">
                Have a different question and can’t find the answer you’re looking
                for? Reach out to our support team by
                <a
                        href="#"
                        class="font-semibold text-indigo-400 hover:text-indigo-300"
                >
                    sending us an email
                </a>
                and we’ll get back to you as soon as we can.
            </p>
            <div class="mt-20">
                <dl class="space-y-16 sm:grid sm:grid-cols-2 sm:gap-x-6 sm:gap-y-16 sm:space-y-0 lg:grid-cols-3 lg:gap-x-10">
<%--                    {faqs.map((faq) => (--%>
                    <% for (Faq faq : faqs) { %>
                    <div>
                        <dt class="text-base font-semibold leading-7 text-white">
                           <%= faq.getQuestion() %>
                        </dt>
                        <dd class="mt-2 text-base leading-7 text-gray-300">
                            <%= faq.getAnswer() %>
                        </dd>
                    </div>
                    <% } %>

                </dl>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
