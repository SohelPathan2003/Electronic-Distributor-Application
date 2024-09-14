<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product Name</title>
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
    <form action="isAddProductName" method="get">
        <div class="prod-cont">
            <h1 style="color:white">Add New Product Name</h1>
            <input type="text" id="productName" placeholder="Enter New Product Name" name="productName" class="form-control form-control-lg" value="">
            <small id="small" class="error"></small>
            <input type="submit" value="Add Name" name="btn" id="vendorbtn" style="margin-bottom:100px">
        </div>
    </form>
</div>

<script>
// Function to validate Product Name
function validateProductName() {
    const productName = document.getElementById('productName');
    const small = document.getElementById('small');
    const submitButton = document.getElementById('vendorbtn');
    const productNameValue = productName.value;

    // Check for leading or trailing white spaces
    const hasLeadingSpace = productNameValue.startsWith(' ');
    const hasTrailingSpace = productNameValue.endsWith(' ');

    if (productNameValue.length === 0) {
        // Product name is empty
        small.textContent = 'Product name cannot be empty.';
        submitButton.disabled = true;
    } else if (hasLeadingSpace || hasTrailingSpace) {
        // Product name has leading or trailing spaces
        small.textContent = 'Product name should not start or end with white spaces.';
        submitButton.disabled = true;
    } else {
        // Product name is valid
        small.textContent = '';
        submitButton.disabled = false;
    }
}

// Attach the validateProductName function to the keyup event of the product name field
document.getElementById('productName').addEventListener('keyup', validateProductName);
</script>

</body>
</html>
