package com.st.ssm.order.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.ssm.order.model.OrderModel;
import com.st.ssm.order.service.IOrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private IOrderService iorderService;
	
	@ResponseBody
	@RequestMapping(value="/selectModel",produces="application/json;charset=UTF-8")
	public Map<String,Object> selectModel(OrderModel model){
		List<OrderModel> list = iorderService.selectModel(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", iorderService.selectCount(model));
		return map;
	}
	@ResponseBody
	@RequestMapping("/del")
	public int del(OrderModel model) {
		return iorderService.delete(model);
	}
	@ResponseBody
	@RequestMapping("/upd")
	public int update(OrderModel model) {
		return iorderService.update(model);
	}
	
	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=UTF-8")
	public String search(OrderModel model) {
		String code = model.getCode();
		OrderModel om = iorderService.select(new OrderModel(code));
		return model == null ? "" : new JSONObject(om).toString();
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/insert",produces="application/json;charset=UTF-8")
	public String insert(OrderModel model) {
		String str = new SimpleDateFormat("yyMMddHHmm").format(new Date()); 	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=df.format(new Date()).toString();
		int a=(int)Math.random()*1000000;	
		String orderCode = "o" + str + a;	
		model.setCode(orderCode);
		model.setTime(time);
		iorderService.insert(model);	
		return orderCode;
	}
	@ResponseBody
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public String list(OrderModel model) {
		List<OrderModel> list = iorderService.selectModel(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", iorderService.selectCount(model));
		return new JSONObject(map).toString();
	}
	@ResponseBody
	@RequestMapping(value="/user",produces="application/json;charset=UTF-8")
	public String user(OrderModel model) {
		List<OrderModel> list = iorderService.selectUser(model);
		return new JSONArray(list).toString();
	}
	
}
