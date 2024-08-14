package electronic.distributor.controller;


import electronic.distributor.model.VendorModel;
import electronic.distributor.service.AdminService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({"/admin/"})
public class AdminController {
boolean b;
@Autowired
AdminService adminservice;
List<VendorModel> listofvendor = null;

public AdminController() {
}

@RequestMapping({"CompanyMaster"})
public String addCompanyPage() {
   return "CompanyMaster";
}

@RequestMapping({"addVendorPage"})
public String addVendorPage() {
   return "AddNewVendor";
}

@RequestMapping({"isAddVendor"})
public String IsAddVendor(VendorModel vendormodel, Map map) {
   this.b = this.adminservice.isAddVendor(vendormodel);
   System.out.println(this.b);
   if (this.b) {
      map.put("msg", "success");
   } else {
      map.put("msg", "wrong");
   }

   return "AddNewVendor";
}

public List<VendorModel> getAllVednor() {
   this.listofvendor = this.adminservice.getAllVendorList();
   return this.listofvendor;
}

@RequestMapping({"ViewVendor"})
public String showAllVendor(Map<String, List> map) {
   this.listofvendor = this.adminservice.getAllVendorList();
   map.put("list", this.listofvendor);
   return "ViewVendor";
}

@RequestMapping({"deletevendor"})
public String deleteVendor(@RequestParam("vid") int vid, Map<String, List> map) {
   adminservice.deleteVendorById(vid);
   map.put("list", this.getAllVednor());
   return "ViewVendor";
}

@RequestMapping({"updatevendor"})
public String UpdatePage(@RequestParam("vid") int vid, @RequestParam("name") String vendorname, @RequestParam("email") String email, Map map) {
   map.put("vid", vid);
   map.put("name", vendorname);
   map.put("email", email);
   return "UpdateVendor";
}

@RequestMapping("/isUpdateVendor")

     public boolean isUpdateVendor(@RequestParam("vid") int vid,@RequestParam("name") String name,@RequestParam("email") String email,Map<String,String> map) {
	
	 if(b) {
		 map.put("result", "success");
	 }else {
		 map.put("result","wrong");
	 }
	return true;
}
}
