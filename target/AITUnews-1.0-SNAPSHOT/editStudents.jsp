<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Students</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <style>
        html, body {
            padding: 0px;
            margin: 0px;
            background: black;
            font-family: 'Raleway', sans-serif;
            color: #FFF;
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
        }
        .content{
            width: 80%;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-column-gap: 50px;
            grid-row-gap: 20px;
        }
        .user{
            border: 3px solid #0950e8;
            background-image: url("https://i.pinimg.com/736x/e3/2e/2a/e32e2a0893cbf4322dd31df3242c1231.jpg");
            display: grid;
            grid-template-rows: auto 1fr 1fr;
            color: white;
            border-radius: 20px;
        }
        .info{
            display: grid;
            grid-template-columns: 1fr 1fr;
        }
        li {
            list-style-type: none;
            font-size: 18px;
            margin-bottom: 1em;
        }
        input, textarea, button{
            border: 3px solid #0950e8;
            border-radius: 10px;
            font-size: 18px;
        }
        button{
            font-weight: bold;
            color: #0950e8;
        }
    </style>
</head>
<body>
<!-- Header -->
<header>
    <center><a href="adminPanel.jsp" ><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></a></center>
</header>
<!-- Main part -->
</body>
</html>
