package base.dtos;

import java.io.Serializable;
import java.sql.Date;

public class UserResquestDTO implements Serializable{
	private int id;
	private String name;
	private String email;
	private String password;
	private Date createDate;
	private Date updateDate;
	private String role;
	private String address;
	private String phone;
	private boolean locked;
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public String  getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	
	
	public UserResquestDTO() {
		
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public boolean getLocked() {
		return locked;
	}


	public void setLocked(boolean locked) {
		this.locked = locked;
	}


	@Override
	public String toString() {
		return "UserResquestDTO [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + ", role=" + role + ", phone=" + phone
				+ ", locked=" + locked + ", getId()=" + getId() + ", getName()=" + getName() + ", getEmail()="
				+ getEmail() + ", getPassword()=" + getPassword() + ", getCreateDate()=" + getCreateDate()
				+ ", getUpdateDate()=" + getUpdateDate() + ", getRole()=" + getRole() + ", getPhone()=" + getPhone()
				+ ", getLocked()=" + getLocked() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
