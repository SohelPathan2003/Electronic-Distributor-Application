package electronic.distributor.repository;


import electronic.distributor.model.LoginModel;
import electronic.distributor.model.RegisterModel;
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

@Repository("logrepo")
public class ValidationRepositoryImpl implements ValidationRepository {
@Autowired
JdbcTemplate template;
int value =0;
List<RegisterModel> userProfie;
public ValidationRepositoryImpl() {
}

public List<LoginModel> isValidUser(LoginModel loginmodel) {
   List<LoginModel> list =template.query("select loginid,logintype,username,imageURL from loginvalidation where email=? and password =?", new PreparedStatementSetter() {

	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		ps.setString(1, loginmodel.getEmail());
		ps.setString(2,loginmodel.getPassword());
		
	}
	   
   }, new RowMapper<LoginModel>() {

	@Override
	public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		  loginmodel.setLoginId(rs.getInt("loginid"));
		  loginmodel.setLoginType(rs.getString("logintype"));
		  loginmodel.setUsername(rs.getString("username"));
		  loginmodel.setImageURL(rs.getString("imageURL"));
		return loginmodel;
	}
	   
   });
   return list;
}

public boolean isRegisterUser(RegisterModel registermodel) {
	try {
   value= template.update("CALL storelogin(?, ?, ?, ?, ?,?)",registermodel.getUserName(), registermodel.getEmail(), registermodel.getContact(), registermodel.getAddress(), registermodel.getPassword(),registermodel.getImageURL());
	}catch(DataAccessException e) {
		System.out.println(e);
		return false;
	}
     return value > 0?true:false;
}

@Override
public List<RegisterModel> getUserProfile(String email, String password) {
	
	userProfie=template.query("select * from clientmaster where email=? and password=?",new PreparedStatementSetter() {

		@Override
		public void setValues(PreparedStatement ps) throws SQLException {
			ps.setString(1, email);
			ps.setString(2, password);
			
		}
		
	}, new RowMapper<RegisterModel>() {

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
	
	return userProfie; 
}


}







