<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	  <style type="text/css">
	  @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");
     
body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  width: 100%;
  padding: 0 10px;
}

body::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background: url('./resources/images/bg-image7.avif');
  background-position: center;
  background-size: cover;
}

.wrapper {
  width: 400px;
  border-radius: 8px;
  padding: 30px;
  text-align: center;
  border: 1px solid rgba(255, 255, 255, 0.5);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(8px);
  
}

form {
  display: flex;
  flex-direction: column;
  margin-top:-50px;
  
 
}

h2 {
  font-size: 2rem;
  margin-bottom: 20px;
  color: #fff;
}

.input-field {
  position: relative;
  border-bottom: 2px solid #ccc;
  margin: 15px 0;
}

.input-field label {
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  color: #fff;
  font-size: 16px;
  pointer-events: none;
  transition: 0.15s ease;
}

.input-field input {
  width: 100%;
  height: 40px;
  background: transparent;
  border: none;
  outline: none;
  font-size: 16px;
  color: #fff;
}

.input-field input:focus~label,
.input-field input:valid~label {
  font-size: 0.8rem;
  top: 10px;
  transform: translateY(-120%);
}

.forget {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin: 25px 0 35px 0;
  color: #fff;
}

#remember {
  accent-color: #fff;
}

.forget label {
  display: flex;
  align-items: center;
}

.forget label p {
  margin-left: 10px;
  margin-top:13px;
}

.wrapper a {
  color: #efefef;
  text-decoration: none;
}

.wrapper a:hover {
  text-decoration: underline;
}

button {
  background: #fff;
  color: #000;
  font-weight: 600;
  border: none;
  padding: 12px 20px;
  cursor: pointer;
  border-radius: 3px;
  font-size: 16px;
  border: 2px solid transparent;
  transition: 0.3s ease;
}

button:hover {
  color: #fff;
  border-color: #fff;
   background: rgba(255, 255, 255, 0.15);
}

.register {
  text-align: center;
  margin-top: 30px;
  color: #fff;
  margin-bottom:20px;
}

#back{
position:relative;
width:40px;
height:40px;
top:460px;
left:140px;

}
#back img{
color:white;
width:100%;
height:100%;
background-color:white;
border-radius: 50%;

}
	  
	  </style>
      
     
<body>
  <div class="wrapper">
    <form action="validlogin">
    <div id="back">
    <a  href="home"><img src="./resources/images/backleft.png"></a>
    </div>
      <h2>Login</h2>
        <div class="input-field">
        <input type="email" name="email" required>
        <label>Enter your email</label>
         <span></span>
      </div>
      <div class="input-field">
        <input type="text" name="password" required onkeyup="checkpass(this.value)">
        <label>Enter your password</label>
        <span  id="passmass"></span>
      </div>
      <div class="forget">
        <label for="remember">
          <input type="checkbox" id="remember">
           <p>Remember me</p>
        </label>
       
        <a href="#">Forgot password?</a>
      </div>
      <input type="submit" name="s" value="Log In">
   
      <div class="register">
        <p>Don't have an account? <a href="register">Register</a></p>
      </div>
    </form>
  

  
  <%
  String btn=request.getParameter("s");
  if(btn!=null){
  %>
  <script type="text/javascript">
        
        var result = "${result}";
       
        if (result == "wrong") {
        	Swal.fire({
 			   title:'Error!',
 			   text:'Failed To Login!!',
 			   icon:'error',
 			   confirmButtonText:'Ok'
 			   });
      
       
        }
       
        </script>
        <%
  }
       %>
</div>
</body>
</html>