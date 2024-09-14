<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TV Product List</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
    
    .image-section {
    width: 100%;
   
    height: 200px;
    display: flex;
    justify-content: center;
    margin-bottom: 15px;
}

.image-section img {
    width: 100%;
    height: 100%;
 
}

.back-btn {
            margin-bottom: 0px;
            margin-top:20px;
            margin-right:20px;
        }
        
        
       /* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.header1 {
    background-color: #f4f4f4;
    padding: 10px 0;
}

.container {
    width: 80%;
    margin: 0 auto;
}

.header-content {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo img {
    max-height: 50px;
}

h3 {
    margin: 0;
}

.search-bar {
    display: flex;
    align-items: center;
    flex: 1;
    max-width: 500px;
    position: relative;
}

.location-icon, .search-icon {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
}

.location-icon {
    left: 10px;
}

.search-icon {
    right: 0px;
    background: none;
    padding:7.5px 10px;
    border:none;
    cursor: pointer;
    border-radius:10%;
    background-color:orange;
}

.search-icon i{
font-size: 25px;
}

input[type="text"] {
    width: 100%;
    padding: 10px 40px 10px 40px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
}

input[type="text"]::placeholder {
    color: #aaa;
}

.menu a {
    margin: 0 10px;
    text-decoration: none;
    color: #333;
}

.user-info .profile-photo {
    border-radius: 50%;
    max-height: 40px;
}

@media (max-width: 768px) {
    .header-content {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .search-bar {
        width: 100%;
    }

    .search-icon {
        right: 15px;
        
    }
}

        
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
        #pagination {
    margin-top: 20px;
}

#pagination button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    margin: 0 5px;
    cursor: pointer;
}

#pagination button.active {
    background-color: #0056b3;
}

#pagination button:disabled {
    background-color: #ddd;
    cursor: not-allowed;
}
        
    </style>
    
    
</head>
<body>
<div class="header1">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <img src="<c:url value='/resources/images/logoGE.png'/>" alt="GADA ELECTRONICS Logo">
                </div>
                
                <h3>Gada Electronics</h3>
                
                <div class="search-bar">
                    <div class="location-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <input type="text" placeholder="Search for products">
                    <button class="search-icon">
                       <i class="fas fa-search"></i>
                    </button>
                </div>
                
                <div class="menu">
                    <a href="#">Orders</a>
                    <a href="login">Login</a>
                    <a href="register">Sign In</a>
                </div>
               
                <div class="user-info">
                    <%
                    String imageURL = null;
                    if (session.getAttribute("imageURL") != null) {
                        imageURL = (String) session.getAttribute("imageURL"); 
                        %>
                        <a href="userProfile?imageURL=./resources/images/<%= imageURL %>">
                            <img src="./resources/images/<%= imageURL %>" class="profile-photo" alt="User Photo">
                        </a>
                        <%
                    } else {
                        imageURL = "profileicon.jpg";
                        %>
                        <a href="#" onclick="loginfirst()">
                            <img src="./resources/images/<%= imageURL %>" class="profile-photo" alt="User Photo">
                        </a>
                        <% 
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <h1 class="text-center mb-4">${msg } Product List</h1>
        <div class="row">
           
                <c:forEach var="product" items="${productlist}"> 
            <div class="col-md-4 mb-4">
                <div class="card">
                <div class="image-section">
                     <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/${ product.imageURL}">
                     </div> 
                    <div class="card-body">
                        <h5 class="card-title">${product.productModel.productName }</h5>
                        <h6 class="card-subtitle mb-2 text-muted">${product.vendorModel.vendorName }</h6>
                        <p class="card-text">Category : ${product.productCategoryModel.productCategoryName }</p>
                        <p class="card-text">Price: ${product.stockDetailsModel.sellingPrice }</p>
                        <a  href="ViewSpecificProductDetails?productnumber=${product.productNumber}" class="btn btn-danger">View Details</a>
                      
                        
                    </div>
                </div>
            </div>
           </c:forEach>
        </div>
        <div id="pagination" class="text-center mt-4"></div>
        
        <div class="text-center">
                       <a href="home" class="btn btn-secondary mt-5 back-btn">
                    <i class="fas fa-arrow-left"></i>  Back
                </a>
                </div>
   </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
    <footer class="footer mt-5">
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
    
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const productsPerPage = 6; // Number of products per page
        const productList = document.querySelectorAll('.row > .col-md-4'); // All product items
        const totalProducts = productList.length;
        const totalPages = Math.ceil(totalProducts / productsPerPage);
        let currentPage = 1;

        function showPage(page) {
            productList.forEach((item, index) => {
                const start = (page - 1) * productsPerPage;
                const end = start + productsPerPage;
                item.style.display = index >= start && index < end ? 'block' : 'none';
            });
            updatePaginationControls();
        }

        function updatePaginationControls() {
            const pagination = document.getElementById('pagination');
            pagination.innerHTML = '';

            const prevButton = document.createElement('button');
            prevButton.textContent = 'Previous';
            prevButton.disabled = currentPage === 1;
            prevButton.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    showPage(currentPage);
                }
            });
            pagination.appendChild(prevButton);

            for (let i = 1; i <= totalPages; i++) {
                const pageButton = document.createElement('button');
                pageButton.textContent = i;
                pageButton.className = i === currentPage ? 'active' : '';
                pageButton.addEventListener('click', () => {
                    currentPage = i;
                    showPage(currentPage);
                });
                pagination.appendChild(pageButton);
            }

            const nextButton = document.createElement('button');
            nextButton.textContent = 'Next';
            nextButton.disabled = currentPage === totalPages;
            nextButton.addEventListener('click', () => {
                if (currentPage < totalPages) {
                    currentPage++;
                    showPage(currentPage);
                }
            });
            pagination.appendChild(nextButton);
        }

        // Initialize the pagination
        showPage(currentPage);
    });
    </script>

   
</body>
</html>
