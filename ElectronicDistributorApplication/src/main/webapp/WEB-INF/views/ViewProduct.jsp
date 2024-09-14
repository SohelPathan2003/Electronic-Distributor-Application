<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="electronic.distributor.model.*"%>
<%@ include file="DashBoard.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

<style>
    .view-vendor {
        margin: 20px;
    }

    .table thead th {
        background-color: #343a40;
        color: white;
    }

    .table tbody td {
        vertical-align: middle;
    }

    .btn-custom {
        margin: 5px;
    }

    .btn-delete {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn-delete:hover {
        background-color: #c82333;
    }

    .btn-update {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn-update:hover {
        background-color: #0056b3;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
function confirmationDelete(productNumber) {
    Swal.fire({
        title: 'Are you sure?',
        text: 'You will not be able to recover this Product!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Deleted!',
                'Product has been deleted.',
                'success'
            ).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "deleteproduct?productnumber=" + productNumber;
                }
            });
        } else {
            Swal.fire('Cancelled', 'Failed to delete Product :)', 'error');
        }
    });
}
</script>
</head>
<body>
<div class="view-vendor">
    <div class="form-group">
        <label for="searchOptions">Search By:</label>
        <select id="searchOptions" name="choiced" class="form-control form-control-lg">
            <option value="vendorname" selected>By Vendor Name</option>
            <option value="productname">By Product Name</option>
            <option value="productcategory">By Product Category Name</option>
            <option value="date">By Date</option>
            <option value="feature">By Feature</option>
        </select>
    </div>
    <div class="form-group">
        <input type="text" placeholder="Search Products" class="form-control form-control-lg" name="searchv" onkeyup="searchproduct(this.value, searchOptions.value)">
    </div>

    <div id="searchedtable" class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Product Number</th>
                    <th scope="col">Vendor Name</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Category</th>
                    <th scope="col">Joining Date</th>
                    <th scope="col">Features</th>
                    <th scope="col">Delete</th>
                    <th scope="col">Update</th>
                </tr>
            </thead>
            <tbody>
                <% int count = 0; %>
                <c:forEach var="s" items="${productslist}">
                <tr>
                    <td><%= ++count %></td>
                    <td>${s.getVendorModel().getVendorName()}</td>
                    <td>${s.getProductModel().getProductName()}</td>
                    <td>${s.getProductCategoryModel().getProductCategoryName()}</td>
                    <td>${s.getDate()}</td>
                    <td>${s.getDetails()}</td>
                    <td>
                        <a class="btn btn-delete btn-custom" onclick="confirmationDelete(${s.getProductNumber()})">
                            Delete
                        </a>
                    </td>
                    <td>
                        <a class="btn btn-update btn-custom" href="updateproduct?vid=${s.getVendorModel().getVendorId()}&pid=${s.getProductModel().getProductId()}&pcid=${s.getProductCategoryModel().getProductCategoryId()}&productnumber=${s.getProductNumber()}&vendorname=${s.getVendorModel().getVendorName()}&productname=${s.getProductModel().getProductName()}&productcategoryname=${s.getProductCategoryModel().getProductCategoryName()}&date=${s.getDate()}&details=${s.getDetails()}">
                            Update
                        </a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
