package com.st.ssm.shoppingCart.controller;



import java.util.HashMap;
//import java.util.HashMap;
import java.util.List;
//import java.util.Map;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.ssm.shoppingCart.model.ShoppingCartModel;
import com.st.ssm.shoppingCart.service.IShoppingCartService;
import com.st.ssm.user.model.UserModel;
import com.st.ssm.util.FmtEmpty;

@Controller
@RequestMapping("/cart")
public class ShoppingCartController {
	
	@Autowired
	private IShoppingCartService iShoppingCartService;
	
	
	@ResponseBody
	@RequestMapping("/add")
	public int add(ShoppingCartModel model,HttpSession session) {
		
		Object obj = session.getAttribute("user");
		if(obj == null) {
			return 2;
		}
		ShoppingCartModel sModel = new ShoppingCartModel();
		sModel.setUserCode(((UserModel) obj).getCode());
		sModel.setInforCode(model.getInforCode());
		
		List<ShoppingCartModel> list = iShoppingCartService.selectList(sModel);
		if(FmtEmpty.isEmpty(list)) {
			sModel.setSum(1);
			return iShoppingCartService.insert(sModel);
		}else {
			sModel = list.get(0);
			sModel.setSum(sModel.getSum()+1);
			return iShoppingCartService.update(sModel);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectList", produces = "application/json;charset=UTF-8")
	public String selectList(ShoppingCartModel model,HttpSession session) {
		Object obj = session.getAttribute("user");
	
		ShoppingCartModel model1 = new ShoppingCartModel();
		model1.setUserCode(((UserModel) obj).getCode());
		
		List<ShoppingCartModel> list = iShoppingCartService.selectList(model1);
		Map<String,Object> map = new HashMap<>();
	    map.put("list", list);
		return new JSONObject(map).toString();	
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectListID", produces = "application/json;charset=UTF-8")
	public String selectList1(ShoppingCartModel model) {
		
		ShoppingCartModel model1 = iShoppingCartService.selectList1(model);
		return new JSONObject(model1).toString();
	}
	@ResponseBody
	@RequestMapping("/updSum")
	public int updSum(ShoppingCartModel model) {
		return iShoppingCartService.updSum(model);	
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public int del(ShoppingCartModel model) {
		return iShoppingCartService.del(model);	
	}
	
}
