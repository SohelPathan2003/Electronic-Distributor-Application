 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
    <%@include file="DashBoard.jsp" %>
      <%@page import="electronic.distributor.model.* "%>
     <%@page import ="electronic.distributor.service.*" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


 <%
String btn=request.getParameter("btn");
if(btn!=null){
%>

 <script type="text/javascript">
    	   if("${msg}"=="success"){ 
    		   Swal.fire({
    			   title:'Success!',
    			   text:'Vendor Added Successfully!!',
    			   icon:'Success',
    			   confirmButtonText:'Ok'
    			   });
    		   
    	   }
    	   else{
    		      Swal.fire({
    		    	  title:'Error!!',
    		    	  text:'Failed To Add Vendor',
    		    	  icon:'error',
    		    	  confirmButtonText:'Ok'
    		    	  
    		      });
    	   }
    	   
    	
    	</script>
    	
     <%
     }
    %> 
 
 <style>
 
.VendorPage{
	width:100%;
	height:100%;
	
	display:flex;
	flex-direction:column;
	margin-right:200px;
	justify-content:space-around;
	align-items:center;
 background-image:url('./resources/images/login2.jfif');
 background-repeat:no-repeat;
 background-size:cover;
}

.VendorPage .veder-cont{
	height:480px;
	margin:10px 0px;
	width:600px;
	display:flex;
	flex-direction:column;
	justify-content:space-around;
	align-items:center;
	border-bottom-color: red;
	padding:20px;
	border-radius:10%;
	 border: 1px solid rgba(200, 255, 255, 0.5);
	 backdrop-filter: blur(0px);
  -webkit-backdrop-filter: blur(8px);
  box-shadow:0px 1px white;
	
	
	
}
.VendorPage input{
	width:400px;
	padding:10px;	
}
.VendorPage input[type=submit]{
	width:15em;
	padding:10px;
	background-color:orange;
	border:2px solid white;
	box-shadow: 2px 2px orange;
	color:white;
    font-size: 23px;
    border-left: none;
	border-right: none;
    
}
.VendorPage input[type=submit]:hover{
	background-color:maroon;
	color:white;
	box-shadow: 2px 2px maroon;
	border:none;
	margin-top:2.5px;
}
.input{
	
	margin:20px 0px;
	width:70%;
}

.imageheader{
width:100%;
height:23em;

}

.veder-cont h3{
font-family: serif;
}

.imageheader img{
width:100%;
height:100%;
}
</style>
</head>
<body>
<div class="VendorPage mx-0 mt-0 mp-0 my-0">
<div class="imageheader">
<img src="./resources/images/newslider.jpg">
</div>
<form action="isAddVendor" method="get">

<div class="veder-cont">
<h3>Vendor Add</h3>
<input type="text" class="form-control" value="" name="vendorName" placeholder="Enter Vendor Name" required>
<input type="email" class="form-control" value="" name="email" placeholder="Enter Your Mail"  required>
<input type="Number" class="form-control" value="" name="contact" placeholder="Enter Your Contact" required>
<input type="text" class="form-control" value="" name="address" placeholder="Enter Vendor City" required>
<small id="small"></small>
<input type="submit" value="Submit" name="btn" id="vendorbtn" class="btn btn-primary" > 
</div>
</form>
</div>


   </div>
 </main>

</body>
</html> 



