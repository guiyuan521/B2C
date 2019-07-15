package com.st.ssm.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.ssm.order.mapper.OrderMapper;
import com.st.ssm.order.model.OrderModel;
import com.st.ssm.order.service.IOrderService;
import com.st.ssm.util.FmtEmpty;
@Service
public class OrderServiceImpl implements IOrderService{
	@Autowired
	private OrderMapper orderMapper;
	@Override
	public List<OrderModel> selectModel(OrderModel model) {
		return orderMapper.selectModel(model);
	}
	@Override
	public Object selectCount(OrderModel model) {
		return orderMapper.selectCount(model);
	}
	@Override
	public int delete(OrderModel model) {
		if(orderMapper.delete(model) == 1) {
			return 1;
		}
		return 0;
	}
	@Override
	public int update(OrderModel model) {
		if (orderMapper.update(model) == 1) {
			return 1;
		}
		return 0;
	}
	@Override
	public OrderModel select(OrderModel model) {
		OrderModel om = new OrderModel();
		om.setCode(model.getCode());
		List<OrderModel> list = selectList(om);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}
	private List<OrderModel> selectList(OrderModel model) {
		return orderMapper.selectList(model);
	}
	@Override
	public int insert(OrderModel model) {
		// TODO Auto-generated method stub
		return orderMapper.insert(model);
	}
	@Override
	public List<OrderModel> selectUser(OrderModel model) {
		// TODO Auto-generated method stub
		return orderMapper.selectUser(model);
	}
	

}
