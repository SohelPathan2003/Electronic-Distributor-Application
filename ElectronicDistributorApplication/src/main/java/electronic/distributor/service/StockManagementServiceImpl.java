package electronic.distributor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.StockDetailsModel;
import electronic.distributor.repository.StockManagementRepository;
@Service("stockservice")
public class StockManagementServiceImpl implements StockManagementService {

	@Autowired
	StockManagementRepository stockrepo;
   
	
	public List<ProductAllDetailsModel> getAllProductsWithDetails() {
		
	     return stockrepo.getAllProductsWithDetails();
	}


	@Override
	public boolean isUpdateStock(StockDetailsModel stockmodel) {
	
		return stockrepo.isUpdateStock(stockmodel);
	}
	

}
