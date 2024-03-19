<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EditProduct</title>
</head>
<body>
<h2>Product List</h2>
<table border="1" cellpadding="10", cellspacing="10">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Description</th>
    <th>Manufacturer</th>
    <th>Price</th>
  </tr>
</table>

<h2>EditProduct</h2>
<form action="/product" id="productForm" method="post">
  <label for="productName">Product Name:</label><br>
  <input type="text" id="productName" name="productName" value="${product.productName}"><br>
  <label for="description">Description:</label><br>
  <input type="text" id="description" name="description" value="${product.description}"><br>
  <label for="manufacturer">Manufacturer:</label><br>
  <input type="text" id="manufacturer" name="manufacturer" value="${product.manufacturer}"><br>
  <label for="productPrice">Price:</label><br>
  <input type="number" id="productPrice" name="productPrice" value="${product.productPrice}"><br><br>
  <input type="text" name="id" value="${product.idProduct}">
  <input type="submit" name="action" value="editProduct">
</form>
</body>
</html>
