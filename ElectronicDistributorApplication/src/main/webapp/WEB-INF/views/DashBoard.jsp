<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
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
<script type="text/javascript" src="./resources/js/distribution.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">

<style>


#sidebar {
    height: 100vh;
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 100;
    color:white;
    background-color: white;
    padding-top: 1rem;
    filter: brightness(1.5); 
           
    
  
}
.adminname{
height:10vh;
width:100%;
border:2px solid white;
display:flex;
justify-content: center;
align-items:center;
}
.nav-item {
    margin-bottom: 3rem;
     
}

.dropdown-menu {
    background-color: #f8f9fa;
 
}

.myhover:hover{
background-color: #333; 
            box-shadow: 0 8px 16px rgba(0, 0, 0, 1); 
            filter: brightness(1.2); 
           
}
.myborder{
width:100%;
height:15vh;
border:2px solid white;
}

@media (max-width: 767.98px) {
    #sidebar {
        position: relative;
        height: auto;
        width: 100%;
    }
    
    

    .dashboard {
        margin-left: 0;
    }
    
    .nav-item{
     width:100%;
     height:
    }
}


 .position-sticky .profile-photo {
            border-radius: 50%;
            width: 70px;
            height: 70px;
            margin-left: 100px;
        }
</style>

</head>
<body>


<div class="container-fluid">

    <div class="row">
        <nav id="sidebar" class="col-md-3 col-lg-3 d-md-block bg-dark sidebar mx-0 mt-0 mp-0 my-0">
        
            <div class="position-sticky">
             <%
String imageURL;
imageURL=(String)session.getAttribute("imageURL");
int adminid=(int)session.getAttribute("userloginid");
%>
 <a href="adminprofile?adminid=<%=adminid %>"><img src="./resources/images/<%=imageURL %>" class="profile-photo" alt="User Photo"></a>
            <%
		String username=(String)session.getAttribute("user");
			%>
                <div class="">
                    <h1><%= username %></h1>
                </div>
                

                <ul class="nav flex-column">
                    <li class="nav-item dropdown myborder myhover">
                        <a class="nav-link dropdown-toggle text-white poppins-semibold-italic" href="#" id="vendorMasterDropdown" role="button" data-toggle="dropdown" >
                            Vendor Master
                        </a>
                        <div class="dropdown-menu" aria-labelledby="vendorMasterDropdown">
                            <a class="dropdown-item" href="addvendor">Add Vendor</a>
                            <a class="dropdown-item" href="viewvendor">View Vendor</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown myborder myhover">
                        <a class="nav-link dropdown-toggle text-white poppins-semibold-italic" href="#" id="productMasterDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Product Master
                        </a>
                        <div class="dropdown-menu" aria-labelledby="productMasterDropdown">
                         <a class="dropdown-item" href="products">Add Product</a>
                            <a class="dropdown-item" href="viewproduct">View Product</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown myborder myhover">
                        <a class="nav-link dropdown-toggle text-white poppins-semibold-italic" href="#" id="subAdminMasterDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Product Details
                        </a>
                        <div class="dropdown-menu" aria-labelledby="subAdminMasterDropdown">
                            <a class="dropdown-item" href="orderproducts">Order Product</a>
                            <a class="dropdown-item" href="#">Report</a>
                        </div>
                    </li>
                </ul>
            </div>
            <a href="userlogout">logout</a>
        </nav>

        </div>
        </div>   
       
        <main role="main" class="col-md-9 ml-sm-auto col-lg-9 m-0 p-0">
            <div class="mx-0 my-0">
                <!-- Your dashboard content goes here -->
            
          
</body>
</html>
