package electronic.distributor.service;

import java.util.List;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.StockDetailsModel;

public interface StockManagementService {

	public List<ProductAllDetailsModel> getAllProductsWithDetails();
	public boolean isUpdateStock(StockDetailsModel stockmodel);
	
}

