package com.hyxy.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyxy.entity.User;
import com.hyxy.service.LoginService;

@Controller
@RequestMapping("LoginController")
public class LoginController {
	@Autowired
	private LoginService LoginService;

	@RequestMapping("login")
	public String login(@RequestParam Map<String, String> map, HttpServletRequest request) {
		System.out.println(map);

		/*
		 * // 根据用户名密码查询用户是否存在 User user = LoginService.login(map);
		 * System.out.println(user); if (user != null) {
		 * request.getSession().setAttribute("user", user); } else { return
		 * "redirect:login.jsp"; } return "index";
		 */

		// 获取登录验证类
		Subject subject = SecurityUtils.getSubject();
		// 把数据名和密码传送给已定义的myrealm中的Authentication token 用户登录信息借口
		UsernamePasswordToken token = new UsernamePasswordToken(map.get("username"), map.get("password"));
		try {
			subject.login(token);
			return "index";
		} catch (Exception e) {
			return "forward:/login.jsp";

		}

	}
	/**
	 * 退出登录
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		// subject的实现类DelegatingSubject的logout方法，将本subject对象的session清空了
		 Subject subject = SecurityUtils.getSubject();
	      subject.logout();
	      return "forward:/login.jsp";
	}

}
