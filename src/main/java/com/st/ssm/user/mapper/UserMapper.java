package com.st.ssm.user.mapper;

import java.util.List;

import com.st.ssm.user.model.UserModel;

public interface UserMapper {
	
	int insert(UserModel model);

	UserModel getModel(UserModel model);
	
	List<UserModel> selectModel(UserModel model);

	int updateActive(UserModel model);

	int selectCount(UserModel model);

	int deleteModel(UserModel model);

	int updatePass(UserModel model);

	List<UserModel> selectAll(UserModel model);

	UserModel selectByCode(String code);
}
