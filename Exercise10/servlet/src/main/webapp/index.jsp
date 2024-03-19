<!DOCTYPE html>
<html>

<head>
    <title>HTML Calculator</title>

    <!-- For styling -->
    <style>
        table {
            border: 1px solid black;
            margin-left: auto;
            margin-right: auto;
        }

        input[type="button"] {
            width: 100%;
            padding: 20px 40px;
            background-color: green;
            color: white;
            font-size: 24px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
        }

        input[type="text"] {
            padding: 20px 30px;
            font-size: 24px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            border: 2px solid black;
        }
    </style>
</head>

<body>

<!-- Create table -->
<form action="hello-servlet" method="post">
    <input type="text" name = "discription" placeholder="discription">ProductDescription
    <input type="text" name="ListPrice" placeholder="List Price"> ListPrice
    <input type="text" name="DiscountPercent" placeholder="Discount Percent">DiscountPercent
    <input type="submit">
</form>
</body>

</html>
