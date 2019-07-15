package com.st.ssm.order.model;
 //订单商品表
public class OrderGoodsModel {

	private Integer id;
	private String orderCode;//订单编号
	private String inforCode;//商品编号
	private String sum;//数量
	private String price;//价格
	
	private String name;
	private String name2;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getInforCode() {
		return inforCode;
	}
	public void setInforCode(String inforCode) {
		this.inforCode = inforCode;
	}
	
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
