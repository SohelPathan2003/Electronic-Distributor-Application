<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="electronic.distributor.model.*, org.springframework.beans.factory.annotation.Autowired"%>
<%@ page import="electronic.distributor.service.*"%>
<%@ include file="DashBoard.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product with Details</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
<style>
    .container {
        margin-top: 20px;
      
    }
    .form-select {
        width: 100%;
    }
    .plus-icon {
        width: 20px;
        vertical-align: middle;
        margin-left: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="mb-4 bg-primary text-white">
            <h1 class="text-center">Add Product with Details</h1>
        </header>

        <!-- Form -->
        <form action="isAddProductWithDetails" method="post">
            <div class="form-group">
                <label for="vendorId">Select Vendor</label>
                <div class="input-group">
                    <select id="vendorId" name="vendorId" class="form-control">
                        <option value="0">Select Vendor</option>
                        <c:forEach var="vendormodel" items="${listofvendor}">
                            <option value="${vendormodel.getVendorId()}">${vendormodel.getVendorName()}</option>
                        </c:forEach>
                    </select>
                    <div class="input-group-append">
                        <a href="addvendor"><img alt="" src="./resources/images/plus3.png" class="plus-icon"></a>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="productCategoryId">Select Product Category</label>
                <div class="input-group">
                    <select id="productCategoryId" name="productCategoryId" class="form-control">
                        <option value="">Select Product Category</option>
                        <c:forEach var="productcategory" items="${productcategory}">
                            <option value="${productcategory.getProductCategoryId()}">${productcategory.getProductCategoryName()}</option>
                        </c:forEach>
                    </select>
                    <div class="input-group-append">
                        <a href="AddProductCategory"><img alt="" src="./resources/images/plus3.png" class="plus-icon"></a>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="productId">Select Product Name</label>
                <div class="input-group">
                    <select id="productId" name="productId" class="form-control">
                        <option value="">Select Product Name</option>
                        <c:forEach var="product" items="${products}">
                            <option value="${product.getProductId()}">${product.getProductName()}</option>
                        </c:forEach>
                    </select>
                    <div class="input-group-append">
                        <a href="AddProductName"><img alt="" src="./resources/images/plus3.png" class="plus-icon"></a>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="date">Product Add Date</label>
                <input type="date" id="date" name="date" class="form-control">
            </div>
            <div class="form-group">
                <label for="imageURL">Enter Image Name With Extension</label>
                <input type="text" name="imageURL" class="form-control">
            </div>

            <div class="form-group">
                <label for="text">Features of Product</label>
                <textarea id="text" name="text" class="form-control" rows="4" placeholder="Enter Features of Product"></textarea>
            </div>

            <button type="submit" name="btn" class="btn btn-primary">Add Product</button>
        </form>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <% 
    String btn = request.getParameter("btn");
    if (btn != null) {
    %>
    <script type="text/javascript">
        var result = "${msg}";
        if (result === "success") {
            Swal.fire({
                title: 'Success!',
                text: 'Registration Successfully!!',
                icon: 'success',
                confirmButtonText: 'Ok'
            });
        } else if (result === "wrong") {
            Swal.fire({
                title: 'Error!',
                text: 'Failed To Register',
                icon: 'error',
                confirmButtonText: 'Ok'
            });
        }
    </script>
    <% 
    }
    %>
</body>
</html>
 