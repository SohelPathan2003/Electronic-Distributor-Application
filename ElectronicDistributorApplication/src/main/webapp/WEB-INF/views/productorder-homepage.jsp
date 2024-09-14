<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="DashBoard.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Catalog</title>
<style>
.my-image {
	height: 200px;
}

.my-image img {
	padding: 12px;
	width: 100%;
	height: 100%;
	border-radius: 5%;
}

.card {
	margin-bottom: 20px;
	transition: transform 0.3s ease;
	background-color: #fff;
}

.card:hover {
	transform: scale(1.02);
	box-shadow: 0px 0px 5px 0px silver;
	background-color: #f8f9fa;
}

.card-body {
	background-color: #fff;
}

.my-btn {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	width: 100%;
	height: 100%;
}

.my-btn a {
	padding: 0.5rem;
	text-decoration: none;
	color: #fff;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.my-btn a.my-bg1 {
	background-color: rgb(0, 120, 255);
}

.my-btn a.my-bg2 {
	background-color: rgb(50, 150, 100);
}

.my-btn a.my-bg1:hover {
	background-color: rgb(50, 150, 200);
}

.my-btn a.my-bg2:hover {
	background-color: rgb(80, 150, 180);
}

/* Popup Form Styles */
.popup {
	display: none;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	padding: 20px;
	border: 1px solid #ccc;
	background: linear-gradient(to bottom right, #ffffff, #f0f4f7);
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
	z-index: 1000;
	border-radius: 8px;
}


.popupForViewDetails {
	display: none;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height:600px;
	padding: 20px;
	border: 1px solid #ccc;
	background-color:white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
	z-index: 1000;
	border-radius: 8px;
	overflow:auto;
}


.overlay {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 500;
}

.popup h3 {
	margin-top: 0;
}

.popup label {
	display: block;
	margin-bottom: 5px;
}

.popup input {
	width: calc(100% - 20px);
	margin-bottom: 15px;
	padding: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
}

.popup button {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 15px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-right: 10px;
}

.btn{
background-color: red;
	color: #fff;
	width:100%;
	border: none;
	border-radius: 5px;
	padding: 10px 15px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin:10px;
	
	
}

.popup button:hover {
	background-color: #0056b3;
}

.popup button.cancel {
	background-color: #6c757d;
}

.popup button.cancel:hover {
	background-color: #5a6268;
}

.popup-content {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.image-section {
    width: 100%;
    max-width: 300px; /* Increase as needed */
    height: auto;
    display: flex;
    justify-content: center;
    margin-bottom: 15px;
}

.image-section img {
    width: 100%;
    height: 100%;
    /* Adjust as needed for height */
    object-fit: cover; /* Ensure the image covers the section nicely */
    border-radius: 8px;
}

.details-section {
    margin-top: 15px;
    text-align: center;
}

.details-section p {
    margin: 10px 0;
}
.details-section table {
        width: 100%;
        border-collapse: collapse;
    }

    .details-section td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .popup, .popupForViewDetails {
            width: 90%;
            padding: 15px;
        }

        .image-section {
            max-width: 100%;
        }

        .image-section img {
            max-height: 300px; /* Adjusted height for smaller screens */
        }
    }


</style>



<script>
   function showorder(str){
	   alert(str);
   }
   
   
   </script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
	<div class="container">
		<h2 class="my-4">Product Catalog</h2>


		<c:if test="${not empty products}">
			<div class="row" style="width: 100%; height: 100%;">

				<c:forEach var="product" items="${products}">
					<div class="col-md-4 col-sm-6 mb-4">
						<div class="card">

							<div class="my-image">
								<img
									src="${pageContext.request.contextPath}/resources/images/${product.imageURL}"
									alt="${product.vendorModel.vendorName}">

							</div>
							<div class="card-body">
								<h5 class="card-text">Product Name:
									${product.productModel.productName}</h5>
								<p class="card-text">Product Category :
									${product.productCategoryModel.productCategoryName}</p>
								<p class="card-title">Vendor Name:
									${product.vendorModel.vendorName}</p>
								<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

								<c:choose>
									<c:when test="${product.stockDetailsModel != null}">
										<p class="card-text">Stock:
											${product.stockDetailsModel.quantity}</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">Stock: 0</p>
									</c:otherwise>
								</c:choose>

								<div class="my-btn">
									<c:choose>
										<c:when test="${product.stockDetailsModel != null}">
											<a href="#"
												onclick="showPopup('${product.productNumber}','${product.stockDetailsModel.costPrice }','${product.stockDetailsModel.sellingPrice }')"
												class="my-bg1">Add Stock</a>
										</c:when>
										<c:otherwise>
											<a href="#"
												onclick="showPopup('${product.productNumber}','','')"
												class="my-bg1">Add Stock</a>
										</c:otherwise>
									</c:choose>
									<a href="#" onclick="ViewDetails('${product.vendorModel.vendorName }','${product.productModel.productName }','${product.productCategoryModel.productCategoryName }','${product.date }','${product.details }','${product.stockDetailsModel.costPrice }','${product.stockDetailsModel.sellingPrice }','${product.imageURL }')" class="my-bg2">View Details</a>
								</div>
							</div>
						</div>
					</div>
					
				</c:forEach>


				
				<!-- Popup Form -->
				<div id="popupForm" class="popup">
					<h3>Enter Stock Details</h3>
					<form id="stockForm">

						<input type="hidden" id="produtnumber" value=""><br>
						<br> <label for="quantity">Quantity:</label> <input
							type="number" id="quantity" name="quantity" required><br>
						<br> <label for="costPrice">Cost Price:</label> <input
							type="number" step="0.01" id="costPrice" name="costPrice"
							required><br>
						<br> <label for="sellingPrice">Selling Price:</label> <input
							type="number" step="0.01" id="sellingPrice" name="sellingPrice"
							required><br>
						<br>
						<button type="button"
							onclick="submitForm(quantity.value,costPrice.value,sellingPrice.value,produtnumber.value)">Submit</button>
						<button type="button" onclick="hidePopup()">Cancel</button>
					</form>
				</div>
			
				
				
				<!-- View Details Popup Form -->
<div id="ViewDetailsForm" class="popupForViewDetails">
    <h3>Product Details</h3>
    <div class="popup-content">
        <div class="image-section">
            <img src="" alt="Product Image" id="img">
        </div>
        <div class="details-section">
        <table>
            <tr><td><p><strong>Product Name:</strong> </td><td><span id="productName"></span></p></td></tr>
            <tr><td><p><strong>Product Category:</strong></td><td> <span id="productCategory"></span></p></td></tr>
            <tr><td><p><strong>Vendor Name:</strong></td><td> <span id="vendorName"></span></p></td></tr>
            <tr><td><p><strong>Features :</strong></td><td> <span id="feature"></span></p></td></tr>
            <tr><td><p><strong>Cost Price:</strong> </td><td><span id="costPrice2"></span></p></td></tr>
            <tr><td><p><strong>Price:</strong></td><td> <span id="sellingPrice2"></span></p></td></tr>
            <tr><td><p><strong>Joining Date:</strong> </td><td> <span id="date"></span></p></td></tr>
            </table>
           
        </div>
        <button type="button" class="btn" onclick="hidePopup2()">OK</button>
    </div>
</div>
<div id="overlay" class="overlay" onclick="hidePopup()"></div>
				

				<script>
    
				function showPopup(productnumber,costprice,sellingprice) {
			    	document.getElementById('costPrice').value=costprice;
			        document.getElementById('sellingPrice').value=sellingprice;
			        document.getElementById('popupForm').style.display = 'block';
			        document.getElementById('overlay').style.display = 'block';
			        document.getElementById('produtnumber').value=" "+productnumber;
			    }
			    
			    function hidePopup() {
			        document.getElementById('popupForm').style.display = 'none';
			        document.getElementById('overlay').style.display = 'none';
			    }
			    
    function ViewDetails(vendorName,productName,categoryName,date,feature,costPrice,sellingPrice,imageURL) {
    	 var img=document.getElementById("img").src="${pageContext.request.contextPath}/resources/images/"+imageURL; 
    	document.getElementById("productName").innerHTML=productName;
    	document.getElementById("productCategory").innerHTML=categoryName;
    	document.getElementById("vendorName").innerHTML=vendorName;
    	document.getElementById("feature").innerHTML=feature;
    	document.getElementById("costPrice2").innerHTML=""+costPrice;
    	document.getElementById("sellingPrice2").innerHTML=""+sellingPrice;
    	document.getElementById("date").innerHTML=date;
    	document.getElementById('ViewDetailsForm').style.display = 'block';
        document.getElementById('overlay').style.display = 'block' ;
        
    }
    function hidePopup2() {
        document.getElementById('ViewDetailsForm').style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
    }
 
    

    function submitForm(quantity,costPrice,sellingPrice,productnumber) {
    	
        var form = document.getElementById('stockForm');
        var formData = new FormData(form);
        var xhr = new XMLHttpRequest();
      
        xhr.open('POST', "addStock?quantity="+quantity+"&costPrice="+costPrice+" &sellingPrice="+sellingPrice+"&productnumber="+productnumber, true);
        xhr.onload = function () {
            if (xhr.status === 200) {
            	 Swal.fire({
            		   position: "top-end",
            		   icon: "success",
            		   title: "Stock Added Successfuly",
            		   showConfirmButton: false,
            		   timer: 1500
            		 }).then(()=>{
      				  
        				   window.location="orderproducts";
        				   });
            } else {
            	Swal.fire({
         		   position: "top-end",
         		   icon: "Failure",
         		   title: "Some Problem is there",
         		   showConfirmButton: false,
         		   timer: 1500
         		 }).then(()=>{
     				  
  				   window.location="orderproducts";
  				   });
            }
            hidePopup();
        };
        xhr.onerror = function () {
            console.error('Request failed.');
            alert('Failed to submit data. Please check the console for details.');
            hidePopup();
        };
        xhr.send(formData);
    }
</script>




			</div>
		</c:if>
	</div>


	<c:if test="${empty products}">
		<div class="alert alert-warning" role="alert">No products
			available at the moment.</div>
	</c:if>

	</div>
	</main>
</body>
</html>
