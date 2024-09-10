package electronic.distributor.model;

import java.util.Date;

public class ProductAllDetailsModel {

	private VendorModel vendorModel;

	public VendorModel getVendorModel() {
		return vendorModel;
	}

	private String imageURL;

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public ProductAllDetailsModel() {
		super();
	}

	public ProductAllDetailsModel(int productNumber, VendorModel vendorModel, ProductModel productModel,
			ProductCategoryModel productCategoryModel, String date, String details) {
		super();
		this.productNumber = productNumber;
		this.vendorModel = vendorModel;
		this.productModel = productModel;
		this.productCategoryModel = productCategoryModel;
		this.date = date;
		this.details = details;
	}

	public ProductAllDetailsModel(int productNumber, VendorModel vendorModel, ProductModel productModel,
			ProductCategoryModel productCategoryModel, String date, String details, String imageURL) {
		super();
		this.productNumber = productNumber;
		this.vendorModel = vendorModel;
		this.productModel = productModel;
		this.productCategoryModel = productCategoryModel;
		this.date = date;
		this.details = details;
		this.imageURL = imageURL;
	}

	private int productNumber;

	public int getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}

	public void setVendorModel(VendorModel vendorModel) {
		this.vendorModel = vendorModel;
	}

	public ProductCategoryModel getProductCategoryModel() {
		return productCategoryModel;
	}

	public void setProductCategoryModel(ProductCategoryModel productCategoryModel) {
		this.productCategoryModel = productCategoryModel;
	}

	public ProductModel getProductModel() {
		return productModel;
	}

	public void setProductModel(ProductModel productModel) {
		this.productModel = productModel;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	private ProductCategoryModel productCategoryModel;
	private ProductModel productModel;
	private String date;
	private String details;
	private StockDetailsModel stockDetailsModel;

	public StockDetailsModel getStockDetailsModel() {
		return stockDetailsModel;
	}

	public void setStockDetailsModel(StockDetailsModel stockDetailsModel) {
		this.stockDetailsModel = stockDetailsModel;
	}

}
