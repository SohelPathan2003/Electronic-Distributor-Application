<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ include file="DashBoard.jsp" %>
<%@ page import="electronic.distributor.model.*" %>
<%@ page import="electronic.distributor.service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Vendor</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f8f9fa;
    }

    .header {
        background-color: #007bff;
        color: white;
        padding: 10px 0;
        text-align: center;
    }

    .VendorPage {
        margin: 20px;
    }

    .veder-cont {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-control-lg {
        margin-bottom: 15px;
    }

    #vendorbtn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    #vendorbtn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .alert {
        margin-top: 20px;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<div class="header">
    <h1>Update Vendor</h1>
</div>

<div class="VendorPage">
    <form action="isUpdateVendor" method="get">
        <div class="veder-cont">
            <input type="hidden" name="vendorId" value="${vid}"> 
            <div class="form-group">
                <label for="vendorName">Vendor Name</label>
                <input type="text" name="vendorName" class="form-control form-control-lg" id="vendorName" value="${name}" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control form-control-lg" id="email" value="${email}" required>
            </div>
            <button type="submit" name="btn" id="vendorbtn" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>
<%
String btn=request.getParameter("btn");
if(btn!=null){
%>

 <script type="text/javascript">
    	   if("${result}"=="success"){ 
    		   Swal.fire({
    			   title:'Success!',
    			   text:'Vendor Updated Successfully!!',
    			   icon:'Success',
    			   confirmButtonText:'Ok'
    			   }).then((result)=>{
    				   if(result.isConfirmed){ 
    					   window.location.href='viewvendor';
    				   }
    			   });
    		   
    	   }
    	   else{
    		      Swal.fire({
    		    	  title:'Error!!',
    		    	  text:'Failed To Update Vendor',
    		    	  icon:'error',
    		    	  confirmButtonText:'Ok'
    		    	  
    		      }).then((result)=>{
   				   if(result.isConfirmed){ 
					   window.location.href='viewvendor';
				   }
			   });
    	   }
    	   
    	
    	</script>
    	
     <%
     }
    %> 

</body>
</html>
