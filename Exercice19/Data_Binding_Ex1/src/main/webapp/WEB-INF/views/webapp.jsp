<%--
  Created by IntelliJ IDEA.
  User: dminhi
  Date: 2024/03/22
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Email Configuration</h1>

<form id="configForm">
    <label for="language">Ngôn ngữ:</label>
    <select id="language" name="language">
        <option value="english">English</option>
        <option value="vietnamese">Vietnamese</option>
        <option value="japanese">Japanese</option>
        <option value="chinese">Chinese</option>
    </select><br><br>

    <label for="pageSize">Page Size:</label>
    <select id="pageSize" name="pageSize">
        <option value="5">5</option>
        <option value="10">10</option>
        <option value="15">15</option>
        <option value="25">25</option>
        <option value="50">50</option>
        <option value="100">100</option>
    </select><br><br>
    <label>Spam filter: </label>
    <input type="checkbox"> Enable spam filter
    <label>Signature: </label>
    <textarea name="" id="" cols="30" rows="10"></textarea>

    <button type="submit">Update</button>
    <button type="submit">Cancel</button>
</form>

</body>
</html>
