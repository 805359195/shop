package com.hyxy.service;

import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyxy.dao.UserMapper;
import com.hyxy.entity.User;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private UserMapper UserMapper;
	
	@Override
	public User login(Map<String, String> map) {
		return UserMapper.login(map);
		
		
	}

	@Override
	public User getByUserName(String username) {
		return UserMapper.getByUserName(username);
	}

	@Override
	public Set<String> getRoles(String userName) {
		return UserMapper.getRoles(userName);
	}

	@Override
	public Set<String> getPermissions(String userName) {
		return UserMapper.getPermissions(userName);
	}

}
