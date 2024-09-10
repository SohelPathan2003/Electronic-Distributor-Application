package electronic.distributor.repository;

import java.util.List;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.StockDetailsModel;

public interface StockManagementRepository {


	public List<ProductAllDetailsModel> getAllProductsWithDetails();
	public boolean isUpdateStock(StockDetailsModel stockmodel);
}
