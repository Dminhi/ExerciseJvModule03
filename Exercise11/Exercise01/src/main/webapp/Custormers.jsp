<%--
  Created by IntelliJ IDEA.
  User: dminhi
  Date: 2024/03/18
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách khách hàng</title>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    img {
      max-width: 100px;
      max-height: 100px;
    }
  </style>
</head>
<body>

<table>
  <thead>
  <tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>${user.names}</td>
    <td>${user.age}</td>
    <td>${user.birthDay}</td>
    <td><img src="${user.img}" alt="Ảnh khách hàng A"></td>
  </tr>
  </tbody>
</table>

</body>
</html>
