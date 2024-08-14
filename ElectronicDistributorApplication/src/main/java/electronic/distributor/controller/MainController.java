package electronic.distributor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import electronic.distributor.model.LoginModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.service.ValidationServiceImpl;

@Controller

public class MainController {

	@RequestMapping("/")
	public String show() {
		return "home";
	}

	@RequestMapping("/login")
	public String loginPage() {
		return "Login";
	}

	@RequestMapping("/register")
	public String registerPage() {
		return "Register";
	}

	@Autowired
	ValidationServiceImpl loginvalid;

	@RequestMapping("/validlogin")
	public String isvaliduser(LoginModel loginmodel, HttpServletRequest request, Map map) {

		List<LoginModel> list = loginvalid.isValidUser(loginmodel);
		LoginModel logm = list.get(0);
		request.getSession().setAttribute("loginname", logm.getUsername());
		if (logm.getLoginType().equals("admin")) {
			return "DashBoard";
		} else {
			return "SubAdmin";
		}
	}
	
	@RequestMapping("/submitRegistration")
	public String isRegister(RegisterModel registermodel,Map<String,String> map) {
		boolean b=loginvalid.isRegisterUser(registermodel);
		if(b) {
		map.put("msg", "success");
			return "Register";
		}else {
			map.put("msg","wrong");
			return "Register";
		}
		
	}
}
