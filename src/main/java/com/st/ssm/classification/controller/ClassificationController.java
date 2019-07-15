package com.st.ssm.classification.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.ssm.classification.model.ClassificationModel;
import com.st.ssm.classification.service.IClassificationService;

@Controller
@RequestMapping("/classification")
public class ClassificationController {
	@Autowired
	private IClassificationService iClassificationService;
	
	@ResponseBody	
	@RequestMapping("/add")
	private int add(ClassificationModel model) {	
		return iClassificationService.insert(model);	
	}
	@ResponseBody	
	@RequestMapping("/selectByCode")
	private ClassificationModel selectByCode(ClassificationModel model) {
		ClassificationModel cm = iClassificationService.selectByCode(model.getCode());
		return cm;
	}
	
	@ResponseBody	
	@RequestMapping("/selectModel")
	private Map<String,Object> selectModel(ClassificationModel model){
		List<ClassificationModel> list = iClassificationService.selectModel(model);
		Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	    map.put("count", iClassificationService.selectCount(model));
		return map;	
	}
	@ResponseBody
	@RequestMapping("/selectAll")
	private List<ClassificationModel> selectAll(ClassificationModel model){
		List<ClassificationModel> list = iClassificationService.selectAll(model);
		return list;
	}
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(ClassificationModel model) {
		return iClassificationService.delete(model);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public int update(ClassificationModel model) {
		return iClassificationService.update(model);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/select", produces = "application/json;charset=UTF-8")
	private String select(ClassificationModel classificationModel) {
		classificationModel.setOrderby("name");
		List<ClassificationModel> list = iClassificationService.selectAll(classificationModel); 
		return new JSONArray(list).toString();
	}

	@ResponseBody
	@RequestMapping(value ="/search", produces = "application/json;charset=UTF-8")
	public String search(ClassificationModel classificationModel) {
		String code = classificationModel.getCode();
		ClassificationModel modelDB = iClassificationService.search(new ClassificationModel(code));
		return modelDB == null ? "" : new JSONObject(modelDB).toString();
		
	}
	
}
