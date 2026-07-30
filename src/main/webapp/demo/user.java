package com.demo;

public class user {

	
	String fullname;
	String emailorphone;
	String password;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmailorphone() {
		return emailorphone;
	}
	public void setEmailorphone(String emailorphone) {
		this.emailorphone = emailorphone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "user [fullname=" + fullname + ", emailorphone=" + emailorphone + ", password=" + password + "]";
	}
	
	
	
	
}
