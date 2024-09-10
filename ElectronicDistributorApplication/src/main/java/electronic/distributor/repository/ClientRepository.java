package electronic.distributor.repository;

import java.util.List;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductOrderModel;
import electronic.distributor.model.RegisterModel;

public interface ClientRepository {

	
	public List<ProductAllDetailsModel> getAllProductNameWise(String productname);
	public RegisterModel isUpdateProfile(RegisterModel registermodel);
	public ProductAllDetailsModel getSpecificProductDetailsByProductNumber(int productNumber);
	public boolean isProductOrder(ProductOrderModel productordermodel);
	public List<ProductOrderModel> getOrderListByUserId(int userloginid);
	public RegisterModel getUserProfileById(int userloginid);
}

