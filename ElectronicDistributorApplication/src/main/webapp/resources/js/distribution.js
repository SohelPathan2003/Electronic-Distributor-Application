
function isValidvendor(vendorname) {
	let small = document.getElementById("small");
	let vendorbtn = document.getElementById("vendorbtn");
	var regexp = /^[a-zA-Z]+$/;
	let result = regexp.test(vendorname);
	if (vendorname.length == 0) {

		small.innerHTML = " ";
		vendorbtn.disabled = false;
	} else {
		if (result == false) {
			small.innerHTML = "invalid username";
			vendorbtn.style.backgroundColor = 'blue';
			vendorbtn.disabled = true;

		}
		else {
			small.innerHTML = " ";
			vendorbtn.disabled = false;



		}
	}
}





function searchvendor(vendorname) {
	
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		 
		if (this.readyState == 4 && this.status == 200) {
			let str="";
			let jasonobject=JSON.parse(this.responseText);
			str+="<table class='table text-white table-bordered'>";
			str+="<thead>";
			str+="<tr>";
			str+="<th scope='col'>VendorID</th>";
			str+="<th scope='col'>Vendor Name</th>";
			str+="<th scope='col'>Vendor Email</th>";
			str+="<th scope='col'>Delete</th>";
			str+="<th scope='col'>Update</th>";
			str+="</tr>";
			str+="</thead>";
			str+="<tbody>";
			for(let i=0;i<jasonobject.length;i++){
				str+="<tr>";
				str+="<td class='text-white'>"+(i+1)+"</td>";
				str+="<td class='text-white'>"+jasonobject[i].vendorName+"</td>";
				str+="<td class='text-white'>"+jasonobject[i].email+"</td>";
				str+="<td><a style=' background-color: #dc3545;color: white; border: none; padding: 5px 10px; border-radius: 5px;transition: background-color 0.3s ease;' onclick='confirmationDelete("+jasonobject[i].vendorId+");' >Delete</a></td>";
				str+="<td><a style=' background-color: #007bff; color: white;border: none;padding: 5px 10px;border-radius: 5px;transition: background-color 0.3s ease;' href=updatevendor?vendorid="+jasonobject[i].vendorId+"&vendorname="+jasonobject[i].vendorName+" &email="+jasonobject[i].vendoremail+">Update</a></td>";
				str+="</tr>";
			}
			
			str+="</tbody>";
			str+="</table>";
			
			str+="</table>";
			document.getElementById("searchedtable").innerHTML=str;
		}
	};

	xhttp.open("GET", "searchvendor?vendorname=" + vendorname, true);
	xhttp.send();

}






function checkUserName(userName) {
	var button = document.getElementById("btn");
	var regexp = /^[a-zA-Z" "]+$/;
	let result = regexp.test(userName);
	
	if (userName != "") {
		if (result) {
			document.getElementById("name_message").innerHTML = "";
			button.disabled = false;
		} else {
			document.getElementById("name_message").innerHTML = "Invalid Name";
			button.disabled = true;
		}
	} else {
		document.getElementById("name_message").innerHTML = "";
		button.disabled = false;
	}

}

function checkValidNumber(number) {
	var button = document.getElementById("btn");
	var regexp = /^\d{10}$/;
	let result = regexp.test(number);
	
     
	
	
	 const regex = /^(0000000000|1111111111|2222222222|3333333333|4444444444|5555555555|6666666666|7777777777|8888888888|9999999999)$/;

    if(regex.test(number)==true){
		document.getElementById("contact_message").innerHTML = "Invalid Contact Number";
		button.disabled = true;
		
	}
	
	
	if (number != "") {
		if (result) {
			document.getElementById("contact_message").innerHTML = "";
			button.disabled = false;
		} else {
			document.getElementById("contact_message").innerHTML = "Invalid Contact Number";
			button.disabled = true;
		}
	} else {
		document.getElementById("contact_message").innerHTML = "";
		button.disabled = false;
	}
	
}

function checkEmail(email) {
	var button = document.getElementById("btn");
	var regexp = /^[^.0-9][a-z.]+@[a-z]+.[\w{3}a-z]*$/;
	let result = regexp.test(email);
	if (email != "") {
		if (result) {
			document.getElementById("mail_message").innerHTML = "";
			button.disabled = false;
		} else {
			document.getElementById("mail_message").innerHTML = "Invalid Email";
			button.disabled = true;
		}
	} else {
		document.getElementById("mail_message").innerHTML = "";
		button.disabled = false;
	}

}

function checkStrongPassword(password) {
	var button = document.getElementById("btn");
	var regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*?])[A-Za-z\d@$#%^*?&]{8,}$/;
	let result = password.match(regexp);
	if (password != "") {
		if (result===null) {
			document.getElementById("password_message").innerHTML = "Type Strong Password";
			button.disabled = true;
			
		} else {
			document.getElementById("password_message").innerHTML = "";
			button.disabled = false;
			
		}
	} else {
		document.getElementById("password_message").innerHTML = "";
		button.disabled = false;
		
	}

}


function passwordConfirmation(password,confirmpassword){
	
	
	
	var button = document.getElementById("btn");
	if(password==confirmpassword){
		document.getElementById("password_message").innerHTML="";
		button.disabled = false;
		
	}else{
		document.getElementById("password_message").innerHTML="Password should be same";
		button.disabled = true;
	}
	
	if(confirmpassword==''){
		document.getElementById("password_message").innerHTML="";
		button.disabled = false;
	}
}


function searchproduct(searchkey,bysearch){

	
	
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		 
		if (this.readyState == 4 && this.status == 200) {
			let str="";
			let jasonobject=JSON.parse(this.responseText);
			str+="<table class='table table-bordered'>";
			str+="<thead class='thead-dark'>";
			str+="<tr>";
			str+="<th scope='col'>Product Number</th>";
			str+="<th scope='col'>Vendor Name</th>";
			str+="<th scope='col'>Product Name</th>";
			str+="<th scope='col'>Product Category</th>";
			str+="<th scope='col'>joining Date</th>";
			str+="<th scope='col'>Features</th>";
			str+="<th scope='col'>delete</th>";
			str+="<th scope='col'>Update</th>";
			str+="</tr>";
			str+="</thead>";
			str+="<tbody>";
			for(let i=0;i<jasonobject.length;i++){
				str+="<tr>";
				str+="<td >"+(i+1)+"</td>";
				str+="<td>"+jasonobject[i].vendorModel.vendorName+"</td>";
				str+="<td>"+jasonobject[i].productModel.productName+"</td>";
				str+="<td>"+jasonobject[i].productCategoryModel.productCategoryName+"</td>";
				str+="<td>"+jasonobject[i].date+"</td>";
				str+="<td>"+jasonobject[i].details+"</td>";
				str+="<td><a class='btn btn-delete' onclick='confirmationDelete("+jasonobject[i].productNumber+")'  href='#'>Delete</a></td>";
				
				
				str+="<td><a class='btn btn-update' href=updateproduct?vid="+jasonobject[i].vendorModel.vendorId+"&pid="+jasonobject[i].productModel.productId+"&pcid="+jasonobject[i].productCategoryModel.productCategoryId+"&productnumber="+jasonobject[i].productNumber+"&vendorname="+jasonobject[i].vendorModel.vendorName+"&productname="+jasonobject[i].productModel.productName+"&productcategoryname="+jasonobject[i].productCategoryModel.productCategoryName+"&date="+jasonobject[i].date+"&details="+jasonobject[i].details+">Update</a></td>";
			
				
				str+="</tr>";
			}
			
			str+="</tbody>";
			str+="</table>";
			
			str+="</table>";
			document.getElementById("searchedtable").innerHTML=str;
		}
	};

	if(bysearch=="vendorname"){
	xhttp.open("GET", "searchproductbyvendorname?vendorname=" + searchkey, true);
	xhttp.send();
	}else if(bysearch=="productname"){
		xhttp.open("GET", "searchproductbyname?productName=" + searchkey, true);
		xhttp.send();
	} else if(bysearch=="productcategory"){
		xhttp.open("GET", "searchproductbycategoryname?productCategory=" + searchkey, true);
		xhttp.send();
	}else if(bysearch=="date"){
		xhttp.open("GET", "searchproductbydate?date=" + searchkey, true);
		xhttp.send();
	}else if(bysearch=="feature"){
		xhttp.open("GET", "searchproductbyfeature?feature=" + searchkey, true);
		xhttp.send();
	}


	
	
}



