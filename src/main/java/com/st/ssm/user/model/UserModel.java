package com.st.ssm.user.model;

import com.st.ssm.util.Pager;

public class UserModel extends Pager{
	 private Integer id;
	 private String code;
	 private String pass;
	 private String name;
	 
	 
	 private String isManage;//0是管理员 1是用户
	 
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public UserModel(String code) {
		this.code = code;
	}
	public UserModel() {
		
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsManage() {
		return isManage;
	}
	public void setIsManage(String isManage) {
		this.isManage = isManage;
	}
	
	 
	 
}
