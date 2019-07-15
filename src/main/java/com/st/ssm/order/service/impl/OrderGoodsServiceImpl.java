package com.st.ssm.order.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.ssm.order.mapper.OrderGoodsMapper;
import com.st.ssm.order.model.OrderGoodsModel;
import com.st.ssm.order.service.IOrderGoodsService;
@Service
public class OrderGoodsServiceImpl implements IOrderGoodsService{

	@Autowired
	private OrderGoodsMapper mapper;
	
	@Override
	public int insert(OrderGoodsModel model) {
		return mapper.insert(model);
	}
	
	@Override
	public List<OrderGoodsModel> selectByOrderCode(String orderCode) {
		
		return mapper.selectByOrderCode(orderCode);
	}

	@Override
	public int delete(String orderCode) {
		return mapper.delete(orderCode);
	}

	

}
