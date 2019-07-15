package com.st.ssm.shoppingCart.model;

import com.st.ssm.util.Pager;

public class ShoppingCartModel extends Pager{

	private Integer id;
	private String userCode;
	private String inforCode;
	private int sum;
	
	private String pcost;
	private String pname;
	private String purl1;
	
	
	public String getPurl1() {
		return purl1;
	}
	public void setPurl1(String purl1) {
		this.purl1 = purl1;
	}
	public String getPcost() {
		return pcost;
	}
	public void setPcost(String pcost) {
		this.pcost = pcost;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getInforCode() {
		return inforCode;
	}
	public void setInforCode(String inforCode) {
		this.inforCode = inforCode;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	@Override
	public String toString() {
		return "ShoppingCartModel [id=" + id + ", userCode=" + userCode + ", inforCode=" + inforCode + ", sum=" + sum
				+ ", pcost=" + pcost + ", pname=" + pname + ", purl1=" + purl1 + "]";
	}
	
	
	
}
