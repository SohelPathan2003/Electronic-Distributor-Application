<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monitor Product Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .product-page {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-container {
            display: flex;
            gap: 20px;
            align-items: flex-start;
        }

        .image-section {
            width: 40%;
        }

        .product-image {
            width: 100%;
            height: auto;
            display: block;
        }

        .thumbnail-list {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .thumbnail {
            width: 50px;
            height: auto;
            cursor: pointer;
            border: 1px solid #ddd;
        }

        .product-details {
            width: 60%;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin: 0;
        }

        h5 {
            font-size: 16px;
            color: #666;
            margin: 0;
        }

        .ratings {
            margin: 10px 0;
            font-size: 14px;
            color: #666;
        }

        .rating {
            background-color: #388e3c;
            color: white;
            padding: 3px 5px;
            border-radius: 5px;
            margin-right: 10px;
        }

        .review-count {
            margin-right: 10px;
        }

        .assured {
            background-color: #f0f0f0;
            padding: 2px 5px;
            border-radius: 3px;
        }

        .price-section {
            margin: 20px 0;
        }

        .price {
            font-size: 24px;
            color: #e53935;
            font-weight: bold;
        }

        .discounted-price {
            text-decoration: line-through;
            color: #777;
            margin-right: 10px;
        }

        .discount {
            color: #388e3c;
        }

        .emi {
            font-size: 14px;
            color: #333;
        }

        .stock-status {
            font-size: 24px;
            color: #e53935;
        }

        .stock-message {
            font-size: 14px;
            color: #777;
            margin: 10px 0;
        }

        .warranty {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        .highlight-section ul {
            list-style: none;
            padding: 0;
        }

        .highlight-section li {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }

        .button-container {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }

        .buy-button {
            background-color: #388e3c; /* Green color for Buy button */
        }

        .emi-button {
            background-color: #1976d2; /* Blue color for EMI button */
        }
        
        .back-btn {
            margin-bottom: 0px;
            margin-top:20px;
           
            margin-right:20px;
        }
        #remainingstock{
        color:red;
        font-size:large;
        }
        #stockexceed{
          color:red;
        font-size:large;
        margin-left:30%;
        }
    </style>
</head>
<body onload="discount('${product.stockDetailsModel.quantity}')">

<div class="product-page">
    <div class="product-container">
        <div class="image-section">
        <input type="hidden" value="${product.stockDetailsModel.quantity}" id="stock">
            <img src="${pageContext.request.contextPath}/resources/images/${product.imageURL}" alt="BenQ Monitor" class="product-image">
            <div class="button-container">
            
                       <a href="viewproductforclient?productname=${product.productModel.productName}" class="btn-secondary button ">
                    <i class="fas fa-arrow-left"></i>  Back
                </a>
            <!--  onclick="showPurchaseForm()" -->
                <button  onclick="validuser()" class="button buy-button">Buy Now</button>
                <button  class="button emi-button">Pay with EMI</button>
                
            </div>
        </div>
        
        <div class="product-details">
            <h1>${product.productModel.productName}</h1>
            <h5 class="text-muted">${product.vendorModel.vendorName}</h5>      
            <h1>${product.productCategoryModel.productCategoryName} BenQ GW2490 60.96 cm (24 inch), ${product.details} Full HD LED Backlit IPS Panel</h1>
            
            <div class="ratings">
                <span class="rating">4.4 &#9733;</span>
                <span class="review-count">727 Ratings & 71 Reviews</span>
                <span class="assured">Assured</span>
            </div>
            
            <span id="remainingstock"></span>
           
            
            <div class="price-section">
                <div class="price">&#8377;${product.stockDetailsModel.sellingPrice}</div>
                <input type="hidden" id="sellingprice" value="${product.stockDetailsModel.sellingPrice}">
               
                <div class="discounted-price">&#8377;${product.stockDetailsModel.sellingPrice+300}</div>
                <div class="discount"><span id="discountinpercentage"></span>% off</div>
                <div class="emi">&#8377;<span id="discountforemi"></span>/month</div>
            </div>
            
            <div class="warranty">
                <span>39 Months Warranty</span>
            </div>

            <div class="highlight-section">
                <ul>
                    <li>Panel Type: IPS Panel</li>
                    <li>Screen Resolution Type: Full HD</li>
                    <li>Brightness: 250 nits</li>
                    <li>Response Time: 5 ms, Refresh Rate: 100 Hz</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Purchase Modal -->
<div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog" aria-labelledby="purchaseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="purchaseModalLabel">Complete Your Purchase</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="purchaseForm" action="orderproduct" method="post">
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <div class="input-group">
                        <%
                        int userloginid=0;
                        if(session.getAttribute("userloginid")!=null)
                        userloginid=(int)session.getAttribute("userloginid");
                        %>
                        <input type="hidden" name="userLoginId" value="<%=userloginid%>">
                         <input type="hidden" name="productNumber" value="${product.productNumber}">
                            <div class="input-group-prepend">
                                <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(-1)">-</button>
                            </div>
                            <input type="number" name="quantity" id="quantity" class="form-control" value="1" min="1" onchange="updateAmount()">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(1)">+</button>
                                
                            </div>
                        </div>
                         <span id="stockexceed"></span>
                    </div>
                    <div class="form-group">
                        <label for="amount">Amount:</label>
                        <input value="${product.stockDetailsModel.sellingPrice}" type="text" name="amount" id="amount" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <textarea name="address" id="address" class="form-control" rows="3" required></textarea>
                    </div>
                    <button id="btn" type="submit" class="btn btn-success btn-block">Pay</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
<%-- 

    function discount(quantity){
    	var remainingstock=document.getElementById("remainingstock");
    	if(quantity<=3){
    		
    		remainingstock.innerHTML=" Only "+quantity+" Stocks Are Remaining";
    	}
    	var sellingprice=parseInt(document.getElementById("sellingprice").value);
    	var actualprice=parseInt(sellingprice+300);
    	document.getElementById("discountinpercentage").innerHTML=""+((actualprice-sellingprice)/actualprice)*100;
    	document.getElementById("discountforemi").innerHTML=""+(sellingprice)/5;
    }

      
    
    
    
    
    // redirect user if he is not login 
    <%
    String name=null;
    if(session.getAttribute("user")!=null){
	name=(String)session.getAttribute("user");
    }
	%>
   
   
    function validuser(productNumber){
    	
    	var UserLogin="<%=name%>";
    	if(UserLogin!= "null"){
    		showPurchaseForm();
    		  
    	}else{
    		
    		 window.location.href="loginFirst?productnumber=${product.productNumber}";
    		 }
    }
    
    
    
    
    
    function showPurchaseForm() {
        $('#purchaseModal').modal('show');
    }

    function updateAmount() {
        const quantity = parseInt(document.getElementById('quantity').value, 10);
        const price = parseFloat(document.querySelector('.price').innerText.replace(/[^0-9.-]/g, '')); // Ensure price is fetched correctly
        const total = Math.floor(quantity * price); // Convert to integer
        document.getElementById('amount').value = total; // No need to use toFixed(2) for integer
    }

    if ("${result}" != "null") {
        if ("${result}" == "success") {
            Swal.fire({
                title: 'Success!',
                text: 'Product purchased successfully!',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then(() => {
                $('#purchaseModal').modal('hide');
                document.getElementById('purchaseForm').reset();
            });
        } else {
            Swal.fire({
                title: 'Error!',
                text: 'There was a problem with your purchase. Please try again.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        }
    }

    function changeQuantity(change) {
        const quantityInput = document.getElementById('quantity');
        let currentQuantity = parseInt(quantityInput.value, 10);
        currentQuantity = Math.max(1, currentQuantity + change);
        quantityInput.value = currentQuantity;
        updateAmount();
    }
   
    	 --%>
    	 
    	     function discount(quantity) {
    	         var remainingstock = document.getElementById("remainingstock");
    	         if (quantity <= 3) {
    	             remainingstock.innerHTML = "Only " + quantity + " Stocks Are Remaining";
    	         } else {
    	             remainingstock.innerHTML = ""; // Clear message if stock is more than 3
    	         }
    	         var sellingprice = parseInt(document.getElementById("sellingprice").value);
    	         var actualprice = parseInt(sellingprice + 300);
    	         document.getElementById("discountinpercentage").innerHTML = "" + ((actualprice - sellingprice) / actualprice) * 100;
    	         document.getElementById("discountforemi").innerHTML = "" + (sellingprice) / 5;
    	     }
    	     
    	  // redirect user if he is not login 
    	     <%
    	     String name=null;
    	     if(session.getAttribute("user")!=null){
    	 	name=(String)session.getAttribute("user");
    	     }
    	 	%>

    	     function validuser() {
    	         var UserLogin = "<%=name%>";
    	         if (UserLogin != "null") {
    	             showPurchaseForm();
    	         } else {
    	             window.location.href = "loginFirst?productnumber=${product.productNumber}";
    	         }
    	     }

    	     function showPurchaseForm() {
    	         $('#purchaseModal').modal('show');
    	     }

    	     function updateAmount() {
    	         const quantity = parseInt(document.getElementById('quantity').value, 10);
    	         const stock = parseInt(document.getElementById('stock').value, 10); // Add hidden stock value input
    	         const price = parseFloat(document.querySelector('.price').innerText.replace(/[^0-9.-]/g, '')); // Ensure price is fetched correctly

    	         if (quantity <= 0) {
    	             Swal.fire({
    	                 title: 'Out of Stock',
    	                 text: 'Product is out of stock.',
    	                 icon: 'warning',
    	                 confirmButtonText: 'OK'
    	             });
    	             document.getElementById('quantity').value = 1; // Reset quantity to 1
    	             return;
    	         }

    	         if (quantity > stock) {
    	             Swal.fire({
    	                 title: 'Insufficient Stock',
    	                 text: 'You cannot order more than ' + stock + ' units of this product.',
    	                 icon: 'warning',
    	                 confirmButtonText: 'OK'
    	             });
    	             document.getElementById('quantity').value = stock; // Reset quantity to available stock
    	             return;
    	         }

    	         const total = Math.floor(quantity * price); // Convert to integer
    	         document.getElementById('amount').value = total; // No need to use toFixed(2) for integer
    	     }

    	     if ("${result}" != "null") {
    	         if ("${result}" == "success") {
    	             Swal.fire({
    	                 title: 'Success!',
    	                 text: 'Product purchased successfully!',
    	                 icon: 'success',
    	                 confirmButtonText: 'OK'
    	             }).then(() => {
    	                 $('#purchaseModal').modal('hide');
    	                 document.getElementById('purchaseForm').reset();
    	             });
    	         } else {
    	             Swal.fire({
    	                 title: 'Error!',
    	                 text: 'There was a problem with your purchase. Please try again.',
    	                 icon: 'error',
    	                 confirmButtonText: 'OK'
    	             });
    	         }
    	     }

    	     function changeQuantity(change) {
    	         const quantityInput = document.getElementById('quantity');
    	         const stock = parseInt(document.getElementById('stock').value, 10); // Add hidden stock value input
    	         let currentQuantity = parseInt(quantityInput.value, 10);
    	         currentQuantity = Math.max(1, currentQuantity + change);
    	         if (currentQuantity > stock) {
    	             currentQuantity = stock; // Ensure quantity does not exceed stock
    	             document.getElementById("stockexceed").innerHTML="Not Available";
    	         }else{
    	        	 document.getElementById("stockexceed").innerHTML="";
    	         }
    	         quantityInput.value = currentQuantity;
    	         
    	         updateAmount();
    	     }
    
</script>


</body>
</html>
