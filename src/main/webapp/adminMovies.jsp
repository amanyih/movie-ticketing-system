<%@ page import="com.movietickets.model.Movie" %>
<%@ page import="com.movietickets.model.Genre" %><%--
  Created by IntelliJ IDEA.
  User: amanuel
  Date: 1/29/24
  Time: 12:29 AM
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
    ArrayList<Movie> movies = (ArrayList<Movie>) request.getAttribute("movies");
    ArrayList<Genre> genres = (ArrayList<Genre>) request.getAttribute("genres");

    String mode = request.getParameter("mode");
    Movie toBeEditedMovie = (Movie) request.getAttribute("movie");
    if (mode == null) {
        mode = "list";
    }
    boolean isEdit = mode.equals("edit");
%>
<div class="flex gap-4 w-full">
    <div class="px-4 sm:px-6 lg:px-8 w-2/3">
        <div class="sm:flex sm:items-center">
            <div class="sm:flex-auto">
                <h1 class="text-base font-semibold leading-6 text-gray-900">Movies</h1>
                <p class="mt-2 text-sm text-gray-700">
                    A list of all movie users.
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
                                class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-0">Image
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Title</th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Duration</th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Rating</th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">
                                <span class="sr-only">Edit</span>
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-red-300">
                                <span class="sr-only">Delete</span>
                            </th>

                        </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                        <% for (Movie movie : movies) { %>
                        <tr>
                            <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0">
                                <%= movie.getPosterImage() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= movie.getTitle() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= movie.getDuration() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <%= movie.getRating() %>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                <a
                                        class="text-indigo-600"
                                        href="<%="/dashboard?tab=movies&mode=edit&movie="+movie.getMovieId()%>">
                                    edit
                                </a>
                            </td>
                            <td class="whitespace-nowrap px-3 py-4 text-sm font-medium text-right">
                                <a href="/dashboard?tab=movies&mode=delete&movie=<%=movie.getMovieId()%>" class="text-red-600 hover:text-red-900">Remove</a>
                            </td>
                        </tr>
                        <% } %>

                        <!-- More people... -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
   <div class=" w-1/3 border-l-2 border-gray-200 px-4 sm:px-6 lg:px-8 py-4 sm:py-6 lg:py-8">
       <form action="<%=isEdit? "/dashboard?tab=movies&mode=edit&movie="+toBeEditedMovie.getMovieId() : "/dashboard?tab=movies" %>" method="post">
           <div class=" text-center text-lg font-semibold text-gray-900 sm:text-xl lg:text-2xl mb-4">
               <%=isEdit ? "Edit Movie" : "Add Movie"%>
           </div>
           <div>
               <div class="mt-4">
                   <label for="title" class="block text-sm font-medium text-gray-700">Title</label>
                   <div class="mt-1">
                       <input
                               type="text" id="title" name="title" autocomplete="email"
                               value="<%=isEdit ? toBeEditedMovie.getTitle() : ""%>"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                   </div>
               </div>
               <div class="mt-4">
                   <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                   <div class="mt-1">
                       <textarea
                                id="description" name="description" autocomplete="email"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                           <%=isEdit ? toBeEditedMovie.getDescription() : ""%>
                          </textarea>
                   </div>
               </div>
               <div class="mt-4">
                   <label for="rating" class="block text-sm font-medium text-gray-700">Rating</label>
                   <div class="mt-1">
                       <input
                               id="rating" name="rating" autocomplete="email"
                               value="<%=isEdit ? toBeEditedMovie.getRating() : ""%>"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                   </div>
               </div>
               <div class="mt-4">
                   <label for="posterImage" class="block text-sm font-medium text-gray-700">Poster Image Link</label>
                   <div class="mt-1">
                       <input
                               id="posterImage" name="posterImage" autocomplete="email"
                               value="<%=isEdit ? toBeEditedMovie.getPosterImage() : ""%>"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                   </div>
               </div>
               <div class="mt-4">
                   <label for="trailerLink" class="block text-sm font-medium text-gray-700">Trailer Link</label>
                   <div class="mt-1">
                       <input
                               id="trailerLink" name="trailerLink" autocomplete="email"
                               value="<%=isEdit ? toBeEditedMovie.getTrailerLink() : ""%>"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                   </div>
               </div>
               <div class="mt-4">
                   <label for="genre" class="block text-sm font-medium text-gray-700">Genre</label>
                   <div class="mt-1">
                       <select
                               id="genre" name="genre" autocomplete="email"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            <% for (Genre genre : genres) { %>
                                <option
                                        class=" appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md"
                                        value="<%= genre.getGenreId() %>"><%= genre.getGenreName() %></option>
                            <% } %>
                       </select>

                   </div>
               </div>
               <div class="mt-4">
                   <label for="duration" class="block text-sm font-medium text-gray-700">Duration</label>
                   <div class="mt-1">
                       <input
                               type="text"
                               id="duration" name="duration" autocomplete="email"
                               value="<%=isEdit ? toBeEditedMovie.getDuration() : ""%>"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                   </div>
               </div>
               <div class="mt-4">
                   <label for="releaseDate" class="block text-sm font-medium text-gray-700">Release Date</label>
                   <div class="mt-1">
                       <input
                               type="date"
                               id="releaseDate" name="releaseDate" autocomplete="email"
                               value="<%=isEdit ? toBeEditedMovie.getReleaseDate() : ""%>"
                               class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                   </div>
               </div>

           </div>
              <div class="mt-4 flex justify-end">

               <button type="submit"
                       class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                     <%=isEdit ? "Edit Movie" : "Add Movie"%>
               </button>
              </div>

       </form>
   </div>

</div>


</body>
</html>
