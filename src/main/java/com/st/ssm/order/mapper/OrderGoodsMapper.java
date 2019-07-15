package com.st.ssm.order.mapper;


import java.util.List;

import com.st.ssm.order.model.OrderGoodsModel;

public interface OrderGoodsMapper {

	int insert(OrderGoodsModel model);

	List<OrderGoodsModel> selectByOrderCode(String orderCode);

	int delete(String orderCode);


}
