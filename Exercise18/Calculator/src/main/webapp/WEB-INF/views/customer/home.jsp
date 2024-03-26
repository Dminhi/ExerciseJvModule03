<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dminhi
  Date: 2024/03/22
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Calculator</h1>
<form action="/" method="post">
    <input type="text" name="number1">
    <input type="text" name="number2">
    <input type="submit" name="Calculate" value="Addition">
    <input type="submit" name="Calculate" value="Subtraction">
    <input type="submit" name="Calculate" value="Multiplication">
    <input type="submit" name="Calculate" value="Division">
</form>
<p>Result ${Calculate} ${result}</p>
</body>
</html>
