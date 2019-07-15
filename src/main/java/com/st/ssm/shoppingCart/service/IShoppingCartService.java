package com.st.ssm.shoppingCart.service;

import java.util.List;

import com.st.ssm.shoppingCart.model.ShoppingCartModel;

public interface IShoppingCartService {

	List<ShoppingCartModel> selectList(ShoppingCartModel sModel);

	int insert(ShoppingCartModel sModel);

	int update(ShoppingCartModel sModel);

	int updSum(ShoppingCartModel model);

	int del(ShoppingCartModel model);

	ShoppingCartModel selectList1(ShoppingCartModel model);

}
