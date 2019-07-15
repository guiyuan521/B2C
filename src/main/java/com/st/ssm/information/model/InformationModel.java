package com.st.ssm.information.model;

import com.st.ssm.util.Pager;

public class InformationModel extends Pager{
	private Integer id;
	private String code;
	private  String name;
	private  String price;  //单价
	private  String descr;  //描述
	private  String count; //库存
	private  String  state;  //状态 上架，下架
	private  String  classCode;  //商品分类主键
	
	private String code1;// 下拉框关联时所用虚拟字段
	
	
	
	
	
	
	public InformationModel(String code2) {
		this.code = code2;
	}
	public InformationModel() {
	}
	public String getCode1() {
		return code1;
	}
	public void setCode1(String code1) {
		this.code1 = code1;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	
}
