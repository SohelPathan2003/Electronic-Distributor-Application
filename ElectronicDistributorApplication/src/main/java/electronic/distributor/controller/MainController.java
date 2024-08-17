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
	public String isvaliduser(LoginModel loginmodel, HttpServletRequest request, Map<String,String> map) {
		if(loginmodel.getEmail()==null || loginmodel.getPassword()==null) {
			map.put("result", "wrong");
			return "Login";
		}
		
		List<LoginModel> list = loginvalid.isValidUser(loginmodel);
		if(list.size()>0) {
		LoginModel logm = list.get(0);
		String name[]=logm.getUsername().split(" ");
		request.getSession().setAttribute("user", name[0]);
		if (logm.getLoginType().equals("admin")) {
			return "DashBoard";
		} else {
			return "SubAdmin";
		}
		}else {
			map.put("result", "wrong");
			return "Login";
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
	
	@RequestMapping("/Add-Subadmin")
	
	public String subAdminPage() {
		return "Add-Subadmin";
	}
}
