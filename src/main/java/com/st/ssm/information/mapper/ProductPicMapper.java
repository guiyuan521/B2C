package com.st.ssm.information.mapper;

import java.util.List;

import com.st.ssm.information.model.ProductPicModel;



public interface ProductPicMapper {
	
	int insert(ProductPicModel model); // 添加数据
	
	int deleteModel(ProductPicModel model); // 多条件执行删除
	
	int updateActive(ProductPicModel model); // 根据逻辑主键修改不为空的字段
	
	List<ProductPicModel> selectAll(ProductPicModel model);

	List<ProductPicModel> findPic(ProductPicModel productPicModel); 
	
	

}
