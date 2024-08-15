package electronic.distributor.repository;


import electronic.distributor.model.LoginModel;
import electronic.distributor.model.RegisterModel;
import electronic.distributor.model.VendorModel;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("logrepo")
public class ValidationRepositoryImpl implements ValidationRepository {
@Autowired
JdbcTemplate template;
int value =0;
public ValidationRepositoryImpl() {
}

public List<LoginModel> isValidUser(LoginModel loginmodel) {
   List<LoginModel> list =template.query("select logintype,username from loginvalidation where email=? and password =?", new PreparedStatementSetter() {

	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		ps.setString(1, loginmodel.getEmail());
		ps.setString(2,loginmodel.getPassword());
		
	}
	   
   }, new RowMapper<LoginModel>() {

	@Override
	public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		  loginmodel.setLoginType(rs.getString("logintype"));
		  loginmodel.setUsername(rs.getString("username"));
		return loginmodel;
	}
	   
   });
   return list;
}

public boolean isRegisterUser(RegisterModel registermodel) {
   value= template.update("CALL storeclient(?, ?, ?, ?, ?)",registermodel.getUserName(), registermodel.getEmail(), registermodel.getContact(), registermodel.getAddress(), registermodel.getPassword());
   return value > 0?true:false;
}


}







