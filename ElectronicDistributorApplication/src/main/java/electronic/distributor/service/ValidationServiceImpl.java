package electronic.distributor.service;

import electronic.distributor.model.LoginModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.repository.ValidationRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginservice")
public class ValidationServiceImpl implements ValidationService {
@Autowired
ValidationRepository logrepo;

public ValidationServiceImpl() {
}

public List<LoginModel> isValidUser(LoginModel loginmodel) {
   return logrepo.isValidUser(loginmodel);
}

public boolean isRegisterUser(RegisterModel registermodel) {
   return logrepo.isRegisterUser(registermodel);
}
}
