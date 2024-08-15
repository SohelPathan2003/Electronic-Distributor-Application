package electronic.distributor.repository;

import electronic.distributor.model.VendorModel;

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

@Repository("adminRepo")
public class AdminRepositoryImpl implements AdminRepository {
@Autowired
JdbcTemplate template;
int result=0;
public AdminRepositoryImpl() {
}

public boolean isAddVendor(VendorModel vendormodel) {
	result=0;
   try {
	   result =template.update("insert into vendormaster values('0',?,?,?,?)", new PreparedStatementSetter() {

		@Override
		public void setValues(PreparedStatement ps) throws SQLException {
			
			ps.setString(1, vendormodel.getVendorName());
			ps.setString(2, vendormodel.getEmail());
			ps.setLong(3,vendormodel.getContact());
			ps.setString(4, vendormodel.getAddress());
		}
    	  
      });
   } catch (DataAccessException e) {
      System.out.println("Error is  "+e);
      return false;
   }

   return result > 0?true:false;
}

public List<VendorModel> getAllVendorList() {
   List<VendorModel> list =template.query("select vendorid,vendorname,email from vendormaster",new RowMapper<VendorModel>() {

	@Override
	public VendorModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		VendorModel vendormodel=new VendorModel();
		vendormodel.setVendorId(rs.getInt("vendorid"));
		vendormodel.setVendorName(rs.getString("vendorname"));
	    vendormodel.setEmail(rs.getString("email"));
		return vendormodel;
	}
	   
   });
   return list;
}

public void deleteVendorById(int vendorid) {
   this.template.update("delete from vendormaster where vendorid=" + vendorid);
}
@Override
public boolean isUpdateVendor(VendorModel vendormodel) {
	
	try {
	result=template.update("update vendormaster set vendorname=?,email=? where vendorid=?",new PreparedStatementSetter() {

		
		@Override
		public void setValues(PreparedStatement ps) throws SQLException {
			ps.setString(1, vendormodel.getVendorName());
			ps.setString(2,vendormodel.getEmail());
			ps.setInt(3,vendormodel.getVendorId());
		}
		
	});
	}catch(DataAccessException e) {
		System.out.println(e);
		return false;
	}
	return result>0?true:false;
}

@Override
public List<VendorModel> searchVendorByName(String str) {
	List<VendorModel> list =template.query("select vendorid,vendorname,email from vendormaster where vendorname like '%" + str + "%'",new RowMapper<VendorModel>() {

		@Override
		public VendorModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			VendorModel vendormodel=new VendorModel();
			vendormodel.setVendorId(rs.getInt("vendorid"));
			vendormodel.setVendorName(rs.getString("vendorname"));
		    vendormodel.setEmail(rs.getString("email"));
			return vendormodel;
		}
		   
	   });
	   return list;
}
}


