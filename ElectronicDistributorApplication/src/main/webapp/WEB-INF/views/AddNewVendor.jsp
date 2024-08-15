<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="CompanyMaster.jsp" %>
      <%@page import="electronic.distributor.model.* "%>
     <%@page import ="electronic.distributor.service.*" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Insert title here</title>


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
 
</head>
<body>
<div class="VendorPage">
<form action="isAddVendor" method="get">

<div class="veder-cont">
<input type="text" value="" name="vendorName" placeholder="Enter Vendor Name">
<input type="email" value="" name="email" placeholder="Enter Your Mail">
<input type="Number" value="" name="contact" placeholder="Enter Your Contact">
<input type="text" value="" name="address" placeholder="Enter Vendor City">
<small id="small"></small>
<input type="submit" value="Submit" name="btn" id="vendorbtn" > 
</div>
</form>
</div>



</div></div>
</div>
</body>
</html>