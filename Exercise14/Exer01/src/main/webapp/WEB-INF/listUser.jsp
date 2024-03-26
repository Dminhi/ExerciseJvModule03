<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <title>User Management Application</title>
</head>

<body>

<center>
    <h1>User Management</h1>
    <h2>
        <a href="/user?action=create">Add New User</a>
    </h2>
</center>
<form action="/user?action=search" method="post">
    <label>Search</label>
    <input type="text" name="country">
    <input type="submit" value="search">
</form>
<form id="selectForm" method="GET">
    <select class="sortBy" name="action">
        <option name="action" value="esc">esc</option>
        <option name="action" value="desc">desc</option>
    </select>
</form>


<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/user?action=edit&id=${user.id}">Edit</a>
                    <a href="/user?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    let href = location.href;
    console.log(href);
    if(href.includes("desc")){
        document.querySelector(".sortBy").value = "desc";
    }
    document.querySelector(".sortBy").addEventListener("change",function (e) {
        // let a = e.target.value;
        console.log(e.target.value);
        location.href="/user?action="+e.target.value;
    })
</script>
</body>
</html>