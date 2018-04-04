package com.mvc.model;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@FieldEquals( field="psw", equalsTo="repsw", message = "Passwords are not equal")
public class User {
	
	@Pattern(regexp="[a-zA-Z]{1}[a-zA-Z\\d\\u002E\\u005F]+@([a-zA-Z]+\\u002E){1,2}((net)|(com)|(org))", message = "Please enter a correct e-mail address for field LOGIN")
	@NotNull(message = "Field LOGIN cannot be null")
	private String login;
	@NotNull(message = "Field NAME cannot be null")
	@Size(min=1, max=12, message = "Please enter a value for field NAME between 1 and 12 character")
	private String name;
	@NotNull(message = "Field cannot be null")
	@Size(min=6, max=8, message = "Please enter a value for field PASSWORD between 6 and 8 character")
	private String psw;
	
	private String repsw;
	@NotNull(message = "Field AREA cannot be null")
	private String area;
	@NotNull(message = "Field GENDER cannot be null")
	private String gender;
	
	public User() {
	
	}
	
	public User(String login, String psw) {
		super();
		this.login = login;
		this.psw = psw;
	}
	
	public User(String login, String name, String psw, String area, String gender) {
		super();
		this.login = login;
		this.name = name;
		this.psw = psw;
		this.area = area;
		this.gender = gender;
	}


	public String getRepsw() {
		return repsw;
	}

	public void setRepsw(String repsw) {
		this.repsw = repsw;
	}

	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}

	@Override
	public String toString() {
		return "User1 [login=" + login + ", name=" + name + ", psw=" + psw + ", repsw=" + repsw+ ", area=" + area + ", gender=" + gender
				+ "]";
	}

	
	
	
}
