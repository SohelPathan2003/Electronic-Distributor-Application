<%@ include file="DashBoard.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Vendor Registration</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="./resources/js/distribution.js"></script>
    <style>
        /* General styles for layout */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }

/* Existing styles */
.VendorPage {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    margin-right: 200px;
    justify-content: center;
    align-items: center;
    background-image: url('./resources/images/login2.jfif');
    background-repeat: no-repeat;
    background-size: cover;
}

.VendorPage .veder-cont {
    height: auto; /* Adjust height to fit content */
    margin: 10px 0;
    width: 100%;
    width: 800px; /* Increase maximum width */
    display: flex;
    flex-direction: column;
    align-items: center; /* Center items horizontally */
    border-bottom-color: red;
    padding: 30px; /* Increase padding for more space */
    border-radius: 10%;
    border: 1px solid rgba(200, 255, 255, 0.5);
    backdrop-filter: blur(0px);
    -webkit-backdrop-filter: blur(8px);
    box-shadow: 0px 1px white;
}

.VendorPage input {
    width: 100%; /* Make inputs full width of their container */
    max-width: 500px; /* Increase maximum width of input fields */
    padding: 12px; /* Increase padding for better appearance */
    margin-bottom: 5px; /* Space between input and error message */
    box-sizing: border-box; /* Ensure padding is included in width */
}

.VendorPage input[type=submit] {
    width: 100%; /* Make submit button full width of its container */
    max-width: 20em; /* Increase maximum width of the submit button */
    padding: 12px; /* Increase padding for better appearance */
    background-color: orange;
    border: 2px solid white;
    box-shadow: 2px 2px orange;
    color: white;
    font-size: 24px; /* Increase font size for better visibility */
    border-left: none;
    border-right: none;
    cursor: pointer; /* Add cursor pointer for better UX */
}

.VendorPage input[type=submit]:hover {
    background-color: maroon;
    color: white;
    box-shadow: 2px 2px maroon;
    border: none;
    margin-top: 2.5px;
}

.input {
    margin: 20px 0;
    width: 70%;
}

.imageheader {
    width: 100%;
    height: 23em;
}

.veder-cont h3 {
    font-family: serif;
}

.imageheader img {
    width: 100%;
    height: 100%;
    
}

.row {
    display: flex;
    flex-direction: column; /* Stack input and error message vertically */
    align-items: center; /* Center inputs horizontally */
    margin-bottom: 10px;
    width: 100%; /* Ensure rows take full width */
}

.error {
    color: red;
    font-size: 0.9em;
    margin-top: 5px; /* Space between input and error message */
}

/* Responsive styles */
@media (max-width: 768px) {
    .VendorPage .veder-cont {
        width: 90%;
        padding: 20px; /* Adjust padding for smaller screens */
    }

    .VendorPage input {
        font-size: 0.9em;
        padding: 10px; /* Adjust padding for smaller screens */
    }

    .VendorPage input[type=submit] {
        font-size: 1.1em;
        padding: 10px; /* Adjust padding for smaller screens */
    }

    .error {
        font-size: 0.8em;
    }
}

@media (max-width: 480px) {
    .VendorPage input {
        font-size: 0.8em;
    }

    .VendorPage input[type=submit] {
        font-size: 1em;
    }
}


    </style>
</head>
<body>
<div class="VendorPage mx-0 mt-0 mp-0 my-0">
    <div class="imageheader">
        <img src="./resources/images/newslider.jpg" alt="Vendor Banner">
    </div>
    <form id="vendorForm" action="isAddVendor" method="get">
        <div class="veder-cont">
            <h3>Vendor Add</h3>
            <div class="row">
                <input type="text" id="vendorName" name="vendorName" placeholder="Enter Vendor Name" required>
                <small id="vendorNameError" class="error"></small>
            </div>
            <div class="row">
                <input type="email" id="email" name="email" onkeyup="validateEmail()" placeholder="Enter Your Mail" required>
                <small id="emailError" class="error"></small>
            </div>
            <div class="row">
                <input type="number" id="contact" name="contact" placeholder="Enter Your Contact" required>
                <small id="contactError" class="error"></small>
            </div>
            <div class="row">
                <input type="text" id="address" name="address" placeholder="Enter Vendor City" required>
                <small id="addressError" class="error"></small>
            </div>
            <input type="submit" value="Submit" name="btn" id="vendorbtn" class="btn btn-primary">
        </div>
    </form>
</div>

<script>
//Function to validate Email
function validateEmail() {
    const email = document.getElementById('email');
    const emailError = document.getElementById('emailError');

    // Regular expression to validate the email format
    const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    // Get the email value
    const emailValue = email.value;

    // Check if there are leading or trailing white spaces
    const hasLeadingSpace = emailValue.startsWith(' ');
    const hasTrailingSpace = emailValue.endsWith(' ');

    // Check for any white spaces anywhere in the email
    const containsWhiteSpace = /\s/.test(emailValue);

    if (hasLeadingSpace || hasTrailingSpace) {
        emailError.textContent = 'Email address should not start or end with white spaces.';
    } else if (containsWhiteSpace) {
        emailError.textContent = 'Email address should not contain white spaces.';
    } else if (!emailRegex.test(emailValue)) {
        emailError.textContent = 'Wrong email address.';
    } else {
        emailError.textContent = '';
    }
}

// Attach the validateEmail function to the keyup event of the email input field
document.getElementById('email').addEventListener('keyup', validateEmail);

// Optional: You can also call the validation on other events if needed
document.getElementById('email').addEventListener('blur', validateEmail);

//Function to validate Vendor Name
function validateVendorName() {
    const vendorName = document.getElementById('vendorName');
    const vendorNameError = document.getElementById('vendorNameError');
    const vendorNameValue = vendorName.value;

    // Regular expression to validate the vendor name (letters and spaces)
    const vendorNameRegex = /^[a-zA-Z\s]{3,}$/;

    // Check for leading or trailing white spaces
    const hasLeadingSpace = vendorNameValue.startsWith(' ');
    const hasTrailingSpace = vendorNameValue.endsWith(' ');

    if (hasLeadingSpace || hasTrailingSpace) {
        vendorNameError.textContent = 'Vendor name should not start or end with white spaces.';
    } else if (!vendorNameRegex.test(vendorNameValue)) {
        vendorNameError.textContent = 'Vendor name must be at least 3 characters long and contain only letters and spaces.';
    } else {
        vendorNameError.textContent = '';
    }
}

// Attach the validateVendorName function to the input event of the vendor name field
document.getElementById('vendorName').addEventListener('input', validateVendorName);

// Function to validate Contact
function validateContact() {
    const contact = document.getElementById('contact');
    const contactError = document.getElementById('contactError');
    const button = document.getElementById('vendorbtn');
    
    // Regular expression to check if the number is exactly 10 digits and starts with 9, 8, or 7
    const validNumberRegex = /^[987]\d{9}$/;

    // Regular expression to check for invalid patterns (sequences of identical digits)
    const invalidPatternsRegex = /^(0000000000|1111111111|2222222222|3333333333|4444444444|5555555555|6666666666|7777777777|8888888888|9999999999)$/;

    // Trim any white spaces from the number
    const contactValue = contact.value.trim();

    // Check if the number is empty
    if (contactValue === "") {
        contactError.textContent = '';
        button.disabled = true; // Disable button if input is empty
        return;
    }

    // Check if the number contains white spaces
    if (/\s/.test(contactValue)) {
        contactError.textContent = 'Contact number should not contain white spaces.';
        button.disabled = true; // Disable button if input contains white spaces
        return;
    }

    // Check if the number is valid, starts with 9, 8, or 7, and is not in the invalid patterns
    if (validNumberRegex.test(contactValue) && !invalidPatternsRegex.test(contactValue)) {
        contactError.textContent = '';
        button.disabled = false; // Enable button if valid
    } else {
        contactError.textContent = 'Invalid Contact Number.';
        button.disabled = true; // Disable button if invalid
    }
}

//Function to validate Address
function validateAddress() {
    const address = document.getElementById('address');
    const addressError = document.getElementById('addressError');
    const addressValue = address.value;

    // Check for leading or trailing white spaces
    const hasLeadingSpace = addressValue.startsWith(' ');
    const hasTrailingSpace = addressValue.endsWith(' ');

    if (addressValue.length === 0) {
        // Address is empty
        addressError.textContent = 'Address cannot be empty.';
    } else if (hasLeadingSpace || hasTrailingSpace) {
        // Address has leading or trailing spaces
        addressError.textContent = 'Address should not start or end with white spaces.';
    } else {
        // Address is valid
        addressError.textContent = '';
    }
}

// Attach the validateAddress function to the input event of the address field
document.getElementById('address').addEventListener('input', validateAddress);


// Attach event listeners to input fields
document.getElementById('vendorName').addEventListener('keyup', validateVendorName);
document.getElementById('email').addEventListener('keyup', validateEmail);
document.getElementById('contact').addEventListener('keyup', validateContact);
document.getElementById('address').addEventListener('keyup', validateAddress);

// Form submission validation
document.getElementById('vendorForm').addEventListener('submit', function(event) {
    validateVendorName();
    validateEmail();
    validateContact();
    validateAddress();

    // Check if there are any error messages
    if (document.querySelectorAll('.error:not(:empty)').length > 0) {
        event.preventDefault();
    }
});

</script>

	
</div>
</main>
</body>
</html>
