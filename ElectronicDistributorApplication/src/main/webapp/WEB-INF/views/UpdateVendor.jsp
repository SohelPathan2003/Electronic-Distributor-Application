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
    	   if("${result}"=="success"){ 
    		   Swal.fire({
    			   title:'Success!',
    			   text:'Vendor Updated Successfully!!',
    			   icon:'Success',
    			   confirmButtonText:'Ok'
    			   }).then((result)=>{
    				   if(result.isConfirmed){ 
    					   window.location.href='ViewVendor';
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
					   window.location.href='ViewVendor';
				   }
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
<input type="hidden" name="vendorId" value="${vid }"> 
<input type="text" name="vendorName" class="form-control form-control-lg" value="${name}">
<input type="email"  name="email" class="form-control form-control-lg" value="${email}" >
<small id="small"></small>
<input type="submit" value="UPDATE" name="btn" id="vendorbtn" > 
</div>
</form>
</div>



</div></div>
</div>
</body>
</html>