package com.st.ssm.shoppingCart.mapper;

import java.util.List;

import com.st.ssm.shoppingCart.model.ShoppingCartModel;

public interface ShoppingCartMapper {

	int insert(ShoppingCartModel sModel);

	int update(ShoppingCartModel sModel);

	List<ShoppingCartModel> selectList(ShoppingCartModel sModel);

	int updSum(ShoppingCartModel model);

	int del(ShoppingCartModel model);

	ShoppingCartModel selectList1(ShoppingCartModel model);

}
