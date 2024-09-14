<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electronic</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  
   
    <style>
        /* Header Styles */
        .header1 {
            background-color: #343a40; /* Dark grey color */
            color: #fff;
            height:100px;
            border-bottom: 1px solid #6c757d;
        }
        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .logo img {
            height: 100px;
            margin-left:-30px;
        }
        .menu {
            display: flex;
            gap: 30px;
            align-items: center;
        }
        .menu a {
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            font-size: 20px;
        }
        .menu a:hover {
            color: #e9ecef;
        }
        .user-info {
            display: flex;
            align-items: center;
        }
        .profile-photo {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            object-fit: cover;
            margin-left: 10px;
        }
        .user-name {
            color: #fff;
            margin-left:10px;
            font-size: 20px;
            font-family: 'Arial', sans-serif;
        }
        @media (max-width: 768px) {
            .menu {
                flex-direction: column;
                align-items: flex-start;
                width: 100%;
                margin-top: 10px;
            }
            .header-content {
                flex-direction: column;
                align-items: flex-start;
            }
            .user-info {
                margin-top: 10px;
            }
        }
        /* Carousel Styles */
        .carousel-item img {
            width: 100%;
            height: auto;
        }
        .slider-div {
            height: 450px;
            width: 100%;
        }
        .slider-div img {
            width: 100%;
            height: 100%;
        }
        /* Shop Section Styles */
        .shop-section {
            padding: 20px;
        }
        .shop-images {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .shop-link {
            flex: 1 1 calc(25% - 15px); /* 4 items per row */
            box-sizing: border-box;
            text-align: center;
        }
        .shop-link img {
            width: 100%;
            height: 100%; /* Fixed height for uniformity */
            border-radius: 5px;
        }
        /* Footer Styles */
        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px;
        }
        .footer-title {
            display: block;
            color: #fff;
            text-align: center;
            margin-bottom: 15px;
            text-decoration: none;
        }
        .footer-items {
            display: flex;
            flex-wrap: wrap;
            gap: 180px;
        }
        .footer-items ul {
            list-style: none;
            padding: 0;
            margin: 0;
            flex: 1 1 200px; /* Adjust the size to fit in mobile view */
        }
        .footer-items h3 {
            margin-bottom: 5px;
        }
        .footer-items li {
            margin-bottom: 5px;
        }
        .footer-items a {
            color: #adb5bd;
            text-decoration: none;
        }
        .footer-items a:hover {
            color: #fff;
            text-decoration: none;
        }
        .contact_form .field {
            margin-bottom: 12px;
        }
        .contact_form input, .contact_form textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .contact_form button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px;
            border-radius: 5px;
            cursor: pointer;
        }
        .contact_form button:hover {
            background-color: #0056b3;
        }
        .social-links img {
            width: 24px;
            height: 24px;
            margin-right: 10px;
        }
        #myimg {
            width: 100%;
            height: 100%;
        }
        
        .shop-section {
  display: flex;
  align-items: center;
  flex-direction: column;
  background-color: #f3f3f3;
  padding: 50px 0;
}

.shop-images {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 40px;
  max-width: 1280px;
  width: 100%;
}

.shop-link {
  background-color: #fff;
  padding: 30px;
  display: flex;
  cursor: pointer;
  flex-direction: column;
  white-space: nowrap;
}


.shop-link img {
  width: 100%;
  height: 100%;
 
  margin-bottom: 10px;
  transition:transform 0.3s ease;
}
.shop-link img:hover{
	
	transform:scale(1.2);
	border-radius:10%;
}

.shop-link h3 {
  margin-bottom: 30px;
}

.shop-link a {
  display: inline-block;
  margin-top: 20px;
  font-size: 0.9rem;
  color: blue;
  font-weight: 500;
  transition: color 0.3s ease;
}

.shop-link:hover a {
  color: #c7511f;
  text-decoration: underline;
}
    </style>
    
    <script type="text/javascript">
    function loginfirst(){
    	
    	alert("Should be login first");
    }
    
    function ConfirmLogout(loginid){
    	
    	if(loginid!=0){
    	 Swal.fire({
    	        title: 'Are you sure?',
    	        text: 'You will not be able to Buy!',
    	        icon: 'warning',
    	        showCancelButton: true,
    	        confirmButtonColor: '#DD6B55',
    	        cancelButtonColor: '#3085d6',
    	        confirmButtonText: 'Yes, Logout!',
    	        cancelButtonText: 'No, cancel!'
    	    }).then((result) => {
    	        if (result.isConfirmed) {
    	            Swal.fire(
    	                'Logout!',
    	                'Logout Successfully.',
    	                'success'
    	            ).then((result) => {
    	                if (result.isConfirmed) {
    	                    window.location.href = "userlogout";
    	                }
    	            });
    	        } else {
    	            Swal.fire('Cancelled', 'Failed to Logout :)', 'error');
    	        }
    	    });
    	}else{
    		
    		 Swal.fire({
    		        title: 'Not Logged In',
    		        text: 'You need to be logged in to perform this action.',
    		        icon: 'warning',
    		        confirmButtonText: 'Okay'
    		      });
    	}

    }
    </script>
</head>
<body>
    <div class="header1">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <img src="<c:url value='/resources/images/logoGE.png'/>" alt="GADA ELECTRONICS Logo">
                </div>
                <h3>Gada Electronics</h3>
                <div class="menu">
                    <a href="#">Home</a>
                    <a href="userorderhistory">Orders</a>
                    <a href="#">Help</a> 
                    <a href="login">Login</a>
                    <a href="register">Sign In</a>
                    
                    <%
                    int userid=0;
                    if(session.getAttribute("imageURL")!=null){ 
                    	userid=(int)session.getAttribute("userloginid");
                    }
                    %>
                    <a href="#" onclick="ConfirmLogout(<%=userid%>)">Logout</a>
                   
                </div>
                
                <div class="user-info">
                  <%
                  String imageURL=null;
                 
                  
                  if(session.getAttribute("imageURL")!=null){
                	  imageURL=(String)session.getAttribute("imageURL"); 
                	  userid=(int)session.getAttribute("userloginid");
                	  %>
                	   <a href="userProfile?imageURL=./resources/images/<%=imageURL %>"><img src="./resources/images/<%=imageURL %>" class="profile-photo" alt="User Photo"></a>
          
                	  <%
                  }else{
                	  imageURL="profileicon.jpg";
                	  %>
                	   <a href="#" onclick="loginfirst()"><img src="./resources/images/<%=imageURL %>" class="profile-photo" alt="User Photo"></a>
          
                	  <% 
                  }
                
                 
                  %>
                            
                </div>
            </div>
        </div>
    </div>

    <div id="carouselExampleSlidesOnly" class="carousel slide mt-2" data-ride="carousel">
        <div class="carousel-inner slider-div">
            <div class="carousel-item active slider-div">
                <img class="d-block w-100" src="./resources/images/slider-chroma.webp" alt="First slide">
            </div>
            <div class="carousel-item slider-div">
                <img class="d-block w-100" src="./resources/images/washing machine slideer.webp" alt="Second slide">
            </div>
            <div class="carousel-item slider-div">
                <img class="d-block w-100" src="./resources/images/watch2.avif" alt="Third slide">
            </div>
            <div class="carousel-item slider-div">
                <img class="d-block w-100" src="./resources/images/slider8.png" alt="Fourth slide">
            </div>
            <div class="carousel-item slider-div">
                <img class="d-block w-100" src="./resources/images/slider7.jpg" alt="Fifth slide">
            </div>
        </div>
    </div>

    <section class="shop-section">
        <div class="shop-images">
            <div class="shop-link">
                <h3>Shop TV</h3>
                <img id="myimg" src="<c:url value='/resources/images/Tv.jpeg'/>" alt="Laptops & TV">
                <a href="viewproductforclient?productname=TV">See More</a>
            </div>
            <div class="shop-link">
                <h3>Shop FANS</h3>
                <img id="myimg" src="./resources/images/Fan.jpeg" alt="Fans">
                <a href="viewproductforclient?productname=Fan">See More</a>
            </div>
            <div class="shop-link">
                <h3>Shop Refrigerator</h3>
                <img id="myimg" src="./resources/images/Refrigerator.jpeg" alt="Refrigerator">
                <a href="viewproductforclient?productname=Refrigerator">See More</a>
            </div>
            <div class="shop-link">
                <h3>Washing Machine</h3>
                <img id="myimg" src="./resources/images/Washing Machines.jpeg" alt="Washing Machine">
                <a href="viewproductforclient?productname=Washing-Machine">See More</a>
            </div>
            <div class="shop-link">
                <h3>Mobiles</h3>
                <img id="myimg" src="./resources/images/mobile-image.jpg" alt="Mobiles">
                <a href="viewproductforclient?productname=Mobile">See More</a>
            </div>
            <div class="shop-link">
                <h3>Air Conditioner</h3>
                <img id="myimg" src="./resources/images/AC.jpeg" alt="Air Conditioner">
                <a href="viewproductforclient?productname=Air-Conditioner">See More</a>
            </div>
            <div class="shop-link">
                <h3>Laptops</h3>
                <img id="myimg" src="./resources/images/laptop5.jpg" alt="Laptop">
                <a href="viewproductforclient?productname=Laptop">See More</a>
            </div>
            <div class="shop-link">
                <h3>Headphones</h3>
                <img id="myimg" src="./resources/images/headphones.webp" alt="Headphones">
                <a href="viewproductforclient?productname=HearPhones">See More</a>
            </div>
        </div>
    </section>

    <footer class="footer">
        <a href="#" class="footer-title">Back to top</a>
        <div class="footer-items">
            <div class="social-links">
            <h3>Follow Us</h3>
                <a href="https://www.facebook.com" target="_blank">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook Logo">
                </a>
                <a href="https://www.instagram.com" target="_blank">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png" alt="Instagram Logo">
                </a>
                <a href="https://www.google.com" target="_blank">
                    <img src="./resources/images/google_icon.png" alt="Google Logo">
                </a>
                <a href="https://www.twitter.com" target="_blank">
                    <img src="./resources/images/twitter.png" alt="Google Logo">
                </a>
            </div>
            <div>
             <ul>
                    <h3>Let Us Help You</h3>
                    <li><a href="#">Your Account</a></li>
                    <li><a href="#">Return Centre</a></li>
                    <li><a href="#">100% Purchase Protection</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
                </div>
            <div class="footer-section">
           
                <ul>
                    <h3>Contact Us</h3>
                    <div class="contact_form">
                        <form action="#">
                            <div class="field">
                                <input type="text" id="Name" placeholder="Your Name" required>
                            </div>
                            <div class="field">
                                <input type="email" id="email" placeholder="Your Email" required>
                            </div>
                            
                            <div class="field">
                                <textarea id="textarea" placeholder="Your Message"></textarea>
                            </div>
                            <button class="button" id="submit">Submit</button>
                        </form>
                    </div>
                    
                </ul>
                
            </div>
            <div>
             <ul>
                   <h3>Get to Know Us</h3>
                   <li><a href="#">About us</a></li>
                   <li><a href="#">Press Release</a></li>
                </ul>
                </div>
        </div>
    </footer>
</body>
</html>
