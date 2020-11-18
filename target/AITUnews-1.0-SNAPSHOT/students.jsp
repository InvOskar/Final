<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students list</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alphardex/aqua.css@master/dist/aqua.min.css">
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
            grid-template-columns: 1fr 1fr 1fr 1fr;
            grid-column-gap: 50px;
            grid-row-gap: 20px;
        }
        .user{
            border: 3px solid #0950e8;
            background-image: url("https://i.pinimg.com/736x/e3/2e/2a/e32e2a0893cbf4322dd31df3242c1231.jpg");
            display: grid;
            grid-template-rows: auto 1fr;
            color: white;
            border-radius: 20px;
            padding-right: 20px;
        }
        .info{
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-template-rows: 1fr;
        }
        li {
            list-style-type: none;
            font-size: 18px;
            margin-bottom: 1em;
        }
        .search-box{
            display: grid;
            grid-template-columns: repeat(5, 1fr);
        }
        .search-columns{
            display: grid;
            grid-template-rows: 1fr 1fr;
        }
        .searcher, .button{
            font-size: 18px;
            border-radius: 10px;
            border: 3px solid #0950e8;
            color: #0950e8;
            background-color: darkgray;
        }
        .searcher{
            padding-left: 5px;
        }
        #show_all{
            border: 3px solid #0950e8;
            color: #0950e8;;
            display: block;
            border-radius: 10px;
            font-size: 20px;
            background-color: darkgray;
            text-decoration: none;
            width: 60%;
        }
    </style>
    <!-- Button css -->
    <style type="text/scss">
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: #eceffc;
      }

      .btn {
        padding: 8px 20px;
        border-radius: 0;
        overflow: hidden;

        &::before {
          position: absolute;
          content: "";
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: linear-gradient(
                          120deg,
                          transparent,
                          var(--primary-color),
                          transparent
          );
          transform: translateX(-100%);
          transition: 0.6s;
        }

        &:hover {
          background: transparent;
          box-shadow: 0 0 20px 10px hsla(204, 70%, 53%, 0.5);

          &::before {
            transform: translateX(100%);
          }
        }
      }

      .form-input-material {
        --input-default-border-color: white;
        --input-border-bottom-color: white;

        input {
          color: white;
        }
      }

      .login-form {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 50px 40px;
        color: white;
        background: rgba(0, 0, 0, 0.8);
        border-radius: 10px;
        box-shadow: 0 0.4px 0.4px rgba(128, 128, 128, 0.109),
        0 1px 1px rgba(128, 128, 128, 0.155),
        0 2.1px 2.1px rgba(128, 128, 128, 0.195),
        0 4.4px 4.4px rgba(128, 128, 128, 0.241),
        0 12px 12px rgba(128, 128, 128, 0.35);

        h1 {
          margin: 0 0 24px 0;
        }

        .form-input-material {
          margin: 12px 0;
        }

        .btn {
          width: 100%;
          margin: 18px 0 9px 0;
        }
      }

    </style>
</head>
<body>
<!-- Header -->
<header>
    <center><a href="mainpage.jsp" ><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></a></center>
</header>
</body>
</html>
