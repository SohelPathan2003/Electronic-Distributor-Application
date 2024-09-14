<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        header {
            text-align: center;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 2.5rem;
            color: #333;
        }

        .card {
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
            flex-direction: row;
            gap: 20px;
            border-left: 5px solid #007bff; /* Colorful left border */
        }

        .card-image {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-image img {
            max-height: 200px; /* Increased image height */
            width: auto;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .card-details {
            flex: 2;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .card-header {
            font-weight: bold;
            color: #555;
        }

        .card-content p {
            margin: 5px 0;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            font-weight: bold;
            color: #333;
        }

        .card-footer span {
            color: #007bff; /* Color for amount */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .card {
                flex-direction: column;
                align-items: flex-start;
                padding: 15px;
            }

            .card-image img {
                max-height: 150px;
            }
        }

        @media (max-width: 480px) {
            .card {
                padding: 10px;
            }

            .card-footer {
                flex-direction: column;
                align-items: flex-start;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Order History</h1>
        </header>
        <c:forEach var="order" items="${userorderlist}">
            <div class="card">
                <div class="card-image">
                    <img src="./resources/images/${order.imageURL}" alt="${order.productName}">
                </div>
                <div class="card-details">
                    <div class="card-header">
                        <span>Order Date: ${order.date}</span>
                    </div>
                    <div class="card-content">
                        <p>Product: ${order.productName}</p>
                        <p>Category: ${order.productCategory}</p>
                        <p>Quantity: ${order.quantity}</p>
                        <p>Address: ${order.address}</p>
                    </div>
                    <div class="card-footer">
                        <span>Amount: &#8377;${order.amount}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
