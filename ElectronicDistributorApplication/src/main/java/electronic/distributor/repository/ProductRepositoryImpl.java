package electronic.distributor.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import electronic.distributor.model.VendorModel;

@Repository("productrepo")
public class ProductRepositoryImpl implements ProductRepository{

	@Autowired
	JdbcTemplate template;
	List<ProductModel> productlist=null;
	List<ProductAllDetailsModel> productdetailslist=null;
	int result=0;
	List<ProductCategoryModel> productcategorylist=null;
	public List<ProductCategoryModel> getAllProductCategoryList() {
		
		productcategorylist=template.query("select * from productcategory",new RowMapper<ProductCategoryModel>() {

			
			public ProductCategoryModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductCategoryModel model=new ProductCategoryModel();
				model.setProductCategoryId(rs.getInt("productcategoryid"));
				model.setProductCategoryName(rs.getString("productcategoryname"));
				return model;
			}
			
		});
		
		return productcategorylist;
	}

	@Override
	public List<ProductModel> getAllProductList() {
		
		
		productlist = template.query("select * from product", new RowMapper<ProductModel>() {

			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel model=new ProductModel();
				model.setProductId(rs.getInt(1));
				model.setProductName(rs.getString(2));
				return model;
			}
			
		});
		return productlist;
	}

	@Override
	public boolean isAddProductCategory(ProductCategoryModel model) {
		
		result=template.update("insert into productcategory values('0',?)",new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, model.getProductCategoryName());				
			}
			
		});
		return result>0?true:false ;
	}

	@Override
	public boolean isAddProduct(ProductModel model) {
		
		result=template.update("insert into product values('0',?)",new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1,model.getProductName());
			}
			
		});
		
		return result>0?true:false;
	}

	@Override
	public boolean isAddProductWithDetails(ProductAllDetailsModel productwithdetails) {
		
		result=template.update("insert into vendorproductcategory values(?,?,?,?,?,'0',?)",new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1,productwithdetails.getVendorModel().getVendorId() );
				ps.setInt(2, productwithdetails.getProductModel().getProductId());
				ps.setInt(3, productwithdetails.getProductCategoryModel().getProductCategoryId());
				ps.setString(4, productwithdetails.getDate());
				ps.setString(5,productwithdetails.getDetails());
				ps.setString(6,productwithdetails.getImageURL() );
				
			}
			
		});
		
		return result>0?true:false;
	}

	public List<ProductAllDetailsModel> getAllProductWithDetails() {
		productdetailslist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid order by productnumber", new RowMapper<ProductAllDetailsModel>() {

			@Override
			public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductAllDetailsModel model=new ProductAllDetailsModel();
				model.setProductNumber(rs.getInt(1));
				model.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
				model.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
				model.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
				model.setDate(rs.getString(8));
				model.setDetails(rs.getString(9));
				return model;
			}
		});
		
		return productdetailslist;
	}

	public void deleteProductByNumber(int productnumber) {
		
		template.update("delete from vendorproductcategory where productnumber="+productnumber);
	}

	@Override
	public boolean isUpdateAddProductWithDetails(ProductAllDetailsModel productwithdetails) {
		
		try {
		result=template.update("update vendorproductcategory set vendorid=?,productid=?,productcategoryid=?,startingdate=?,features=? where productnumber=?",new PreparedStatementSetter() {

			public void setValues(PreparedStatement ps) throws SQLException {
			
				ps.setInt(1,productwithdetails.getVendorModel().getVendorId() );
				ps.setInt(2, productwithdetails.getProductModel().getProductId());
				ps.setInt(3, productwithdetails.getProductCategoryModel().getProductCategoryId());
				ps.setString(4,productwithdetails.getDate());
				ps.setString(5,productwithdetails.getDetails());
				ps.setInt(6,productwithdetails.getProductNumber());
			}
			
		});
		}catch(DataAccessException e) {
			return false;
		}
		return result>0?true:false;
	}

	
	public List<ProductAllDetailsModel> searchByProductName(String str) {
		productdetailslist=null;
		productdetailslist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid where p.productname  like '%" + str + "%' order by productnumber", new RowMapper<ProductAllDetailsModel>() {

			@Override
			public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductAllDetailsModel model=new ProductAllDetailsModel();
				model.setProductNumber(rs.getInt(1));
				model.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
				model.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
				model.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
				model.setDate(rs.getString(8));
				model.setDetails(rs.getString(9));
				return model;
			}
		});
		
		return productdetailslist;
	}

	@Override
	public List<ProductAllDetailsModel> searchProductByVendorName(String str) {
		productdetailslist=null;
		productdetailslist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid where vm.vendorname  like '%" + str + "%' order by productnumber", new RowMapper<ProductAllDetailsModel>() {

			@Override
			public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductAllDetailsModel model=new ProductAllDetailsModel();
				model.setProductNumber(rs.getInt(1));
				model.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
				model.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
				model.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
				model.setDate(rs.getString(8));
				model.setDetails(rs.getString(9));
				return model;
			}
		});
		
		return productdetailslist;
	}

	@Override
	public List<ProductAllDetailsModel> searchByProductCategoryName(String str) {
		productdetailslist=null;
		productdetailslist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid where pc.productcategoryname  like '%" + str + "%' order by productnumber", new RowMapper<ProductAllDetailsModel>() {

			@Override
			public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductAllDetailsModel model=new ProductAllDetailsModel();
				model.setProductNumber(rs.getInt(1));
				model.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
				model.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
				model.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
				model.setDate(rs.getString(8));
				model.setDetails(rs.getString(9));
				return model;
			}
		});
		
		return productdetailslist;
	}

	@Override
	public List<ProductAllDetailsModel> searchProductByDate(String str) {
		productdetailslist=null;
		productdetailslist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid where vpc.startingdate  like '%" + str + "%' order by productnumber", new RowMapper<ProductAllDetailsModel>() {

			@Override
			public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductAllDetailsModel model=new ProductAllDetailsModel();
				model.setProductNumber(rs.getInt(1));
				model.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
				model.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
				model.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
				model.setDate(rs.getString(8));
				model.setDetails(rs.getString(9));
				return model;
			}
		});
		
		return productdetailslist;
	}

	@Override
	public List<ProductAllDetailsModel> searchProductByFeature(String str) {
		productdetailslist=null;
		productdetailslist=template.query("select vpc.productnumber, vm.vendorid,p.productid,pc.productcategoryid, vm.vendorname,p.productname,pc.productcategoryname,vpc.startingdate,vpc.features from vendormaster vm inner join vendorproductcategory vpc on vm.vendorid=vpc.vendorid inner join product p on p.productid=vpc.productid inner join productcategory pc on pc.productcategoryid=vpc.productcategoryid where vpc.features  like '%" + str + "%' order by productnumber", new RowMapper<ProductAllDetailsModel>() {

			@Override
			public ProductAllDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductAllDetailsModel model=new ProductAllDetailsModel();
				model.setProductNumber(rs.getInt(1));
				model.setVendorModel(new VendorModel(rs.getInt(2),rs.getString(5)));
				model.setProductModel(new ProductModel(rs.getInt(3),rs.getString(6)));
				model.setProductCategoryModel(new ProductCategoryModel(rs.getInt(4),rs.getString(7)));
				model.setDate(rs.getString(8));
				model.setDetails(rs.getString(9));
				return model;
			}
		});
		
		return productdetailslist;
	}

}
