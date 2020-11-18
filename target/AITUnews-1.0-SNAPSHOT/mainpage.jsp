<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="contants.Database" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<html>
<head>
    <title>AITU students</title>
    <style>
        html, body {
            padding: 0px;
            margin: 0px;
            background: black;
            font-family: 'Raleway', sans-serif;
            color: #FFF;
        }
        :root {
            --base-grid: 8px;
            --colour-white: #fff;
            --colour-black: #1a1a1a;
        }

        *,
        :after,
        :before {
            box-sizing: border-box;
        }
        body {
            background-image: linear-gradient(270deg, #2b67ac 3px, transparent 0),
            linear-gradient(#2b67ac 3px, transparent 0),
            linear-gradient(270deg, rgba(43, 103, 172, 0.4) 1px, transparent 0),
            linear-gradient(#2b67ac 1px, transparent 0),
            linear-gradient(270deg, rgba(43, 103, 172, 0.4) 1px, transparent 0),
            linear-gradient(#2b67ac 1px, transparent 0);
            background-size: 112px 112px, 112px 112px, 56px 56px, 56px 56px, 28px 28px,
            28px 28px;
            font-family: Josefin Sans, sans-serif;
            margin: 0;
            padding: 0;
        }

        .links {
            --link-size: calc(var(--base-grid) * 20);
            color: var(--colour-black);
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            min-height: 75vh;
        }

        .links__list {
            position: relative;
            list-style: none;
        }

        .links__item {
            width: var(--link-size);
            height: var(--link-size);
            position: absolute;
            top: 0;
            left: 0;
            margin-top: calc(var(--link-size) / -2);
            margin-left: calc(var(--link-size) / -2);
            --angle: calc(360deg / var(--item-total));
            --rotation: calc(140deg + var(--angle) * var(--item-count));
            transform: rotate(var(--rotation))
            translate(calc(var(--link-size) + var(--base-grid) * 2))
            rotate(calc(var(--rotation) * -1));
        }

        .links__link {
            opacity: 0;
            animation: on-load 0.3s ease-in-out forwards;
            animation-delay: calc(var(--item-count) * 150ms);
            width: 100%;
            height: 100%;
            border-radius: 50%;
            position: relative;
            background-color: var(--colour-white);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            color: inherit;
        }

        .links__icon {
            width: calc(var(--base-grid) * 8);
            height: calc(var(--base-grid) * 8);
            transition: all 0.3s ease-in-out;
            fill: var(--colour-black);
        }

        .links__text {
            position: absolute;
            width: 100%;
            left: 0;
            text-align: center;
            height: calc(var(--base-grid) * 2);
            font-size: calc(var(--base-grid) * 2);
            display: none;
            bottom: calc(var(--base-grid) * 8.5);
            animation: text 0.3s ease-in-out forwards;
        }

        .links__link:after {
            content: "";
            background-color: transparent;
            width: var(--link-size);
            height: var(--link-size);
            border: 2px dashed var(--colour-white);
            display: block;
            border-radius: 50%;
            position: absolute;
            top: 0;
            left: 0;
            transition: all 0.3s cubic-bezier(0.53, -0.67, 0.73, 0.74);
            transform: none;
            opacity: 0;
        }

        .links__link:hover .links__icon {
            transition: all 0.3s ease-in-out;
            transform: translateY(calc(var(--base-grid) * -1));
        }

        .links__link:hover .links__text {
            display: block;
        }

        .links__link:hover:after {
            transition: all 0.3s cubic-bezier(0.37, 0.74, 0.15, 1.65);
            transform: scale(1.1);
            opacity: 1;
        }

        @keyframes on-load {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            70% {
                opacity: 0.7;
                transform: scale(1.1);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes text {
            0% {
                opacity: 0;
                transform: scale(0.3) translateY(0);
            }
            100% {
                opacity: 1;
                transform: scale(1) translateY(calc(var(--base-grid) * 5));
            }
        }

    </style>
</head>
<body>
<!-- Header -->
<header>
    <center><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></center>
</header>
<!-- Main content -->
<center><h1 style="margin-left: 3vw;">Hello, <c:out value="${sessionScope.username}"/>!</h1></center>
<div class="links">
    <ul class="links__list" style="--item-total:6">
        <li class="links__item" style="--item-count:1">
            <a class="links__link" href="news.jsp">
                <img class="links__icon" src="https://cdn1.iconfinder.com/data/icons/office-and-business-14/48/33-512.png">
                <span class="links__text">News</span>
            </a>
        </li>
        <li class="links__item" style="--item-count:2">
            <a class="links__link" href="events.jsp">
                <img class="links__icon" src="https://www.pngfind.com/pngs/m/543-5435404_svg-events-calendar-events-symbol-hd-png-download.png">
                <span class="links__text">Events</span></a>
        </li>
        <li class="links__item" style="--item-count:3">
            <a class="links__link" href="clubs.jsp">
                <img class="links__icon" src="data:image/png;base64,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">
                <span class="links__text">Clubs</span></a>
        </li>
        <li class="links__item" style="--item-count:4">
            <a class="links__link" href="logout.jsp">
                <img class="links__icon" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSom7R-dV1vVuIKbYpGNYyTKJxbXbPDIDtmJQ&usqp=CAU">
                <span class="links__text">Logout</span></a>
        </li>
        <li class="links__item" style="--item-count:5">
            <a class="links__link" href="StudentsListServlet">
                <img class="links__icon" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Student_%28example%29.svg/1024px-Student_%28example%29.svg.png">
                <span class="links__text">Students</span></a>
        </li>
        <li class="links__item" style="--item-count:6">
            <a class="links__link" href="books.jsp">
                <img class="links__icon" src="https://www.flaticon.com/svg/static/icons/svg/29/29302.svg">
                <span class="links__text">Library</span></a>
        </li>
    </ul>
</div>
</body>
</html>
