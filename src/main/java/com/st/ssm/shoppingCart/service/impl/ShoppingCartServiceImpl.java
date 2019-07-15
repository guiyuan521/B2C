package com.st.ssm.shoppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.ssm.shoppingCart.mapper.ShoppingCartMapper;
import com.st.ssm.shoppingCart.model.ShoppingCartModel;
import com.st.ssm.shoppingCart.service.IShoppingCartService;
@Service
public class ShoppingCartServiceImpl implements IShoppingCartService{

	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	
	@Override
	public List<ShoppingCartModel> selectList(ShoppingCartModel sModel) {
		List<ShoppingCartModel> list = shoppingCartMapper.selectList(sModel);
		return list;
	}

	@Override
	public int insert(ShoppingCartModel sModel) {	
		return shoppingCartMapper.insert(sModel);
	}

	@Override
	public int update(ShoppingCartModel sModel) {	
		return shoppingCartMapper.update(sModel);
	}

	@Override
	public int updSum(ShoppingCartModel model) {
		if(shoppingCartMapper.updSum(model) == 1) {
			return 1;
		}
		return 0;
	}

	@Override
	public int del(ShoppingCartModel model) {
		if(shoppingCartMapper.del(model) == 1) {
			return 1;
		}
		return 0;
	}

	@Override
	public ShoppingCartModel selectList1(ShoppingCartModel model) {
		
		return shoppingCartMapper.selectList1(model);
	}

}
