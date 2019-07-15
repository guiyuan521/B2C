package com.st.ssm.classification.model;

import com.st.ssm.util.Pager;

public class ClassificationModel extends Pager{
	
	private Integer id;
	private String code;
	private String name;
	private String parentCode;
	private String descr;
	
	public ClassificationModel() {
		
	}
	public ClassificationModel(String code) {
		this.code = code;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	@Override
	public String toString() {
		return "ClassificationModel [id=" + id + ", code=" + code + ", name=" + name + ", parentCode=" + parentCode
				+ ", descr=" + descr + "]";
	}
	
}
