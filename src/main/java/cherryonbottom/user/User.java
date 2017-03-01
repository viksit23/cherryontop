package cherryonbottom.user;

import javax.persistence.Transient;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
@Entity
public class User 
{
@Id @GeneratedValue(strategy=GenerationType.AUTO)
	
private long uId;	
private String uName;
private String uEmail;
private String uPassword;
@Transient
private String uCPassword;
private String uAddress;
private String uPhone;
public long getuId() {
	return uId;
}
	private String Role= "ROLE_USER";
	private boolean Active = true;

public void setuId(long uId) {
	this.uId = uId;
}
@NotEmpty(message="Username Field is Mandatory")
public String getuName() {
	return uName;
}
public void setuName(String uName) {
	this.uName = uName;
}
@NotEmpty(message="Email Field is Mandatory")
public String getuEmail() {
	return uEmail;
}
public void setuEmail(String uEmail) {
	this.uEmail = uEmail;
}
@NotEmpty(message="Password Field is Mandatory")
public String getuPassword() {
	return uPassword;
}
public void setuPassword(String uPassword) {
	this.uPassword = uPassword;
}
@NotEmpty(message="Password Field is Mandatory")
public String getuCPassword() {
	return uCPassword;
}
public void setuCPassword(String uCPassword) {
	this.uCPassword = uCPassword;
}
@NotEmpty(message="Address field is Mandatory")
public String getuAddress() {
	return uAddress;
}
public void setuAddress(String uAddress) {
	this.uAddress = uAddress;
}
@NotEmpty(message="Phone Number Field is Mandatory")
@Length(max= 10, min=10, message="Phone number is not valid. Should be of 10 Digits")
public String getuPhone() {
	return uPhone;
}
public void setuPhone(String uPhone) {
	this.uPhone = uPhone;
}

public String getRole() {
	return Role;
}
public void setRole(String role) {
	Role = role;
}
public boolean isActive() {
	return Active;
}
public void setActive(boolean active) {
	Active = active;
}

}
