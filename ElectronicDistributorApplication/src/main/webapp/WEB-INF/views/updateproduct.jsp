<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="electronic.distributor.model.*, org.springframework.beans.factory.annotation.Autowired"%>
<%@ page import="electronic.distributor.service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
    <div class="updateproduct">
      
	<form action="updateaddproductwithdetails" method="post">
 			
 			
                <div class="update-form">
                <input type="hidden" name="productnumber" value="${forupdate.getProductNumber() }">
                 <h1>Update Product Details</h1>
                <div class="row">
				<select name="vendorId" class="form-select">
				<option value="${vendormodel.getVendorModel().getVendorId() }">${forupdate.getVendorModel().getVendorName() }</option>
				
                      <c:forEach var="vendormodel" items="${listofvendor }">
                      <c:if test="${vendormodel.getVendorId() !=forupdate.getVendorModel().getVendorId()}">
					<option value=${ vendormodel.getVendorId()}>${ vendormodel.getVendorName()}</option>
					</c:if>
					</c:forEach>
				</select> <a href="#"><img alt="" src="./resources/images/plus3.png"></a>
				</div>
				
				
					<div class="row">
					<select name="productCategoryId"  class="form-select">
					<option value="${forupdate.getProductCategoryModel().getProductCategoryId() }">${forupdate.getProductCategoryModel().getProductCategoryName() }</option>
					
					<c:forEach var="productcategory" items="${productcategory}" >
					
					<c:if test="${forupdate.getProductCategoryModel().getProductCategoryId() != productcategory.getProductCategoryId()}">
					<option  value=${ productcategory.getProductCategoryId()} >${productcategory.getProductCategoryName() }</option>
					
					</c:if>
					</c:forEach>          
				</select> <a href="#"><img alt="" src="./resources/images/plus3.png"></a>
				</div>
				
				
				<div class="row">
				<select name="productId"  class="form-select">
				<option value="${forupdate.getProductModel().getProductId() }">${forupdate.getProductModel().getProductName() }</option>
					<c:forEach var="product" items="${products}" >
			<c:if test="${forupdate.getProductModel().getProductId() != product.getProductId()}">
					
				<option  value=${ product.getProductId()} >${product.getProductName() }</option>
				
				</c:if>
					</c:forEach>          
				</select> <a href="#"><img alt="" src="./resources/images/plus3.png"></a>
				</div>
				
				<input type="date" name="date" class="update-date" value="${forupdate.getDate() }" placeholder="Select Product Add Date">
				<textarea name="text" class="update-text-area" rows="4" cols="50" >${forupdate.getDetails() }</textarea>
				<input type="submit" value="Update Product" name="btn" class="sbtn">
					
		</div>	
	</form>
	
	<%
  String btn=request.getParameter("btn");
  if(btn!=null){
  %>
  <script type="text/javascript">
        
        var result = "${msg}";
        if (result === "success") {
        	Swal.fire({
 			   title:'Success!',
 			   text:'Product Update Successfully!!',
 			   icon:'success',
 			   confirmButtonText:'Ok'
 			   }).then((result)=>{
				   if(result.isConfirmed){ 
					   window.location.href='viewproduct';
				   }
			   });
        } else if (result === "wrong") {
        	Swal.fire({
		    	  title:'Error!!',
		    	  text:'Failed To Update Product',
		    	  icon:'error',
		    	  confirmButtonText:'Ok'
		    	  
		      });
        }
    </script>
    <%
  }
    %>
	
	
	
</div>

</body>
</html>
