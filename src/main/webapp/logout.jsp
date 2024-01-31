<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
</body>
</html>