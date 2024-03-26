<%--
  Created by IntelliJ IDEA.
  User: dminhi
  Date: 2024/03/21
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chuyển đổi USD sang VND</title>
</head>
<body>

<h2>Chuyển đổi USD sang VND</h2>
<form action="Exchange" method="post">
<label for="usdAmount">Nhập số tiền USD:</label>
<input type="text" id="usdAmount" name="usd" min="0" step="0.01" placeholder="Nhập số tiền USD">
    <input type="submit" name = "submit" value="submit">
</form>
<input style="border: none" type="text" value="${Money}">
<p>Tỷ giá: 1 USD = 24,500 VND</p>

<p id="result" >Kết quả sẽ hiển thị ở đây</p>
</body>
</html>
