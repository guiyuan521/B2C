package com.st.ssm.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.st.ssm.order.model.OrderGoodsModel;
import com.st.ssm.order.service.IOrderGoodsService;

@Controller
@RequestMapping("/orderGoods")
public class OrderGoodsController {

	@Autowired
	private IOrderGoodsService service;
	
	@ResponseBody
	@RequestMapping(value="/insert",produces="application/json;charset=UTF-8")
	public String insert(OrderGoodsModel model) {
//		System.out.println(model.getOrderCode());
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("up",service.insert(model));
		return new JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/list",produces="application/json;charset=UTF-8")
	public String list(OrderGoodsModel model) {
		String orderCode = model.getOrderCode();
		//System.out.println("99999999999====="+orderCode);
		List<OrderGoodsModel>  list = service.selectByOrderCode(orderCode);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return new JSONObject(map).toString();
	}
	
	@ResponseBody	
	@RequestMapping("/del")
	public int del(OrderGoodsModel model) {
		String orderCode = model.getOrderCode();
		return service.delete(orderCode);	
	}
	
}
