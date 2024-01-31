<%@ page import="com.movietickets.model.Theater" %><%--
  Created by IntelliJ IDEA.
  User: amanuel
  Date: 1/29/24
  Time: 12:29 AM
  To change this template use File | Settings | File Templates.
--%>


<%--+ "contactInfo VARCHAR(255) NOT NULL,"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<Theater> cinemas = (ArrayList<Theater>) request.getAttribute("cinemas");
    String mode = request.getParameter("mode");
    Theater theater = (Theater) request.getAttribute("cinema");
    if (mode == null) {
        mode = "list";
    }

%>
<script>
    //validation
    function validateForm() {
        var name = document.getElementById("name").value;
        var location = document.getElementById("location").value;
        var capacity = document.getElementById("capacity").value;
        var contactInfo = document.getElementById("contactInfo").value;
        var image = document.getElementById("image").value;
        var description = document.getElementById("description").value;

        var nameError = document.getElementById("nameError");
        var locationError = document.getElementById("locationError");
        var capacityError = document.getElementById("capacityError");
        var contactInfoError = document.getElementById("contactInfoError");
        var imageError = document.getElementById("imageError");
        var descriptionError = document.getElementById("descriptionError");

        function resetErrorsExcept(error) {
            if (error !== nameError) {
                nameError.innerHTML = "";
            }
            if (error !== locationError) {
                locationError.innerHTML = "";
            }
            if (error !== capacityError) {
                capacityError.innerHTML = "";
            }
            if (error !== contactInfoError) {
                contactInfoError.innerHTML = "";
            }
            if (error !== imageError) {
                imageError.innerHTML = "";
            }
            if (error !== descriptionError) {
                descriptionError.innerHTML = "";
            }
        }

        if (name === "") {
            resetErrorsExcept(nameError);
            nameError.innerHTML = "Name cannot be empty";
            return false;
        }

        if (description === "") {
            resetErrorsExcept(descriptionError);
            descriptionError.innerHTML = "Description cannot be empty";
            return false;
        }

        if (location === "") {
            resetErrorsExcept(locationError);
            locationError.innerHTML = "Location cannot be empty";
            return false;
        }

        if (capacity === "") {
            resetErrorsExcept(capacityError);
            capacityError.innerHTML = "Capacity cannot be empty";
            return false;
        }

        if (image === "") {
            resetErrorsExcept(imageError);
            imageError.innerHTML = "Image cannot be empty";
            return false;
        }

        if (contactInfo === "") {
            resetErrorsExcept(contactInfoError);
            contactInfoError.innerHTML = "Contact Info cannot be empty";
            return false;
        }




        return true;
    }
</script>


<div class="flex gap-4 w-full">
    <div class="px-4 sm:px-6 lg:px-8 w-2/3">
        <div class="sm:flex sm:items-center">
            <div class="sm:flex-auto">
                <h1 class="text-base font-semibold leading-6 text-gray-900">Cinemas</h1>
                <p class="mt-2 text-sm text-gray-700">
                    A list of all the cinemas in the system
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
                                class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-0">Name
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Location
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Capacity
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Contact
                                Info
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
                        <% for (Theater cinema : cinemas) { %>

                        <tr>
                            <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0">
                                <%= cinema.getName() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= cinema.getLocation() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= cinema.getCapacity() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= cinema.getContactInfo() %>
                            </td>

                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <a
                                        class="text-indigo-600"
                                        href="<%="/dashboard?tab=cinema&mode=edit&cinema="+cinema.getTheaterId()%>">
                                    edit
                                </a>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm font-medium text-right">
                                <a href="/dashboard?tab=cinema&mode=delete&cinema=<%=cinema.getTheaterId()%>"
                                   class="text-red-600 hover:text-red-900">Remove</a>
                            </td>

                        </tr>

                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class=" w-1/3 border-l-2 border-gray-200 px-4 sm:px-6 lg:px-8 py-4 sm:py-6 lg:py-8">
        <form
                onsubmit="return validateForm()"
                action="<%=mode.equals("edit")? "/dashboard?tab=cinema&mode=edit&cinema="+theater.getTheaterId() : "/dashboard?tab=cinema" %>"
                method="post">
            <div class=" text-center text-lg font-semibold text-gray-900 sm:text-xl lg:text-2xl mb-4">
                <%= mode.equals("edit") ? "Edit Cinema" : "Add Cinema" %>
            </div>
            <div>
                <div class="mt-4">
                    <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                    <div class="mt-1">
                        <input
                                type="text" id="name" name="name" autocomplete="email"
                                value="<%= mode.equals("edit") ? theater.getName() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                    </div>
                    <p id="nameError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                    <div class="mt-1">
                       <textarea
                               id="description" name="description"

                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"><%= mode.equals("edit") ? theater.getDescription() : "" %></textarea>
                    </div>
                    <p id="descriptionError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="location" class="block text-sm font-medium text-gray-700">Location</label>
                    <div class="mt-1">
                        <input
                                id="location" name="location" autocomplete="email"
                                value="<%= mode.equals("edit") ? theater.getLocation() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="locationError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="capacity" class="block text-sm font-medium text-gray-700">Capacity</label>
                    <div class="mt-1">
                        <input
                                id="capacity" name="capacity" autocomplete="email"
                                value="<%= mode.equals("edit") ? theater.getCapacity() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="capacityError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="image" class="block text-sm font-medium text-gray-700">Image</label>
                    <div class="mt-1">
                        <input
                                id="image" name="image" autocomplete="email"
                                value="<%= mode.equals("edit") ? theater.getImage() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                    </div>
                    <p id="imageError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
                <div class="mt-4">
                    <label for="contactInfo" class="block text-sm font-medium text-gray-700">Conatct Info</label>
                    <div class="mt-1">
                        <input
                                id="contactInfo" name="contactInfo" autocomplete="email"
                                value="<%= mode.equals("edit") ? theater.getContactInfo() : "" %>"
                                class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                    </div>
                    <p id="contactInfoError" class="mt-2 text-sm text-red-600 dark:text-red-500 font-medium"></p>
                </div>
            </div>
            <div class="mt-4 flex justify-end">

                <button type="submit"
                        class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                    <%= mode.equals("edit") ? "Save Changes" : "Add Cinema" %>
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
