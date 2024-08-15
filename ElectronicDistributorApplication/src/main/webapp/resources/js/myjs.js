function isValidvendor(str) {
	let small = document.getElementById("small");
	let vendorbtn = document.getElementById("vendorbtn");
	var regexp = /^[a-zA-Z]+$/;
	let result = regexp.test(str);
	if (str.length == 0) {

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





function searchvendor(s) {
	
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		 
		if (this.readyState == 4 && this.status == 200) {
			let str="";
			let jasonobject=JSON.parse(this.responseText);
			str+="<table class='table'>";
			str+="<thead class='thead-dark'>";
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
				str+="<td>"+(i+1)+"</td>";
				str+="<td>"+jasonobject[i].vendorName+"</td>";
				str+="<td>"+jasonobject[i].email+"</td>";
				str+="<td><a class='text-dark' href=deletevendor?vid="+jasonobject[i].vendorId+">Delete</a></td>";
				str+="<td><a class='text-dark' href=updatevendor?vid="+jasonobject[i].vendorId+"&name="+jasonobject[i].vendorName+" &email="+jasonobject[i].email+">Update</a></td>";
				str+="</tr>";
			}
			
			str+="</tbody>";
			str+="</table>";
			
			str+="</table>";
			document.getElementById("searchedtable").innerHTML=str;
		}
	};

	xhttp.open("GET", "searchvendor?v=" + s, true);
	xhttp.send();

}






function checkname(name) {
	var button = document.getElementById("btn");
	var regexp = /^[a-zA-Z" "]+$/;
	let result = regexp.test(name);
	if (name != "") {
		if (result) {
			document.getElementById("namemass").innerHTML = "";
			button.disabled = false;
		} else {
			document.getElementById("namemass").innerHTML = "Invalid Name";
			button.disabled = true;
		}
	} else {
		document.getElementById("namemass").innerHTML = "";
		button.disabled = false;
	}

}

function checknum(number) {
	var button = document.getElementById("btn");
	var regexp = /^\d{10}$/;
	let result = regexp.test(number);
	if (number != "") {
		if (result) {
			document.getElementById("nummass").innerHTML = "";
			button.disabled = false;
		} else {
			document.getElementById("nummass").innerHTML = "Invalid Name";
			button.disabled = true;
		}
	} else {
		document.getElementById("nummass").innerHTML = "";
		button.disabled = false;
	}
}

function checkemail(email) {
	var button = document.getElementById("btn");
	var regexp = /^[^.0-9][a-z.]+@[a-z]+.[\w{3}a-z]*$/;
	let result = regexp.test(email);
	if (email != "") {
		if (result) {
			document.getElementById("mailmass").innerHTML = "";
			button.disabled = false;
		} else {
			document.getElementById("mailmass").innerHTML = "Invalid Name";
			button.disabled = true;
		}
	} else {
		document.getElementById("mailmass").innerHTML = "";
		button.disabled = false;
	}

}

function checkpass(pass) {
	var button = document.getElementById("btn");
	var regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*?])[A-Za-z\d@$#%^*?&]{8,}$/;
	let result = pass.match(regexp);
	if (pass != "") {
		if (result===null) {
			document.getElementById("passmass").innerHTML = "Type Strong Password";
			/*button.disabled = false;*/
		} else {
			document.getElementById("passmass").innerHTML = "";
			/*button.disabled = true;*/
		}
	} else {
		document.getElementById("passmass").innerHTML = "";
		/*button.disabled = false;*/
	}

}
