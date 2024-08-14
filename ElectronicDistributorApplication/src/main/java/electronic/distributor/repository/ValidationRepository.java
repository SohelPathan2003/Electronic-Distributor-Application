package electronic.distributor.repository;


import electronic.distributor.model.LoginModel;
import electronic.distributor.model.RegisterModel;
import java.util.List;

public interface ValidationRepository {
List<LoginModel> isValidUser(LoginModel loginmodel);

boolean isRegisterUser(RegisterModel registermodel);
}
