package com.st.ssm.order.mapper;

import java.util.List;

import com.st.ssm.order.model.OrderModel;

public interface OrderMapper {

	List<OrderModel> selectModel(OrderModel model);

	Object selectCount(OrderModel model);

	int delete(OrderModel model);

	int update(OrderModel model);

	List<OrderModel> selectList(OrderModel model);

	int insert(OrderModel model);

	List<OrderModel> selectUser(OrderModel model);

	
	

}
