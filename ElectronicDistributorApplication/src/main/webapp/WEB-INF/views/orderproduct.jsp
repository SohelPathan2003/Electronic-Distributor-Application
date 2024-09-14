<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product Stock</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
        .container {
            margin-top: 30px;
        }
        .alert-dismissible {
            position: relative;
            padding: 1rem 1rem 1rem 2.5rem;
            margin-bottom: 1rem;
            border: 1px solid transparent;
            border-radius: .25rem;
        }
        .alert-dismissible .btn-close {
            position: absolute;
            top: .5rem;
            right: 1rem;
            padding: .25rem .5rem;
            background: none;
            border: none;
            font-size: 1.25rem;
            color: inherit;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">Add Product Stock</h2>

      
        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Success!</strong> ${message}
                <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

      
        <form id="addProductForm" action="${pageContext.request.contextPath}/product/addStock" method="post">
            <div class="form-group">
                <label for="productId">Product ID</label>
                <input type="text" class="form-control" id="productId" name="productId" required>
                <small class="form-text text-muted">Enter the unique product ID.</small>
            </div>
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" class="form-control" id="productName" name="productName" required>
                <small class="form-text text-muted">Enter the name of the product.</small>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                <small class="form-text text-muted">Enter the quantity to add.</small>
            </div>
            <div class="form-group">
                <label for="price">Price ($)</label>
                <input type="number" class="form-control" id="price" name="price" step="0.01" min="0" required>
                <small class="form-text text-muted">Enter the price of the product.</small>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
            <button type="reset" class="btn btn-secondary ml-2">Reset</button>
        </form>
    </div>

  
    <script>
       
        document.getElementById('addProductForm').addEventListener('submit', function (event) {
            var form = event.target;
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
                form.classList.add('was-validated'); 
            }
        });
    </script>
</body>
</html>
