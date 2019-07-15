package com.st.ssm.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.ssm.user.model.UserModel;
import com.st.ssm.user.service.IUserService;
import com.st.ssm.util.FmtEmpty;
import com.st.ssm.util.MD5;



@Controller
@RequestMapping("/user")
public class UserController {
	
@Autowired
private IUserService userService;

@ResponseBody	// 	将数据返回到页面
@RequestMapping("/reg")
private int reg(UserModel model) {
   String pass = MD5.encode(model.getPass()); 
   model.setPass(pass);
   return userService.insert(model);// 注册时执行的方法insert
}

private boolean isOkAuthCode(HttpServletRequest request) {
    Object authCode = request.getSession().getAttribute("authCode");
    String code = request.getParameter("verification");
    return authCode.toString().equals(code);
}

@ResponseBody	
@RequestMapping("/login")// 登录
private int login(UserModel model,HttpServletRequest request) {
	if (!isOkAuthCode(request)) {
        return 3;
    }
	String code = model.getCode();
	if (FmtEmpty.isEmpty(code)) {
        return 0;
    }
	String pass = MD5.encode(model.getPass());
	model.setPass(pass);
	
//	String isManage = model.getIsManage();
    UserModel um = userService.getModel(model);
    		  
    if (um == null) {
        return 0;
    } else if (um.getPass().equals(pass)) {
    	request.getSession().setAttribute("user", um);// 登陆时将数据存放到session域中
     	return 1;	  
    } else {
        return 3;
    }
}
@ResponseBody	
@RequestMapping("/selectModel")// 查找数据库中的数据，包括分页数据 最后将其显示出来
private String selectModel(UserModel model) {	
    List<UserModel> list = userService.selectModel(model);
    Map<String, Object> map = new HashMap<>();
    //"list"对应list.jsp中的list，也就是要返回的数据集合key 具体的value值是list
    map.put("list", list);
    map.put("count",userService.selectCount(model));
    return  new JSONObject(map).toString();//将map集合中的数据显示回页面
}


@ResponseBody	
@RequestMapping("/add")// 点击添加信息时用到的方法add
private String add(UserModel model) {
	String pass = MD5.encode(model.getPass());
	model.setPass(pass);
	model.setCode(model.getCode());
	model.setName(model.getName());
	return userService.add(model);	
}
@ResponseBody	
@RequestMapping("/del")// 点击删除时用到的方法del
private int del(UserModel model,HttpServletRequest request) {
	return userService.deleteModel(model);
	
}
@ResponseBody	
@RequestMapping("/upd") // 修改用户的账号和姓名  需要回显
private int upd(UserModel model,HttpServletRequest request) {
	UserModel modelSession = (UserModel) request.getSession().getAttribute("user");
	System.out.println(modelSession);
	System.out.println(model.getCode());
	if(modelSession.getCode().equals(model.getCode())) {
		request.getSession().setAttribute("user",model);
	}
	return userService.updateActive(model);	
}
@ResponseBody	
@RequestMapping("/selectByCode") // 修改时需要到数据库中查找信息，判断是否可以修改
private UserModel selectByCode(UserModel model) {
	UserModel um = userService.selectByCode(model.getCode());
	return um;
}
@ResponseBody	
@RequestMapping("/updPass") // 修改密码
private int updPass(UserModel model,HttpServletRequest request) {
	String pass = model.getPass();	
	String code = model.getCode();
	UserModel um = new UserModel(code);
	um.setPass(MD5.encode(pass));
	return userService.updatePass(um);
}
}
