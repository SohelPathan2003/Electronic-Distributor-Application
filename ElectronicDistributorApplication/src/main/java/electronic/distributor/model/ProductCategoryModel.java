package electronic.distributor.model;

public class ProductCategoryModel {
	private String productCategoryName;
	private int productCategoryId;
	public String getProductCategoryName() {
		return productCategoryName;
	}
	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	public int getProductCategoryId() {
		return productCategoryId;
	}
	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
	public ProductCategoryModel() {
		super();
	}
	public ProductCategoryModel(int productCategoryId,String productCategoryName) {
		super();
		this.productCategoryName = productCategoryName;
		this.productCategoryId = productCategoryId;
	}
}
