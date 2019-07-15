package com.st.ssm.information.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.st.ssm.information.model.InformationModel;
import com.st.ssm.information.service.IInformationService;


@Controller
@RequestMapping("/information")
public class InformationController {
	@Autowired
	private IInformationService informationService;
	
	@ResponseBody
	@RequestMapping(value = "/selectModel", produces = "application/json;charset=UTF-8")
	public Map<String,Object> selectModel(InformationModel model) {
		List<InformationModel> list = informationService.selectModel(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", informationService.selectCount(model));
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public int add(InformationModel model) {
		return informationService.insertByCode(model);
	}
	@ResponseBody
	@RequestMapping("/del")
	public int del(InformationModel model) {
		return informationService.delete(model);
	}
	@ResponseBody
	@RequestMapping("/upd")
	public int update(InformationModel model) {
		return informationService.update(model);
	}
	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=UTF-8")
	public String search(InformationModel model) {
		String code = model.getCode();
		InformationModel im= informationService.selectList(new InformationModel(code));
		return model == null ? "" : new JSONObject(im).toString();
	}
	
}
