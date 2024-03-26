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
<h1>Sandwich Comdiment</h1>
<form action="" method="post">
    <c:forEach items="${condiment}" var="sand">
        <p>${sand}</p>
    </c:forEach>
</form>
</body>
</html>
