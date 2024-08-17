<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Electronic Distributor</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./resources/js/myjs.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
	
</head>
<body>

	<div class="container1 mt-0">


		<div class="sidebar">
		<%
		String username=(String)session.getAttribute("user");
		%>
           
			<div class="admindiv poppins-semibold-italic  ">
				<h1 id="adminname">Welcome <%=username %></h1>
			</div>

			<div class="menu-content">
				<ul class="menu-items">

					<li class="item poppins-semibold-italic"><a
						href="CompanyMaster">Vendor Master</a></li>
					<li class="item poppins-semibold-italic"><a href="productmaster">Product
							Master</a></li>

					<li class="item poppins-semibold-italic"><a href="Add-Subadmin">Sub-Admin
							Master</a></li>

				</ul>
			</div>
		</div>



		<div class="dashboard">
		
		
</body>
</html>