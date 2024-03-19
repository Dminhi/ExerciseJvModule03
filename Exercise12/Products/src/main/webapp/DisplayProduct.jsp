<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
</head>
<body>
<h2>Product List</h2>
<table border="1" id="productTable">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Manufacturer</th>
        <th>Price</th>
        <th colspan="2">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="product">;
    <tr>
        <td>${product.idProduct}</td>
        <td>${product.productName}</td>
        <td>${product.description}</td>
        <td>${product.manufacturer}</td>
        <td>${product.productPrice}</td>
        <td><a href="/product?action=update&id=${product.idProduct}">Edit</a></td>
        <td><a onclick="return confirm('bạn có chắc muốn xóa không')" href="/product?action=delete&id=${product.idProduct}">DELETE</a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>