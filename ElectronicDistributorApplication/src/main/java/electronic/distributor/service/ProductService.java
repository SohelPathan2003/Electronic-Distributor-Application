package electronic.distributor.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductCategoryModel;
import electronic.distributor.model.ProductModel;

public interface ProductService {
	public List<ProductCategoryModel> getAllProductCategoryList();
	public List<ProductModel> getAllProductList();
	public boolean isAddProductCategory(ProductCategoryModel model);
	public boolean isAddProduct(ProductModel model);
	public boolean isAddProductWithDetails(ProductAllDetailsModel productwithdetails);
	public List<ProductAllDetailsModel> getAllProductWithDetails();
	public void deleteProductByNumber(int productnumber);
	public boolean isUpdateAddProductWithDetails(ProductAllDetailsModel productwithdetails);
	public List<ProductAllDetailsModel> searchByProductName(String str);
	public List<ProductAllDetailsModel>searchProductByVendorName(String str);
	public List<ProductAllDetailsModel> searchByProductCategoryName(String str);
	public List<ProductAllDetailsModel> searchProductByDate(String str) ;
	public List<ProductAllDetailsModel> searchProductByFeature(String str) ;
}
