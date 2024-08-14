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
<form action="isUpdateVendor" method="get">


<div class="veder-cont">
<input type="text" name="vendorName" class="form-control form-control-lg" value="${name}"onkeyup="isValidvendor(this.value)">
<input type="email"  name="email" class="form-control form-control-lg" value="${email}" onkeyup="isValidvendor(this.value)">
<small id="small"></small>
<input type="submit" value="UPDATE" name="btn" id="vendorbtn" > 
</div>
</form>
</div>



</div></div>
</div>
</body>
</html>