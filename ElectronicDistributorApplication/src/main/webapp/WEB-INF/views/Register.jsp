<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registration Form </title>
    <link rel="stylesheet" href="./resources/css/signin.css">
    <script src='./resources/js/myjs.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      
   </head>
<body>
  <div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="submitRegistration" method="get">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" name="userName" placeholder="Enter your name" required onkeyup="checkname(this.value)">
          <span id="namemass"> </span>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" name="email" placeholder="Enter your email" required onkeyup="checkemail(this.value)">
            <span id="mailmass"> </span>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" name="contact" placeholder="Enter your number" required onkeyup="checknum(this.value)">
            <span id="nummass"> </span>
          </div>
          <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="address" placeholder="Enter your Address" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" placeholder="Enter your Password" required onkeyup="checkpass(this.value)">
             <span id="passmass"> </span>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" name="confirmPassword" placeholder="ReEnter Password" required>
          </div>
        </div>
        <div class="button">
          <input type="submit" name="r" id="btn" value="Register">
        </div>
      </form>
    </div>
     
  </div>
  
  <%
  String btn=request.getParameter("r");
  if(btn!=null){
  %>
  <script type="text/javascript">
        
        var result = "${msg}";
        if (result === "success") {
        	Swal.fire({
 			   title:'Success!',
 			   text:'Registration Successfully!!',
 			   icon:'success',
 			   confirmButtonText:'Ok'
 			   }).then((result)=>{
				   if(result.isConfirmed){ 
    				   window.location.href='login';
    				   }
    			   });;
        } else if (result === "wrong") {
        	Swal.fire({
		    	  title:'Error!!',
		    	  text:'Failed To Register',
		    	  icon:'error',
		    	  confirmButtonText:'Ok'
		    	  
		      });
        }
    </script>
    <%
  }
    %>

</body>
</html>