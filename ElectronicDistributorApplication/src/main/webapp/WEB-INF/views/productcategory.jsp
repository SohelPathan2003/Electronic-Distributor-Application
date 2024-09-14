<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product Category</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<style>
    .error {
        color: red;
        font-size: 0.9em;
    }
    .disabled {
        background-color: gray;
        cursor: not-allowed;
    }
</style>
</head>

<body>

<div class="addcategory">
    <form action="isAddProductCategory" method="get">
        <div class="prod-cont">
            <h1 style="color:white">Add New Product Category</h1>
            <input type="text" id="productCategoryName" placeholder="Enter New Product Category Name" name="productCategoryName" class="form-control form-control-lg" value="">
            <small id="small" class="error"></small>
            <input type="submit" value="Add Category" name="btn" id="vendorbtn" style="margin-bottom:100px">
        </div>
    </form>
</div>

<script>
// Function to validate Product Category Name
function validateProductCategoryName() {
    const productCategoryName = document.getElementById('productCategoryName');
    const small = document.getElementById('small');
    const submitButton = document.getElementById('vendorbtn');
    const productCategoryNameValue = productCategoryName.value;

    // Check for leading or trailing white spaces
    const hasLeadingSpace = productCategoryNameValue.startsWith(' ');
    const hasTrailingSpace = productCategoryNameValue.endsWith(' ');

    if (productCategoryNameValue.length === 0) {
        // Product category name is empty
        small.textContent = 'Product category name cannot be empty.';
        submitButton.disabled = true;
    } else if (hasLeadingSpace || hasTrailingSpace) {
        // Product category name has leading or trailing spaces
        small.textContent = 'Product category name should not start or end with white spaces.';
        submitButton.disabled = true;
    } else {
        // Product category name is valid
        small.textContent = '';
        submitButton.disabled = false;
    }
}

// Attach the validateProductCategoryName function to the keyup event of the product category name field
document.getElementById('productCategoryName').addEventListener('keyup', validateProductCategoryName);
</script>

</body>
</html>
