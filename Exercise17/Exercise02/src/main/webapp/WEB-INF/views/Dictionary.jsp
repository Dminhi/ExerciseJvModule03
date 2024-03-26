<%--
  Created by IntelliJ IDEA.
  User: dminhi
  Date: 2024/03/21
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tra cứu từ Anh - Việt</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        #result {
            font-size: 18px;
            font-weight: bold;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>Tra cứu từ Anh - Việt</h1>
    <form id="searchForm" method="post">
        <label for="searchTerm">Nhập từ cần tra:</label>
        <input type="text" id="searchTerm" name="searchTerm" placeholder="Nhập từ...">
        <button type="submit">Tra cứu</button>
        <input type="text" value="${result}">
    </form>
    <div id="result"></div>
</div>
</body>
</html>

