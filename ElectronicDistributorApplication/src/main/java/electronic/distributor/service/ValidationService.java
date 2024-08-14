package electronic.distributor.service;

import java.util.List;

import electronic.distributor.model.LoginModel;
import electronic.distributor.model.RegisterModel;

public interface ValidationService {
	public List<LoginModel> isValidUser(LoginModel loginmodel);
	public boolean isRegisterUser(RegisterModel registermodel);

}
