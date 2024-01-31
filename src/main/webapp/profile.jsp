<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if(session == null || session.getAttribute("user") == null){response.sendRedirect("login.jsp");}
%>

<%
    String[] tabs = {"My Account", "Edit Profile"};
    String activeTab = request.getParameter("tab");

    if (activeTab == null) {
        response.sendRedirect("profile?tab=Profile");
    }

%>
<body>
<%@include file="nav.jsp" %>
    <div class="max-w-[90rem] mx-auto">
        <nav class="flex gap-8 text-gray-600 pt-2 border-b justify-center">
            <%for (String tab : tabs) {%>
                <a
                    class="whitespace-nowrap p-4 text-sm font-medium hover:bg-gray-100 <%= tab.equals(activeTab) ? "border-b-2 border-indigo-500 text-indigo-600" : "" %>"
                    href="profile?tab=<%= tab %>">
                    <%= tab %>
                </a>
            <%}%>
        </nav>

        <%if (activeTab.equals("My Account")){ %>
        <%@include file="myAccount.jsp" %>
        <%} else if (activeTab.equals("Edit Profile")) {%>
        <%@include file="editprofile.jsp" %>
        <%}%>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>