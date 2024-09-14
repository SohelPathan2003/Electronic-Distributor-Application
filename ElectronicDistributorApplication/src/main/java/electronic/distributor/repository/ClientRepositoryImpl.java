package electronic.distributor.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductCategoryModel;
import electronic.distributor.model.ProductModel;
import electronic.distributor.model.ProductOrderModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.model.StockDetailsModel;
import electronic.distributor.model.VendorModel;

@Repository("clientrepo")
public class ClientRepositoryImpl implements ClientRepository {
	List<ProductAllDetailsModel> productlist=null;
	@Autowired
	JdbcTemplate template;
	int result=0;
	

	
	 public List<ProductAllDetailsModel> getAllProductNameWise(String productname)
	  {
		 
			  
		 productlist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.features, ps.quantity,ps.sellingprice,vpc.imageURL from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid inner join product_stock ps on ps.productnumber=vpc.productnumber where p.productname like '%"+productname + "%' ",new RowMapper<ProductAllDetailsModel>() {
	  public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException { 
	  ProductAllDetailsModel productmodel=new ProductAllDetailsModel(); 
	  productmodel.setProductNumber(rs.getInt(1));
	  productmodel.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
	  productmodel.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
	  productmodel.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
	  productmodel.setDetails(rs.getString(8));
	  StockDetailsModel stockmodel=new StockDetailsModel();
	  stockmodel.setProductNumber(rs.getInt(1));
	  stockmodel.setQuantity(rs.getInt(9));
	  stockmodel.setSellingPrice(rs.getInt(10));
	  productmodel.setStockDetailsModel(stockmodel);
	  productmodel.setImageURL(rs.getString(11));
	  return productmodel;
	  
	  }
			  
			
	  });
		 return productlist;

}


	@Override
	public RegisterModel isUpdateProfile(RegisterModel registermodel) {
		RegisterModel updatedregistermodel=null;
		 template.update("call updateprofile(?,?,?,?)",registermodel.getClientId(),registermodel.getUserName(),registermodel.getContact(),registermodel.getAddress());
		 List<RegisterModel> list=template.query("select * from clientmaster where clientid="+registermodel.getClientId(),new RowMapper<RegisterModel>() {

			@Override
			public RegisterModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				RegisterModel registermodel=new RegisterModel();
				registermodel.setClientId(rs.getInt(1));
				registermodel.setUserName(rs.getString(2));
				registermodel.setEmail(rs.getString(3));
				registermodel.setContact(rs.getLong(4));
				registermodel.setAddress(rs.getString(5));
				registermodel.setPassword(rs.getString(6));
				return registermodel;
			}
			 
			 
		 });
		 updatedregistermodel=list.get(0);
		return updatedregistermodel;
	}


	@Override
	public ProductAllDetailsModel getSpecificProductDetailsByProductNumber(int productNumber) {
		productlist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features,vpc.imageURL,ps.sellingprice,ps.quantity from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid inner join product_stock ps on ps.productnumber=vpc.productnumber where vpc.productnumber="+productNumber, new RowMapper<ProductAllDetailsModel>() {

			@Override
			public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductAllDetailsModel model=new ProductAllDetailsModel();
				model.setProductNumber(rs.getInt(1));
				model.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
				model.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
				model.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
				model.setDate(rs.getString(8));
				model.setDetails(rs.getString(9));
				model.setImageURL(rs.getString(10));
				StockDetailsModel stockmodel=new StockDetailsModel();
				stockmodel.setSellingPrice(rs.getInt(11));
				stockmodel.setQuantity(rs.getInt(12));
				model.setStockDetailsModel(stockmodel);
				return model;
			}
		});
		return productlist.get(0);
	}


	
	public boolean isProductOrder(ProductOrderModel productordermodel) {
		result =template.update("insert into ordermaster values('0',?,?,?,?,?,curdate())",new PreparedStatementSetter() {

			
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1,productordermodel.getUserLoginId());
				ps.setInt(2, productordermodel.getProductNumber());
				ps.setInt(3,productordermodel.getQuantity());
				ps.setInt(4,productordermodel.getAmount());
				ps.setString(5,productordermodel.getAddress());
			
			
			}
			
		});
		result=template.update("update product_stock set quantity=quantity-? where productnumber=? ",new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1,productordermodel.getQuantity());
				ps.setInt(2, productordermodel.getProductNumber());
				
			}
			
		});
		
		return result>0?true:false;
	}


	List<ProductOrderModel>productorderlist=null;
	public List<ProductOrderModel> getOrderListByUserId(int userloginid) {
		productorderlist=template.query("select p.productname,pc.productcategoryname,om.orderid,om.quantity,om.amount,om.address,om.date,vpc.imageURL from vendorproductcategory vpc inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid inner join ordermaster om on om.productnumber=vpc.productnumber where om.userid="+userloginid, new RowMapper<ProductOrderModel>() {

			@Override
			public ProductOrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductOrderModel ordermodel=new ProductOrderModel();
				ordermodel.setProductName(rs.getString(1));
				ordermodel.setProductCategory(rs.getString(2));
				ordermodel.setOrderId(rs.getInt(3));
				ordermodel.setQuantity(rs.getInt(4));
				ordermodel.setAmount(rs.getInt(5));
				ordermodel.setAddress(rs.getString(6));
				ordermodel.setDate(rs.getDate(7).toString());
				ordermodel.setImageURL(rs.getString(8));
				
				return ordermodel;
			}
			
		});
		return productorderlist;
	}


	@Override
	public RegisterModel getUserProfileById(int userloginid) {
		RegisterModel profileregistermodel=null;
	
		 List<RegisterModel> list=template.query(" select c.clientid,c.username,c.email,c.contact,c.address,c.password,lg.imageURL from clientmaster c inner join loginvalidation lg on lg.sublogid=c.clientid where lg.loginid="+userloginid,new RowMapper<RegisterModel>() {

			@Override
			public RegisterModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				RegisterModel registermodel=new RegisterModel();
				registermodel.setClientId(rs.getInt(1));
				registermodel.setUserName(rs.getString(2));
				registermodel.setEmail(rs.getString(3));
				registermodel.setContact(rs.getLong(4));
				registermodel.setAddress(rs.getString(5));
				registermodel.setPassword(rs.getString(6));
				registermodel.setImageURL(rs.getString(7));
				return registermodel;
			}
			 
			 
		 });
		 profileregistermodel=list.get(0);
		return profileregistermodel;
	}
}