<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setContentType("text/html");
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie : cookies){
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
    HttpSession httpSession = request.getSession(true);
    httpSession.removeAttribute("user");
    httpSession.setMaxInactiveInterval(0);
    httpSession.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
</html>
