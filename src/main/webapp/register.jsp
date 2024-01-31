<%@ page import="com.movietickets.model.ErrorMessages" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Ticketing System</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<%
    String message = (String) request.getAttribute("message");
    if (message == null){
        message ="";
    }
%>

<script>
    function validateForm(){
        var password = document.getElementById("password").value;
        var confirmpassword = document.getElementById("confirmpassword").value;
        var fullname = document.getElementById("fullname").value;
        var email = document.getElementById("email").value;
        var phone = document.getElementById("phone").value;

        var passwordError = document.getElementById("passwordError");
        var confirmpasswordError = document.getElementById("confirmpasswordError");
        var fullnameError = document.getElementById("fullnameError");
        var emailError = document.getElementById("emailError");
        var phoneError = document.getElementById("phoneError");

        function resetErrorsExceptElement(element){
            if (element != passwordError){
                passwordError.innerHTML = "";
            }
            if (element != confirmpasswordError){
                confirmpasswordError.innerHTML = "";
            }
            if (element != fullnameError){
                fullnameError.innerHTML = "";
            }
            if (element != emailError){
                emailError.innerHTML = "";
            }
            if (element != phoneError){
                phoneError.innerHTML = "";
            }
        }

        var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (!fullname || fullname.length < 3){
            fullnameError.innerHTML = "Full name must be at least 3 characters";
            resetErrorsExceptElement(fullnameError);
            return false;
        }else{
            fullnameError.innerHTML = "";
        }

        if (!email || !emailRegex.test(email)) {
            emailError.innerHTML = "Please enter a valid email";
            resetErrorsExceptElement(emailError);
            return false;
        }

        if (!phone || phone.length < 10){
            phoneError.innerHTML = "Phone number must be at least 10 characters";
            resetErrorsExceptElement(phoneError);
            return false;
        }

        if (!password || !passwordRegex.test(password)) {
            passwordError.innerHTML = "Password must be at least 6 characters and contain at least one number, one lowercase and one uppercase letter";
            resetErrorsExceptElement(passwordError);
            return false;
        }

        if (password !== confirmpassword){
            confirmpasswordError.innerHTML = "Passwords do not match";
            resetErrorsExceptElement(confirmpasswordError);
            return false;
        }

        return true;
    }

    if ("<%=message%>" === "<%= ErrorMessages.USER_ALREADY_EXISTS %>"){
        //show a toast : user already exists
        var toast = "<div id =\"toast\" ><div class='flex items-center justify-between w-full p-2 text-sm font-medium leading-5 text-white bg-red-500 focus:outline-none focus:shadow-outline-red' role='alert'><div class='flex items-center'><svg class='w-4 h-4 mr-2' fill='currentColor' viewBox='0 0 20 20'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zM9 9a1 1 0 112 0v4a1 1 0 11-2 0V9zm1-5a1 1 0 100-2 1 1 0 000 2z' clip-rule='evenodd'></path></svg><span><b>Error</b> : User already exists</span></div></div></div>";
        document.body.innerHTML += toast;

        setTimeout(function(){
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
                    Create an account
                </h1>
                <form
                        onsubmit="return validateForm()"
                        class="space-y-4 md:space-y-6" action="RegisterServlet" method="post">
                    <div>
                        <label for="fullname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Full Name</label>
                        <input type="text" name="fullname" id="fullname"
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               placeholder="Abebe Kebede" required="">
                        <div id = "fullnameError" class= "text-red-500 text-sm font-medium text-center my-2"></div>
                    </div>
                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
                            email</label>
                        <input type="email" name="email" id="email"
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               placeholder="name@company.com" required="">
                        <div id = "emailError" class= "text-red-500 text-sm font-medium text-center my-2"></div>
                    </div>
                    <div>
                        <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
                            Phone</label>
                        <input type="text" name="phone" id="phone"
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               placeholder="+2519123456789" required="">
                        <div id = "phoneError" class= "text-red-500 text-sm font-medium text-center my-2"></div>
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                        <input type="password" name="password" id="password" placeholder=""
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               required="">
                        <div id = "passwordError" class= "text-red-500 text-sm font-medium text-center my-2"></div>
                    </div>
                    <div>
                        <label for="confirmpassword" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm Password</label>
                        <input type="password" name="confirmpassword" id="confirmpassword" placeholder=""
                               class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                               required="">
                        <div id = "confirmpasswordError" class= "text-red-500 text-sm font-medium text-center my-2"></div>
                    </div>

                    <button type="submit"
                            class="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        Sign Up
                    </button>
                    <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                        Already have an account? <a href="login.jsp"
                                                      class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign In</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>
