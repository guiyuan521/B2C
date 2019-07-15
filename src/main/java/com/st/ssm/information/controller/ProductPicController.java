package com.st.ssm.information.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.st.ssm.information.model.ProductPicModel;
import com.st.ssm.information.service.IProductPicService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/prodpic")
public class ProductPicController {

	@Autowired
	private IProductPicService productPicService;

	private String PATH = "D:/aa/a3/";

	@RequestMapping("/upload")
	@ResponseBody
	public String upload(HttpServletRequest request, String code) throws IllegalStateException, IOException {
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator<String> iter = multiRequest.getFileNames();
			// 一次遍历所有文件
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
					String filename = file.getOriginalFilename();
					String saveName = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
					String path = PATH + saveName;
					file.transferTo(new File(path));// 上传
					productPicService.insert(new ProductPicModel(code, saveName, "2"));
				}
			}
		}
		Map<String, String> result = new HashMap<>();
		result.put("code", "0");
		return JSONObject.fromObject(result).toString();
	}

	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	@ResponseBody
	private String getList(ProductPicModel productPicModel) {
		productPicModel.setCode("%" + productPicModel.getCode() + "%");
		productPicModel.setOrderby("type");
		Map<String, Object> map = new HashMap<>();
		map.put("list", productPicService.selectAll(productPicModel));
		return JSONObject.fromObject(map).toString();
	}
	
	
	@RequestMapping(value = "/findPic", produces = "application/json;charset=utf-8")
	@ResponseBody
	private String findPic(ProductPicModel productPicModel) {
		
		productPicModel.setCode("%" + productPicModel.getCode() + "%");
		productPicModel.setOrderby("type");
		List<ProductPicModel> list = productPicService.findPic(productPicModel);	
		return new JSONArray(list).toString();
	}
	

	@RequestMapping("/del")
	@ResponseBody
	public String del(ProductPicModel productPicModel) {
		File file = new File(PATH + productPicModel.getUrl());
		file.delete();
		return productPicService.deleteModel(productPicModel) + "";
	}

	@RequestMapping("/setMain")
	@ResponseBody
	public String setMain(ProductPicModel productPicModel) {
		Integer id = productPicModel.getId();
		ProductPicModel t = new ProductPicModel();
		t.setCode(productPicModel.getCode());
		// t.setType("2");
		// productPicService.updateActive(t);
		// t = new ProductPicModel();
		// t.setId(id);
		// t.setType("1");
		// productPicService.updateActive(t);
		
		
		
		List<ProductPicModel> list = productPicService.selectAll(t);
		for (ProductPicModel ppm : list) {
			
			
//			 if (id.equals(ppm.getId())) {
//				 ppm.setType("1");
//			 } else {
//				 ppm.setType("2");
//			}
			
			
			if (id.equals(ppm.getId())) {
				ppm.setType("1");
			} else if (ppm.getType().equals("1")) {
				ppm.setType("2");
			} else {
				continue;
			}
			productPicService.updateActive(ppm);
		}
		return "1";
	}

}