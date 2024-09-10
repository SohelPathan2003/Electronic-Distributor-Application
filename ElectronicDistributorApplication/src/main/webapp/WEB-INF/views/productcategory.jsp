<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
</head>

<body>

 <div class="addcategory">
<form action="isAddProductCategory" method="get">


<div class="prod-cont">
<h1 style="color:white">Add New Product Category</h1>
<input type="text" placeholder="Enter New Product Category Name" name="productCategoryName" class="form-control form-control-lg" value="">
<small id="small"></small>
<input type="submit" value="Add Category" name="btn" id="vendorbtn" style="margin-bottom:100px" > 
</div>
</form>
</div>
</body>
</html>