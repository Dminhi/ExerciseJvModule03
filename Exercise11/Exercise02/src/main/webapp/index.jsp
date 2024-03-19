<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculator Form</title>
</head>
<body>
<h2>Calculator Form</h2>

<form method="post" action="Calculator-servlet">
    <label for="firstOperand">First Operand:</label><br>
    <input type="text" id="firstOperand" name="firstOperand" required><br><br>

    <label for="operator">Operator:</label><br>
    <select id="operator" name="operator">
        <option value="+" name="addition">+</option>
        <option value="-" name="subtraction">-</option>
        <option value="*" name="multiplication">*</option>
        <option value="/" name="division">/</option>
    </select><br><br>

    <label for="secondOperand">Second Operand:</label><br>
    <input type="text" id="secondOperand" name="secondOperand" required><br><br>

    <input type="submit" value="Calculate">
</form>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>