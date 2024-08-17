
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Electronic</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./resources/css/style.css">

</head>
<body>
	<div class="header1">
		<div class="headdings">
			<div class="logo">
				<img src="<c:url value="/resources/images/logoGE.png"/>" alt="">
			</div>
			<div class="headding">
				<h3>GADA ELECTRONICS</h3>
			</div>
		</div>
		<div class="menu">
			<ul>
				<li><a id="a" href="#">Home</a></li>
				<li><a id="a" href="#">Orders</a></li>
				<li><a id="a" href="login">Login</a></li>
				<li><a id="a" href="register">Sign In</a></li>

			</ul>
		</div>
	</div>


	<div id="carouselExampleSlidesOnly" class="carousel slide mt-2"
		data-ride="carousel">
		<div class="carousel-inner  ">
		
		<div class="carousel-item active slider ">
				<img id="myimg" class="d-block w-100" src="./resources/images/slider-chroma.webp"
					alt="First slide">
			</div>
			
			<div class="carousel-item slider">
				<img id="myimg" class="d-block w-100" src="./resources/images/washing machine slideer.webp"
					alt="Third slide">
			</div>
		
			<div class="carousel-item slider ">
				<img id="myimg" class="d-block w-100" src="./resources/images/watch2.avif"
					alt="First slide">
			</div>
			<div class="carousel-item slider ">
				<img id="myimg" class="d-block w-100" src="./resources/images/slider8.png"
					alt="Second slide">
			</div>
			
			<div class="carousel-item slider">
				<img id="myimg" class="d-block w-100 " src="./resources/images/slider7.jpg"
					alt="Third slide">
			</div>
			
		</div>
	</div>






	<section class="shop-section">
		<div class="shop-images">
			<div class="shop-link">
				<h3>Shop Laptops &amp; TV</h3>
				<img src="<c:url value="resources/images/Tv.jpeg"/>" alt="card"> <a href="#">See
					More</a>
			</div>
			<div class="shop-link">
				<h3>Shop FANS &amp; AC</h3>
				<img src="./resources/images/Fan.jpeg" alt="card"> <a href="#">See
					More</a>
			</div>
			<div class="shop-link">
				<h3>Shop Refrigerator</h3>
				<img src="./resources/images/Refrigerator.jpeg" alt="card"> <a href="#">See
					More</a>
			</div>
			<div class="shop-link">
				<h3>Washing Machine</h3>
				<img src="./resources/images/Washing Machines.jpeg" alt="card"> <a
					href="#">See More</a>
			</div>

			<div class="shop-link">
				<h3>Mobile's</h3>
				<img src="./resources/images/mobile-image.jpg" alt="card"> <a href="#">See
					More</a>
			</div>

			<div class="shop-link">
				<h3>Air Conditioner</h3>
				<img src="./resources/images/AC.jpeg" alt="card"> <a href="#">See
					More</a>
			</div>


			<div class="shop-link">
				<h3>Ironing</h3>
				<img src="./resources/images/ironing.jpg" alt="card"> <a href="#">See
					More</a>
			</div>
			
			<div class="shop-link">
				<h3>HeadPhone</h3>
				<img src="./resources/images/headphones.webp" alt="card"> <a href="#">See
					More</a>
			</div>


		</div>
	</section>

	<footer>
		<a href="#" class="footer-title">Back to top</a>
		<div class="footer-items">
			<ul>
				<h3>Get to Know Us</h3>
				<li><a href="#">About us</a></li>
				<li><a href="#">Press Release</a></li>
			</ul>
			<ul>
				<h3>Connect with Us</h3>
				<li><a href="#">Facebook</a></li>
				<li><a href="#">Twitter</a></li>
				<li><a href="#">Instagram</a></li>
			</ul>
			<ul>
				<h3>Connect with Us</h3>
				<div class="contact_form">
					<form action="#">
						<div class="field">
							<input type="text" id="Name" placeholder="Your Name" required />
						</div>
						<div class="field">
							<input type="text" id="email" placeholder="Your Email" required />
						</div>
						<div class="field">
							<input type="number" id="number"
								placeholder="Your Contact Number" required />
						</div>
						<div class="field">
							<textarea name="textarea" id="textarea"
								placeholder="Your Message"></textarea>
						</div>

						<button class="button" id="submit">Submit</button>
					</form>
				</div>

			</ul>
			<ul>
				<h3>Let Us Help You</h3>
				<li><a href="#">Your Account</a></li>
				<li><a href="#">Return Centre</a></li>
				<li><a href="#">100% Purchase Protection</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</div>
	</footer>

</body>
</html>
