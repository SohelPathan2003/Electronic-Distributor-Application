package electronic.distributor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductOrderModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.repository.ClientRepository;


@Service("clientservice")
public class ClientServiceImpl implements ClientService{

	@Autowired
	ClientRepository clientrepo;
	
	public List<ProductAllDetailsModel> getAllProductNameWise(String productname) {
		
		return clientrepo.getAllProductNameWise(productname) ;
	}

	@Override
	public RegisterModel isUpdateProfile(RegisterModel registermodel) {
		// TODO Auto-generated method stub
		return clientrepo.isUpdateProfile(registermodel);
	}

	@Override
	public ProductAllDetailsModel getSpecificProductDetailsByProductNumber(int productNumber) {
		
		return clientrepo.getSpecificProductDetailsByProductNumber(productNumber);
	}

	@Override
	public boolean isProductOrder(ProductOrderModel productordermodel) {
		// TODO Auto-generated method stub
		return clientrepo.isProductOrder(productordermodel);
	}
	
	public List<ProductOrderModel> getOrderListByUserId(int userloginid){
		return clientrepo.getOrderListByUserId(userloginid);
	}

	@Override
	public RegisterModel getUserProfileById(int userloginid) {
		// TODO Auto-generated method stub
		return clientrepo.getUserProfileById(userloginid);
	}

}
