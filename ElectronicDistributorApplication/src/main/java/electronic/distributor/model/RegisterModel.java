package electronic.distributor.model;

public class RegisterModel {
private String userName;
private Long contact;
private String email;
private String password;
private String confirmPassword;
private String address;
private int clientId;


public int getClientId() {
	return clientId;
}

public void setClientId(int clientId) {
	this.clientId = clientId;
}

public RegisterModel() {
}

public String getUserName() {
   return this.userName;
}

public void setUserName(String userName) {
   this.userName = userName;
}

public Long getContact() {
   return this.contact;
}

public void setContact(Long contact) {
   this.contact = contact;
}

public String getEmail() {
   return this.email;
}

public void setEmail(String email) {
   this.email = email;
}

public String getPassword() {
   return this.password;
}

public void setPassword(String password) {
   this.password = password;
}

public String getConfirmPassword() {
   return this.confirmPassword;
}

public void setConfirmPassword(String confirmPassword) {
   this.confirmPassword = confirmPassword;
}

public String getAddress() {
   return this.address;
}

public void setAddress(String address) {
   this.address = address;
}

private String imageURL;

public String getImageURL() {
	return imageURL;
}

public void setImageURL(String imageURL) {
	this.imageURL = imageURL;
}
}
