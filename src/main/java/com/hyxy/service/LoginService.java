package com.hyxy.service;

import java.util.Map;
import java.util.Set;

import com.hyxy.entity.User;

public interface LoginService {

	User login(Map<String, String> map);
	
	//根据用户名查询用户信息
	User getByUserName(String username);

	Set<String> getRoles(String userName);

	Set<String> getPermissions(String userName);

}
