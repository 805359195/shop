package com.hyxy.utils;

import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.hyxy.entity.User;
import com.hyxy.service.LoginService;

public class MyRealm extends AuthorizingRealm {

	@Resource
	private LoginService loginService;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		Set<String> set = loginService.getRoles(username);
		System.out.println(set);
		User user = loginService.getByUserName(username);
		if (user != null) {
			// 从数据库获取到用户名和密码，会和提交的用户名密码进行比较,不匹配会报错
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), "");
			return authcInfo;
		} else {
			return null;
		}
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 获取用户名
		String userName = (String) principals.getPrimaryPrincipal();
		// 获取到当前登录用户的认证信  息
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		// 给用户授权角色
		authorizationInfo.setRoles(loginService.getRoles(userName));
		// 给用户授权权限
		authorizationInfo.setStringPermissions(loginService.getPermissions(userName));
		//return authorizationInfo;
		return null;
	}

}