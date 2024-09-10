package electronic.distributor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductCategoryModel;
import electronic.distributor.model.ProductModel;
import electronic.distributor.repository.ProductRepository;

@Service("productservice")
public class ProductServiceImpl  implements ProductService{

	
	@Autowired
	ProductRepository productrepo;
	@Override
	public List<ProductCategoryModel> getAllProductCategoryList() {
		return productrepo.getAllProductCategoryList();
	}

	@Override
	public List<ProductModel> getAllProductList() {
		return productrepo.getAllProductList();
	}
	
	public boolean isAddProductCategory(ProductCategoryModel model){
		return productrepo.isAddProductCategory(model);
	}

	@Override
	public boolean isAddProduct(ProductModel model) {
		
		return productrepo.isAddProduct(model);
	}

	public boolean isAddProductWithDetails(ProductAllDetailsModel productwithdetails) {
		
		return productrepo.isAddProductWithDetails(productwithdetails);
	}


	public List<ProductAllDetailsModel> getAllProductWithDetails() {
		
		return productrepo.getAllProductWithDetails();
	}

	@Override
	public void deleteProductByNumber(int productnumber) {
		
		productrepo.deleteProductByNumber(productnumber);
	}

	@Override
	public boolean isUpdateAddProductWithDetails(ProductAllDetailsModel productwithdetails) {
		// TODO Auto-generated method stub
		return productrepo.isUpdateAddProductWithDetails(productwithdetails);
	}

	@Override
	public List<ProductAllDetailsModel> searchByProductName(String str) {
		
		return productrepo.searchByProductName(str);
	}

	@Override
	public List<ProductAllDetailsModel> searchProductByVendorName(String str) {
		// TODO Auto-generated method stub
		return productrepo.searchProductByVendorName(str);
	}

	@Override
	public List<ProductAllDetailsModel> searchByProductCategoryName(String str) {
		// TODO Auto-generated method stub
		return productrepo.searchByProductCategoryName(str);
	}

	@Override
	public List<ProductAllDetailsModel> searchProductByDate(String str) {
		return productrepo.searchProductByDate(str);
	}

	@Override
	public List<ProductAllDetailsModel> searchProductByFeature(String str) {
		
		return productrepo.searchProductByFeature(str);
	}
	
	

}
