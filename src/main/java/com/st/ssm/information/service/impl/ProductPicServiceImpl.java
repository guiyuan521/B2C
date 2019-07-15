package com.st.ssm.information.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.st.ssm.information.mapper.ProductPicMapper;
import com.st.ssm.information.model.ProductPicModel;
import com.st.ssm.information.service.IProductPicService;
@Service
public class ProductPicServiceImpl implements IProductPicService{

	
	@Autowired
	private ProductPicMapper productPicMapper;
	
	@Override
	public int insert(ProductPicModel model) {
		return productPicMapper.insert(model);
	}

	@Override
	public int deleteModel(ProductPicModel model) {
		
		return productPicMapper.deleteModel(model);
	}

	@Override
	public int updateActive(ProductPicModel model) {
		return productPicMapper.updateActive(model);
	}
	
	@Override
	public List<ProductPicModel> selectAll(ProductPicModel model) {
		return productPicMapper.selectAll(model);
	}

	@Override
	public List<ProductPicModel> findPic(ProductPicModel productPicModel) {
		return productPicMapper.findPic(productPicModel);
	}

	
}
