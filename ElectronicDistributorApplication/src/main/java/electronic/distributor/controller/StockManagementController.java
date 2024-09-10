package electronic.distributor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.StockDetailsModel;
import electronic.distributor.service.StockManagementServiceImpl;

@Controller
public class StockManagementController {
	
	@Autowired
	StockManagementServiceImpl stockservice;
	List<ProductAllDetailsModel> productdetailslist=null;
	@RequestMapping("/orderproducts")
 	public String showOrderProducts(Map map) {
		
		productdetailslist=stockservice.getAllProductsWithDetails();
		map.put("products",productdetailslist);
 		return "productorder-homepage";
 	}
	
	
	@PostMapping("/addStock")
    @ResponseBody
    public String addStock(@RequestParam("quantity") int quantity,@RequestParam("costPrice") double costPrice,@RequestParam("sellingPrice") double sellingPrice,@RequestParam("productnumber")int productnumber) {
		
		StockDetailsModel stockmodel=new StockDetailsModel();
		stockmodel.setCostPrice((int)costPrice);
		stockmodel.setSellingPrice((int)sellingPrice);
		stockmodel.setQuantity(quantity);
		stockmodel.setProductNumber(productnumber);
		boolean b=stockservice.isUpdateStock(stockmodel);
		
		if(b)
	 return "Success";
		else
			return "False";
	}
	
	@RequestMapping("/ss")
	public String showProductAllDetails(ProductAllDetailsModel productdetailslist) {
		
		
		return "vieworder-stockdetails";
	}
}
