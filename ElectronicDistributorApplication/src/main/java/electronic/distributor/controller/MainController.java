package electronic.distributor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import electronic.distributor.model.LoginModel;
import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.service.ClientService;
import electronic.distributor.service.ValidationService;
import electronic.distributor.service.ValidationServiceImpl;

@Controller

public class MainController {

	
	@Autowired
	ClientService clientservice;
	List<ProductAllDetailsModel> productList;
	@Autowired
	ValidationService loginvalid;
	List<RegisterModel>registermodellist=null;

	
	@RequestMapping("/")
	public String show() {
		return "home";
	}
	
	
	@RequestMapping("/home")
	public String showAfterLogout() {
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

	
	
	@RequestMapping("/loginFirst")
	public String loginPageFirst(@RequestParam("productnumber") int productnumber, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    session.setAttribute("maintainTransaction", productnumber);
	    return "Login";
	}

	
	@RequestMapping("/validlogin")
	public String isvaliduser(LoginModel loginmodel, HttpServletRequest request, Map map) {
	    if (loginmodel.getEmail() == null || loginmodel.getPassword() == null) {
	        map.put("result", "wrong");
	        return "Login";
	    }
	    
	    List<LoginModel> list = loginvalid.isValidUser(loginmodel);
	    if (list.size() > 0) {
	        LoginModel logm = list.get(0);
	        request.getSession().setAttribute("userloginid",logm.getLoginId());
	        request.getSession().setAttribute("user", logm.getUsername());
	        request.getSession().setAttribute("imageURL",logm.getImageURL());
	        if (logm.getLoginType().equals("admin")) {
	            return "DashBoard";
	        } else {
	        	
	            HttpSession session = request.getSession();
	            session.setAttribute("user", loginmodel.getUsername());
	            
	           // for register model.....
	            registermodellist = loginvalid.getUserProfile(logm.getEmail(),logm.getPassword());
	            RegisterModel userProfile=registermodellist.get(0);
	            session.setAttribute("userprofile", userProfile);
	            
	            int productnumber=0;
	            if( session.getAttribute("maintainTransaction")!=null)
	            productnumber = (int) session.getAttribute("maintainTransaction"); 
	            if (productnumber>0) {
	            	
	            	map.put("msg",productnumber);
	            	ProductAllDetailsModel productmodel=clientservice.getSpecificProductDetailsByProductNumber(productnumber);
	        		map.put("product", productmodel);
	                return "ViewSpecificProductDetails";
	            } else {
	                return "home";
	            }
	        }
	    } else {
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
	
	
	

	@RequestMapping("/userlogout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();  
	    }
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            cookie.setValue(null);
	            cookie.setMaxAge(0);
	            cookie.setPath("/");  
	            response.addCookie(cookie);
	        }
	    }
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);

	   
	    return "Login"; 
	}
	
	@RequestMapping("/adminprofile")
	public String showAdminProfile(@RequestParam("adminid")int adminid) {
		
		return "profilePage";
	}

}
