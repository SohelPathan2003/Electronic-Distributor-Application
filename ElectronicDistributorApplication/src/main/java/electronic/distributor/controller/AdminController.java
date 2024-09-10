package electronic.distributor.controller;


import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductCategoryModel;
import electronic.distributor.model.ProductModel;
import electronic.distributor.model.VendorModel;
import electronic.distributor.service.AdminService;
import electronic.distributor.service.ProductService;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@RequestMapping("/admin")
public class AdminController {
boolean b;

@Autowired
AdminService adminservice;
@Autowired
ProductService productservice;

List<VendorModel> listofvendor = null;

public AdminController() {
}

@RequestMapping("/dashboard")
public String showDashBoard() {
	return "DashBoard";
}

@RequestMapping("addvendor")
public String addVendorPage() {
   return "AddNewVendor";
}

@RequestMapping("isAddVendor")
public String IsAddVendor(VendorModel vendormodel, Map map) {
   this.b = this.adminservice.isAddVendor(vendormodel);
   
   if (this.b) {
      map.put("msg", "success");
   } else {
      map.put("msg", "wrong");
   }

   return "AddNewVendor";
}



@RequestMapping({"viewvendor"})
public String showAllVendor(Map<String, List> map) {
   this.listofvendor = this.adminservice.getAllVendorList();
   map.put("list", this.listofvendor);
   return "ViewVendor";
}

@RequestMapping("deletevendor")
public String deleteVendor(@RequestParam("vid") String vid, Map<String, List> map) {
	int v=(int)Integer.parseInt(vid);
   adminservice.deleteVendorById(v);
   map.put("list", this.adminservice.getAllVendorList());
   return "ViewVendor";
}

@RequestMapping("updatevendor")
public String UpdatePage(@RequestParam("vendorid") int vendorid, @RequestParam("vendorname") String vendorname, @RequestParam("vendoremail") String vendoremail, Map map) {
   map.put("vid", vendorid);
   map.put("name", vendorname);
   map.put("email", vendoremail);
   return "UpdateVendor";
}

@RequestMapping("/isUpdateVendor")

     public String isUpdateVendor(VendorModel vendormodel,Map map) {
	
	b=adminservice.isUpdateVendor(vendormodel);
	map.put("list",adminservice.getAllVendorList());
	 if(b) {
		 map.put("result", "success");
		
	 }else {
		 map.put("result","wrong");
	 }
	 return "UpdateVendor";
}

	List<VendorModel> vendorlist=null;
	List<ProductModel> productlist=null;
	List<ProductCategoryModel> productcategorylist=null;

     @RequestMapping("searchvendor")
     @ResponseBody
    public  List<VendorModel> searchVendor(@RequestParam("vendorname") String vendorname) {
    	
    	
    	 vendorlist=adminservice.searchVendorByName(vendorname);
    	
    	 return vendorlist;
    }
     

     @RequestMapping("/products")
     public String showProducts(Map map) {
    	 map.put("listofvendor", adminservice.getAllVendorList());
    	 map.put("productcategory",productservice.getAllProductCategoryList());
    	 map.put("products",productservice.getAllProductList());
    	 return "products";
     }
     
     
     @RequestMapping("/AddProductCategory")
     public String isAddProductCategory() {
    	 return "productcategory";
     }
     
     @RequestMapping("/isAddProductCategory")
     public String addProductCategory(ProductCategoryModel model,Map map) {
    	b= productservice.isAddProductCategory(model);
    	 map.put("listofvendor", adminservice.getAllVendorList());
    	 map.put("productcategory",productservice.getAllProductCategoryList());
    	 map.put("products",productservice.getAllProductList());
    	 return showProducts(new HashMap());
    	 
    	  
     }
     
     @RequestMapping("/AddProductName")
     
     public String productPage() {
    	 return"AddProductName";
     }
     
     @RequestMapping("/isAddProductName")
     public String isAddProductName(ProductModel model,Map map) {
    	 b=productservice.isAddProduct(model);
    	 map.put("listofvendor", adminservice.getAllVendorList());
    	 map.put("productcategory",productservice.getAllProductCategoryList());
    	 map.put("products",productservice.getAllProductList());
    	 return "products";
     }
     
     @RequestMapping("/isAddProductWithDetails")
     public String isAddProductWithDetails(HttpServletRequest request,ProductModel pmodel,ProductCategoryModel productCategorymodel,VendorModel vmodel,Map map ) {
    	 
    	
    	 
    	 
    	 ProductAllDetailsModel productwithdetails=new ProductAllDetailsModel();
    	 productwithdetails.setVendorModel(vmodel);
    	 productwithdetails.setProductModel(pmodel);
    	 productwithdetails.setProductCategoryModel(productCategorymodel);
    	 productwithdetails.setDate(request.getParameter("date"));
    	 productwithdetails.setDetails(request.getParameter("text"));
    	 productwithdetails.setImageURL(request.getParameter("imageURL"));
    	 
    	 
    	 map.put("listofvendor", adminservice.getAllVendorList());
    	 map.put("productcategory",productservice.getAllProductCategoryList());
    	 map.put("products",productservice.getAllProductList());
    	 
    	 b=productservice.isAddProductWithDetails(productwithdetails);
    	 if(b) {
    	 map.put("msg", "success");
    	 
    	 }else {
    		 map.put("msg", "wrong");
    	 }
    	 return "products";
     }
     
     
     @RequestMapping("/viewproduct")
     public String getAllProductDetails(Map map) {
    	 
    	 List<ProductAllDetailsModel> productdetailslist=productservice.getAllProductWithDetails();
    	 map.put("productslist", productdetailslist);
    	 return "ViewProduct";
     }
     
     @RequestMapping("/deleteproduct")
     public String isDeleteProduct(@RequestParam("productnumber") int productnumber,Map map) {
    	 productservice.deleteProductByNumber(productnumber);
    	 List<ProductAllDetailsModel> productdetailslist=productservice.getAllProductWithDetails();
    	 map.put("productslist", productdetailslist);
    	 return "ViewProduct";
    	 
     }
  
     @RequestMapping("/updateproduct")
     public String isUpdateProduct(@RequestParam("vid")int vid,@RequestParam("pid")int pid,@RequestParam("pcid") int pcid,@RequestParam("productnumber")int prodnumber,@RequestParam("vendorname")String vname,@RequestParam("productname")String pname,@RequestParam("productcategoryname")String pcname,
    		 @RequestParam("date")String date,@RequestParam("details")String details,Map map) {
    	 map.put("forupdate", new ProductAllDetailsModel(prodnumber,new VendorModel(vid,vname),new ProductModel(pid,pname),new ProductCategoryModel(pcid,pcname),date,details));
    	 map.put("listofvendor", adminservice.getAllVendorList());
    	 map.put("productcategory",productservice.getAllProductCategoryList());
    	 map.put("products",productservice.getAllProductList());
    	 return "updateproduct";
     }
     
     @RequestMapping("/updateaddproductwithdetails")
     public String updateaddproductwithdetails(HttpServletRequest request,ProductModel pmodel,ProductCategoryModel productCategorymodel,VendorModel vmodel,Map map ) {
    	 ProductAllDetailsModel productwithdetails=new ProductAllDetailsModel();
    	
    	 productwithdetails.setProductNumber(Integer.parseInt(request.getParameter("productnumber")));
    	 productwithdetails.setVendorModel(vmodel);
    	 productwithdetails.setProductModel(pmodel);
    	 productwithdetails.setProductCategoryModel(productCategorymodel);
    	 productwithdetails.setDate(request.getParameter("date"));
    	 productwithdetails.setDetails(request.getParameter("text"));
    	 
    	 
    	 map.put("listofvendor", adminservice.getAllVendorList());
    	 map.put("productcategory",productservice.getAllProductCategoryList());
    	 map.put("products",productservice.getAllProductList());
    	 
    	 b=productservice.isUpdateAddProductWithDetails(productwithdetails);
    	 if(b) {
    	 map.put("msg", "success");
    	 
    	 }else {
    		 map.put("msg", "wrong");
    	 }
    	 return "updateproduct";
     }
     
     @RequestMapping("/searchproductbyvendorname")
     @ResponseBody
     public List<ProductAllDetailsModel> searchProductByVendorName(@RequestParam("vendorname") String vendorname){
    	 return productservice.searchProductByVendorName(vendorname);
     }
     
     @RequestMapping("/searchproductbyname")
     @ResponseBody
    public  List<ProductAllDetailsModel> searchProductByName(@RequestParam("productName") String productname) {
    	 return productservice.searchByProductName(productname);
    }
     
     @RequestMapping("/searchproductbycategoryname")
     @ResponseBody
     public List<ProductAllDetailsModel> searchProductByCategoryName(@RequestParam("productCategory") String productcategory) {
    	 return productservice.searchByProductCategoryName(productcategory);
     }
     
     @RequestMapping("/searchproductbydate")
     @ResponseBody
     public List<ProductAllDetailsModel> searchProductByItsDate(@RequestParam("date") String date) {
    	 return productservice.searchProductByDate(date);
     }
     
     
     @RequestMapping("/searchproductbyfeature")
     @ResponseBody
     public List<ProductAllDetailsModel> searchProductByFeatures(@RequestParam("feature") String feature) {
    	 return productservice.searchProductByFeature(feature);
     }
     
     
}