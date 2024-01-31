
<%@ page import="com.movietickets.model.User" %>
<%
    String cur_page = request.getRequestURI();

    if (cur_page.contains("home")) {
        cur_page = "home";
    } else if (cur_page.contains("cinema")) {
        cur_page = "cinema";
    } else if (cur_page.contains("search")) {
        cur_page = "search";
    } else if (cur_page.contains("about")) {
        cur_page = "about";
    }

//    System.out.println(cur_page + " " + session.getAttribute("userAccount"));

    User userNav = (User) session.getAttribute("user");
    boolean isAuthenticated = false;
    boolean isAdmin = false;
    if (userNav == null) {
        isAuthenticated = false;
        isAdmin = false;
    } else {
        isAuthenticated = true;
        isAdmin = userNav.getRole().equals("admin");
    }
%>

<nav class="bg-gray-800">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 items-center justify-between">
            <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                <!-- Mobile menu button-->
                <button type="button"
                        class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                        aria-controls="mobile-menu" aria-expanded="false">
                    <span class="absolute -inset-0.5"></span>
                    <span class="sr-only">Open main menu</span>
                    <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                         aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"/>
                    </svg>
                    <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                         aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                </button>
            </div>
            <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
                <div class="flex flex-shrink-0 items-center">
                    <img class="h-8 w-auto" src="./images/logo.png"
                         alt="Your Company">
                </div>
                <div class="hidden sm:ml-6 sm:block">
                    <div class="flex space-x-4">
                        <a href="home"
                           class="<%= cur_page.equals("home") ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> px-3 py-2 rounded-md text-sm font-medium">
                            Home
                        </a>
                        <a href="cinema"
                           class="<%= cur_page.equals("cinema") ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> px-3 py-2 rounded-md text-sm font-medium">
                            Cinema
                        </a>
                        <a href="search"
                           class="<%= cur_page.equals("search") ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> px-3 py-2 rounded-md text-sm font-medium">
                            Search
                        </a>
                        <a href="about"
                           class="<%= cur_page.equals("about") ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> px-3 py-2 rounded-md text-sm font-medium">
                            About
                        </a>
                    </div>
                </div>
            </div>
            <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                <%if (isAdmin) {%>
                <a type="button"
                   href="/dashboard"
                   class="relative rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                    <span class="absolute -inset-1.5"></span>
                    <span class="sr-only">View notifications</span>
                    <svg class="h-6 w-6 shrink-0 text-indigo-200 group-hover:text-white" fill="none"
                         viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                         aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5"/>
                    </svg>
                </a>
                <%}%>

                <!-- Profile dropdown -->
                <%if (isAuthenticated) {%>
                <div class="relative ml-3">
                    <div>
                        <a href="profile?tab=My Account">
                            <div class="relative flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
                                 id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                                <span class="absolute -inset-1.5"></span>
                                <span class="sr-only">Open user menu</span>
                                <img class="h-8 w-8 rounded-full"
                                     src="<%= userNav.getProfilePic() != null && !userNav.getProfilePic().isEmpty() ? userNav.getProfilePic() : "./images/profiletem.jpg" %>"
                                     alt="">
                            </div>
                        </a>
                    </div>
                </div>
                <%} else {%>
                <a href="login.jsp"
                   class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">
                    Login
                </a>
                <a href="register.jsp"
                   class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">
                    Register
                </a>
                <%}%>

            </div>
        </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
    <div class="sm:hidden" id="mobile-menu">
        <div class="space-y-1 px-2 pb-3 pt-2">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <a href="#" class="bg-gray-900 text-white block rounded-md px-3 py-2 text-base font-medium"
               aria-current="page">Dashboard</a>
            <a href="#"
               class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Team</a>
            <a href="#"
               class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Projects</a>
            <a href="#"
               class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Calendar</a>
        </div>
    </div>
</nav>
