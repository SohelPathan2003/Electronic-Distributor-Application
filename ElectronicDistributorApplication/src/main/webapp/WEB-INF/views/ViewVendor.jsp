  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<script>
function confirmationDelete(str) {
	
    Swal.fire({
        title: 'Are you sure?',
        text: 'You will not be able to recover this Vendor!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!'
    }).then((result) => {
        if (result.isConfirmed) {
        	Swal.fire(
        	        'Deleted!',
        	        'Vendor has been deleted.',
        	        'success'
        	    ).then((result) => {
        	        if (result.isConfirmed) {
        	            
        	        	 window.location.href = "deletevendor?vid="+str;
        	   }
         });
        	
        } else {
           
            Swal.fire('Cancelled', 'Failed to delete Vendor :)', 'error');
        }
    });
}


 

</script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
	
</head>
<body>
<%@include file="CompanyMaster.jsp" %>
<div class="view-vendor">
	<input type="text" placeholder="Search Vendor" class="input form-control form-control-lg" name="searchv" onkeyup="searchvendor(this.value)">

	
	<div id="searchedtable">
		<table class="table">
			<thead class="thead-dark">
			
				<tr>
					<th scope="col">VendorID</th>
					<th scope="col">Vendor Name</th>
					<th scope="col">Vendor Email</th>
					<th scope="col">Delete</th>
					<th scope="col">Update</th>
				</tr>
				</thead>
			<tbody>
				<%int count=0; %>
				<c:forEach var="s" items="${list}" >
				<tr>
				
				    <td class="text-white" value="${s.getVendorId()}"><%=++count %></td>
				    <td class="text-white">${s.getVendorName()}</td>
				    <td class="text-white">${s.getEmail()}</td>
					<td><a class="text-white" onclick="confirmationDelete(${s.getVendorId()})" href="#">Delete</a></td>
					<td><a class="text-white" href="updatevendor?vid=${ s.getVendorId()}&name=${s.getVendorName()} &email=${s.getEmail()}">Update</a></td>
				</tr>
				</c:forEach>
				
				
			</tbody>
		</table>
		</div>
</div>

	
</div>
</div>
</div>

</body>
</html> 