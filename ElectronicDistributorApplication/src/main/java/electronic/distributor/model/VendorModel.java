package electronic.distributor.model;

public class VendorModel {
private String vendorName;
private Long contact;
private String address;
private String email;

public VendorModel(String vendorName, Long contact, String address, String email) {
   this.vendorName = vendorName;
   this.contact = contact;
   this.address = address;
   this.email = email;
}


public VendorModel(int vendorId,String vendorName) {
	this.vendorId = vendorId;
	this.vendorName = vendorName;
	
}

public VendorModel() {
}

public String getVendorName() {
   return this.vendorName;
}

public void setVendorName(String vendorName) {
   this.vendorName = vendorName;
}
private int vendorId;

public int getVendorId() {
	return vendorId;
}


public void setVendorId(int vendorId) {
	this.vendorId = vendorId;
}


public Long getContact() {
   return this.contact;
}

public void setContact(Long contact) {
   this.contact = contact;
}

public String getAddress() {
   return this.address;
}

public void setAddress(String address) {
   this.address = address;
}

public String getEmail() {
   return this.email;
}

public void setEmail(String email) {
   this.email = email;
}
}
