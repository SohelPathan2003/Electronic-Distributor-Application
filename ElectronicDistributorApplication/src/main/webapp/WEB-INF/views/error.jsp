<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            padding: 50px;
        }
        .container {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: inline-block;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>An Error Occurred</h1>
        <p>Sorry, something went wrong.</p>
        <p>Error details:</p>
        <pre><%= exception.getMessage() %></pre>
    </div>
</body>
</html>
