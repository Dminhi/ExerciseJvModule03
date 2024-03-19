<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product List</title>
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
  <!-- Danh sách sản phẩm sẽ được hiển thị ở đây -->
  <!-- Đây là vùng hiển thị sản phẩm được tạo động từ dữ liệu từ server-side -->
</table>

<h2> Product</h2>
<form action="/product" id="editProductForm" method="post">
  <label for="productName">Product Name:</label><br>
  <input type="text" id="productName" name="productName"><br>
  <label for="description">Description:</label><br>
  <input type="text" id="description" name="description"><br>
  <label for="manufacturer">Manufacturer:</label><br>
  <input type="text" id="manufacturer" name="manufacturer"><br>
  <label for="productPrice">Price:</label><br>
  <input type="number" id="productPrice" name="productPrice"><br><br>
  <input type="submit" name="action" value="addProduct">
</form>
</body>
</html>