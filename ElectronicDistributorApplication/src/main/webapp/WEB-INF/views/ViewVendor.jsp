  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/myjs.js"></script>
</head>
<body>
<%@include file="CompanyMaster.jsp" %>
	<input type="text" placeholder="Search Vendor" class=" input form-control form-control-lg" name="searchv" onkeyup="searchvendor(this.value)">

	
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
				
				    <td value="${s.getVendorId()}"><%=++count %></td>
				    <td>${s.getVendorName()}</td>
				    <td>${s.getEmail()}</td>
					<td><a class="text-dark" href="deletevendor?vid=${ s.getVendorId()}">Delete</a></td>
					<td><a class="text-dark" href="updatevendor?vid=${ s.getVendorId()}&name=${s.getVendorName()} &email=${s.getEmail()}">Update</a></td>
				</tr>
				</c:forEach>
				
				
			</tbody>
		</table>
		</div>


	
</div>
</div>
</div>

</body>
</html> 