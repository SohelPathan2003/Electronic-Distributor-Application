<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registration Form </title>
    <link rel="stylesheet" href="./resources/css/signin.css">
    <script src='./resources/js/distribution.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <style>
      
      .imageURL  input{
       height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
      }
      .back-btn {
            margin-bottom: 0px;
            margin-top:20px;
            margin-right:20px;
        }
      
      </style>
   </head>
<body>
  <div class="container1">
    <div class="title">Registration</div>
    <div class="content">
      <form action="submitRegistration" method="get">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" name="userName" placeholder="Enter your name" required onkeyup="checkUserName(this.value)">
          <span id="name_message"> </span>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" name="email" placeholder="Enter your email" required onkeyup="checkEmail(this.value)">
            <span id="mail_message"> </span>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" name="contact" placeholder="Enter your number" required onkeyup="checkValidNumber(this.value)">
            <span id="contact_message"> </span>
          </div>
          <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="address" placeholder="Enter your Address" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" id="password" placeholder="Enter your Password" required onkeyup="checkStrongPassword(this.value)">
             <span id="password_message"> </span>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" name="confirmPassword" onkeyup="passwordConfirmation(password.value,this.value)"placeholder="ReEnter Password" required>
            <span id="password_message"></span>
          </div>
          
        </div>
        <div class="input-box">
        <div class="imageURL">
            <span class="details">Image URL</span>
            <input type="text" name="imageURL" placeholder="Enter your ImageURL" required>
            </div>
          </div>
        
         
        <div class="button">
          <input type="submit" name="r" id="btn" value="Register">
          
        </div>
        <div class="text-center">
                       <a href="home" class="btn btn-secondary back-btn">
                    <i class="fas fa-arrow-left"></i>  Back
                </a>
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
    			   });
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