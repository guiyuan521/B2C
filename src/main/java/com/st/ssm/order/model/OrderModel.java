package com.st.ssm.order.model;

import com.st.ssm.util.Pager;
 //订单信息表
public class OrderModel extends Pager{
	private Integer	id;			// id
	private String	code;		// 编号
	private String	userCode;	// 用户主键
	private String	time;		// 时间
	private String	addrId;		// 收获地址id
	private String	state;		// 状态（已发货或未发货）
	
	private int sum;
	
	
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public OrderModel(String code2) {
		this.code = code2;
	}
	public OrderModel() {
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
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddrId() {
		return addrId;
	}
	public void setAddrId(String addrId) {
		this.addrId = addrId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
