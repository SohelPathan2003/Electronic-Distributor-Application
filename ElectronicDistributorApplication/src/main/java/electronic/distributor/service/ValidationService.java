package electronic.distributor.service;

import java.util.List;

import electronic.distributor.model.LoginModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.model.VendorModel;

public interface ValidationService {
	public List<LoginModel> isValidUser(LoginModel loginmodel);
	public boolean isRegisterUser(RegisterModel registermodel);
   
}
