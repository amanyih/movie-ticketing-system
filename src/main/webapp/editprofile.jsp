<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<%
    User user = (User) request.getSession().getAttribute("user");
%>
<form class="max-w-[90rem] mx-auto" method="post" action="/UpdateUserServlet">

    <div class="mt-10 bg-[#f7f7f7] rounded-2xl p-12 flex gap-12 items-center">
        <div class="aspect-square rounded-full w-[12rem] overflow-hidden">
            <img src="./images/profiletem.jpg" class="w-full h-full" alt="">
        </div>

        <div class="flex flex-col gap-4">
            <input
                    type="text"
                    name="fullname"
                    class="text-5xl font-bold text-gray-600 border rounded-xl px-3 py-1 focus:outline-gray-200"
                    value= <%=user.getFullName()%>
            />
            <input
                    type="text"
                    name="email"
                    class="text-xl text-gray-400 border rounded-xl px-3 py-2 focus:outline-gray-200"
                    value= <%=user.getEmail()%>
            >
        </div>


    </div>

    <div class="mt-10 bg-[#f7f7f7] rounded-2xl p-12 flex gap-24 items-center">
        <div class="flex flex-col">
            <label for="phone" class="text-sm text-gray-400">
                Phone Number
            </label>
            <input
                    type="text"
                    name="phone"
                    id ="phone"
                    class="text-2xl mt-1 font-bold text-gray-600 border rounded-xl px-3 py-2 focus:outline-gray-200"
                    value= <%=user.getPhone()%>
            >

        </div>

        <div class="flex flex-col">
            <label for="address" class="text-sm text-gray-400">
                Address
            </label>
            <input
                    type="text"
                    name="address"
                    id ="address"
                    class="text-2xl mt-1 font-bold text-gray-600 border rounded-xl px-3 py-2 focus:outline-gray-200"
                    value= <%=user.getAddress() != null ? user.getAddress() : ""%>
            >
        </div>
    </div>

    <div class="mt-6 border-t-2 pt-6 flex gap-8">
        <button
                class="py-3 px-6 font-bold border-2 border-gray-400 text-gray-600 hover:bg-gray-700 hover:text-white rounded-2xl active:bg-gray-800"
        >
            Save Changes
        </button>
    </div>
</form>
</html>
