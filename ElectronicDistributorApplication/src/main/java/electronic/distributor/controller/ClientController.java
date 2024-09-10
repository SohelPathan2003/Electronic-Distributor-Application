package electronic.distributor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductOrderModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.service.ClientService;

@Controller
public class ClientController {
	
	List<ProductAllDetailsModel> productList;
	ProductAllDetailsModel productmodel=null;
	@Autowired
	ClientService clientservice;
	@RequestMapping("/viewproductforclient")
	public String showProductsToUser(@RequestParam("productname") String productname,Map map) {
		map.put("msg",productname);
		productList=clientservice.getAllProductNameWise(productname);
		map.put("productlist", productList);
		return "ProductsForClient";
	}
	
	@RequestMapping("/product-details")
	public String clientProductView(HttpServletRequest request) {
		
		
		return "ViewProductdetailsForClient";
	}
	
	@RequestMapping("/userProfile")
	public String showUserProfile(@RequestParam("imageURL")String imageURL,HttpServletRequest request) {
		request.getSession().setAttribute("userimageurl", imageURL);
//		RegisterModel regmodel=clientservice.getUserProfileById(userloginid);
//		
//		request.getSession().setAttribute("userprofile", regmodel);
		return "profilePage";
	}
	
	@RequestMapping("/updateProfile")
	public String isUpdateProfile(RegisterModel registermodel,HttpServletRequest request) {
		
		return "profilePage";
	}
	@RequestMapping("/ViewSpecificProductDetails")
	public String showViewSpecificProductDetails(@RequestParam("productnumber")int productnumber,Map map) {
		
		productmodel=clientservice.getSpecificProductDetailsByProductNumber(productnumber);
		map.put("product", productmodel);
		map.put("result","null");
		return "ViewSpecificProductDetails";
	}
	
	@RequestMapping("/orderproduct")
	public String isOrderProduct(ProductOrderModel productordermodel,Map map) {
		
		
		boolean result=clientservice.isProductOrder(productordermodel);
		productmodel=clientservice.getSpecificProductDetailsByProductNumber(productordermodel.getProductNumber());
		map.put("product", productmodel);
		
		if(result)
			map.put("result","success");
		else
			map.put("result","failed");
		return "ViewSpecificProductDetails";
	}
	@RequestMapping("/userorderhistory")
	public String showUserOrderHistory(HttpServletRequest request,Map map) {
		HttpSession session=request.getSession(false);
		
		if(session.getAttribute("userloginid")!=null) {
	    map.put("userorderlist", clientservice.getOrderListByUserId((int)session.getAttribute("userloginid")));
		
		return "UserOrderHistory";
		}else {
			return "home";
		}
	}

}
