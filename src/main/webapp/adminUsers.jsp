<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movietickets.model.User" %><%--
  Created by IntelliJ IDEA.
  User: amanuel
  Date: 1/29/24
  Time: 12:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%
    ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
%>
<div class="px-4 sm:px-6 lg:px-8">
    <div class="sm:flex sm:items-center">
        <div class="sm:flex-auto">
            <h1 class="text-base font-semibold leading-6 text-gray-900">Users</h1>
            <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title, email and role.</p>
        </div>

    </div>
    <div class="mt-8 flow-root">
        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                <table class="min-w-full divide-y divide-gray-300">
                    <thead>
                    <tr>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-0">Name</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Email</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Phone</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Role</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-red-300">
                            <span class="sr-only">remove</span>
                        </th>

                    </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                    <%
                        for (User user : users) {
                    %>

                    <tr>
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0">
                            <%= user.getFullName()%>
                        </td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                            <%= user.getEmail()%>
                        </td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                            <%= user.getPhone()%>
                        </td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                            <%= user.getRole()%>
                        </td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm font-medium text-right">
                            <a href="/dashboard?tab=users&mode=delete&user=<%=user.getUserId()%>" class="text-red-600 hover:text-red-900">Remove</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
