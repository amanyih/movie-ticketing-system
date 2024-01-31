<%@ page import="com.movietickets.model.ErrorMessages" %><%--login page--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<%
    String message = (String) request.getAttribute("message");
    if (message == null) {
        message = "";
    }
%>

<body>

<script>
    // validation
    function validate() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        if (email == null || email === "" || !emailRegex.test(email)) {
            var emailError = document.getElementById("emailError");
            emailError.innerHTML = "Please enter a valid email";
            return false;
        }
        if (password == null || password === "" || !passwordRegex.test(password)) {
            var passwordError = document.getElementById("passwordError");
            passwordError.innerHTML = "Please enter a valid password";
            passwordError.innerHTML = "Password must be 6-20 characters, contain at least one uppercase letter, one lowercase letter, and one number";
            return false;
        }
        return true;
    }

    if ("<%=message%>" === "<%= ErrorMessages.INVALID_EMAIL_OR_PASSWORD %>") {
        //show a toast : user already exists
        var toast = "<div id =\"toast\" ><div class='flex items-center justify-between w-full p-2 text-sm font-medium leading-5 text-white bg-red-500 focus:outline-none focus:shadow-outline-red' role='alert'><div class='flex items-center'><svg class='w-4 h-4 mr-2' fill='currentColor' viewBox='0 0 20 20'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zM9 9a1 1 0 112 0v4a1 1 0 11-2 0V9zm1-5a1 1 0 100-2 1 1 0 000 2z' clip-rule='evenodd'></path></svg><span><b>Error</b> Invalid Email or Password</span></div></div></div>";
        document.body.innerHTML += toast;

        setTimeout(function () {
            document.getElementById("toast").remove();
        }, 3000);
    }
</script>

<section class="bg-gray-50 dark:bg-gray-900">
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
        <a href="#" class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
            Movie Ticket Booking System
        </a>
        <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                    Sign in to your account
                </h1>
                <form
                        onsubmit="return validate()"
                        class="space-y-4 md:space-y-6" action="LoginServlet" method="post">
                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
                            email</label>
                        <input type="email" name="email" id="email"
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               placeholder="name@company.com" required="">
                        <div id="emailError" class="text-red-500">
                        </div>
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                        <input type="password" name="password" id="password" placeholder="????????"
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 mb-2"
                               required="">
                        <div id="passwordError" class="text-red-500 mb-2 text-sm"></div>
                    </div>
                    <button type="submit"
                            class="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        Sign in
                    </button>
                    <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                        Don't have an account yet? <a href="register.jsp"
                                                      class="font-medium text-primary-600 hover:underline dark:text-primary-500"> Sign
                        up</a>
                    </p>
                    <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                        <a href="/home"
                           class="font-medium text-primary-600 hover:underline dark:text-primary-500">
                            Continue as Guest
                            </a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>
