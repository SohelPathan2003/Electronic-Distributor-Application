package electronic.distributor.model;
public class LoginModel {
private String username;
private String password;
private String loginType;
private String email;

public LoginModel() {
}

public String getLoginType() {
   return this.loginType;
}

public void setLoginType(String loginType) {
   this.loginType = loginType;
}

public String getUsername() {
   return this.username;
}

public void setUsername(String username) {
   this.username = username;
}

public String getPassword() {
   return this.password;
}

public void setPassword(String password) {
   this.password = password;
}

public String getEmail() {
   return this.email;
}

public void setEmail(String email) {
   this.email = email;
}
}
