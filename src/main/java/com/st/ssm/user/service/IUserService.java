package com.st.ssm.user.service;



import java.util.List;

import com.st.ssm.user.model.UserModel;

public interface IUserService {
	
	public int insert(UserModel model);

	public UserModel getModel(UserModel model);

	public String add(UserModel model);//添加
	
	public int deleteModel(UserModel model);//删除

	public int updateActive(UserModel model);//修改
	
	public List<UserModel> selectModel(UserModel model);//查找信息 包括分页

	public int selectCount(UserModel model);//统计个数 分页

	public int updatePass(UserModel model);//修改密码

	public UserModel selectByCode(String code); // 修改时需要到数据库查找信息

	List<UserModel> selectAll(UserModel model);

	

}
