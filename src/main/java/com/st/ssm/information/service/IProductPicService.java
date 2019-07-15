package com.st.ssm.information.service;

import java.util.List;

import com.st.ssm.information.model.ProductPicModel;

public interface IProductPicService {

	int insert(ProductPicModel model);

	int deleteModel(ProductPicModel model);

	int updateActive(ProductPicModel model);

	List<ProductPicModel> selectAll(ProductPicModel model);

	List<ProductPicModel> findPic(ProductPicModel productPicModel);


}
