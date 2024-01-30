<%--
  Created by IntelliJ IDEA.
  User: amanuel
  Date: 1/26/24
  Time: 10:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% request.setAttribute("page", "cinema"); %>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@include file="nav.jsp" %>
<h1 class="text-3xl font-bold
items-center
mt-4
px-20
py-4
justify-center

">Cinema</h1>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-2 mt-4 mb-4 px-20 items-center justify-center">
    <% for (int i = 0; i < 10; i++) { %>
    <%@include file="cinemaCard.jsp" %> <% } %>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
