package com.st.ssm.order.service;


import java.util.List;

import com.st.ssm.order.model.OrderGoodsModel;

public interface IOrderGoodsService {

	int insert(OrderGoodsModel model);

	List<OrderGoodsModel> selectByOrderCode(String orderCode);

	int delete(String orderCode);




}
