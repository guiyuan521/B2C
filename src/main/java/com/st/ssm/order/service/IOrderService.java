package com.st.ssm.order.service;

import java.util.List;

import com.st.ssm.order.model.OrderModel;

public interface IOrderService {

	List<OrderModel> selectModel(OrderModel model);

	Object selectCount(OrderModel model);

	int delete(OrderModel model);

	int update(OrderModel orderModel);

	OrderModel select(OrderModel orderModel);

	int insert(OrderModel model);

	List<OrderModel> selectUser(OrderModel model);

}
