package electronic.distributor.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import electronic.distributor.model.ProductAllDetailsModel;
import electronic.distributor.model.ProductCategoryModel;
import electronic.distributor.model.ProductModel;
import electronic.distributor.model.StockDetailsModel;
import electronic.distributor.model.VendorModel;

@Repository("stockrepo")
public class StockManagementRepositoryImpl implements StockManagementRepository{

	int value=0;
	@Autowired
	JdbcTemplate template;
	 List<ProductAllDetailsModel> productdetailslist=null;
	 List<StockDetailsModel> stockdetailslist=null;
	public List<ProductAllDetailsModel> getAllProductsWithDetails() {
		productdetailslist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features,vpc.imageURL from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid order by productnumber desc", new RowMapper<ProductAllDetailsModel>() {

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
				return model;
			}
		});
		
		stockdetailslist=template.query("select * from product_stock", new RowMapper<StockDetailsModel>() {

			public StockDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				StockDetailsModel model=new StockDetailsModel();
				model.setProductNumber(rs.getInt("productnumber"));
				model.setQuantity(rs.getInt("quantity"));
				model.setCostPrice(rs.getInt("costprice"));
				model.setSellingPrice(rs.getInt("sellingprice"));
				return model;
			}
			
		});
		
		List<ProductAllDetailsModel> list=new ArrayList<ProductAllDetailsModel>();
		if(stockdetailslist.size()>0) {
			for(ProductAllDetailsModel model:productdetailslist) {
				for(StockDetailsModel stock:stockdetailslist) {
					if(stock.getProductNumber()==model.getProductNumber()) {
						model.setStockDetailsModel(stock);
					}
				}
				list.add(model);
			}
				return list;
			
		}else {
			
			return productdetailslist;
		}
		
		
		
			
		
		
		
	}
	@Override
	public boolean isUpdateStock(StockDetailsModel stockmodel) {
		stockdetailslist=null;
		
		try {
		stockdetailslist=template.query("select quantity from product_stock where productnumber="+stockmodel.getProductNumber(),new RowMapper<StockDetailsModel>() {

			@Override
			public StockDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				StockDetailsModel model=new StockDetailsModel();
				model.setQuantity(rs.getInt(1));
				return model;
			}
			
		});
		
		if(stockdetailslist.size()>0) {
			value=template.update("update product_stock set quantity=?,costprice=?,sellingprice=? where productnumber=?",new PreparedStatementSetter() {

				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setInt(1,stockmodel.getQuantity()+stockdetailslist.get(0).getQuantity());
					ps.setInt(2,stockmodel.getCostPrice());
					ps.setInt(3, stockmodel.getSellingPrice());
					ps.setInt(4,stockmodel.getProductNumber());
				}
				
			});
		}else {
			
			value=template.update("insert into product_stock values(?,?,?,?)",new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setInt(1, stockmodel.getProductNumber());
					ps.setInt(2, stockmodel.getQuantity());
					ps.setInt(3, stockmodel.getCostPrice());
					ps.setInt(4, stockmodel.getSellingPrice());
					
				}
				
			});
		}
		
		}catch(DataAccessException error) {
			return false;
		}
		if(value>0) {
			return true;
		}else
			return false;
	}
	

}
