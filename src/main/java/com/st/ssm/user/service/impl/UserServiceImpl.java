package com.st.ssm.user.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.ssm.user.mapper.UserMapper;
import com.st.ssm.user.model.UserModel;
import com.st.ssm.user.service.IUserService;
import com.st.ssm.util.FmtEmpty;
@Service
public class UserServiceImpl implements IUserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int insert(UserModel model) {
		return userMapper.insert(model);
	}

	@Override
	public UserModel getModel(UserModel model) {
		return userMapper.getModel(model);
	}
	@Override
	public String add(UserModel model) {
		if(getModel(model) == null) 
			return FmtEmpty.isEmpty(add1(model)) ? "2" : "0";
				return "1";
	}
	
	public int add1(UserModel model) {
	     return userMapper.insert(model);
	}

	@Override
	public int updateActive(UserModel model) {
		return userMapper.updateActive(model);
	}

	@Override
	public int selectCount(UserModel model) {
		return userMapper.selectCount(model);
	}

	@Override
	public int deleteModel(UserModel model) {
		if(userMapper.deleteModel(model)== 1) {
			return 1;
		}
		return 2;
	}

	@Override
	public int updatePass(UserModel model) {
		return userMapper.updatePass(model);
	}
	@Override
	 public List<UserModel> selectModel(UserModel model) {
      return userMapper.selectModel(model) ;
  }
	/* 
	 * 	修改时到数据库中进行查找的方法
	 */
	@Override
	public UserModel selectByCode(String code) {
		
		return userMapper.selectByCode(code);
	}

	
	@Override
	 public List<UserModel> selectAll(UserModel model) {
      return userMapper.selectAll(model) ;
  }
}
