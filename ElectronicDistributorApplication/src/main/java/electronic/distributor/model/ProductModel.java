package electronic.distributor.model;

public class ProductModel {
	private String productName;
	private int productId;
	private int ProductPrice;
	public String getProductName() {
		return productName;
	}
	public ProductModel(int productId,String productName) {
		this.productName = productName;
		this.productId = productId;
	}
	
	public ProductModel() {
		
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getProductPrice() {
		return ProductPrice;
	}
	public void setProductPrice(int productPrice) {
		ProductPrice = productPrice;
	}
	

}
