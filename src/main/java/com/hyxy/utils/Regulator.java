package com.hyxy.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hyxy.entity.User;

public class Regulator implements HandlerInterceptor{

	   // controller控制器被执行之前调用拦截器（如登录检查）
	   @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {

		   System.out.println(request.getRequestURI());
		   System.out.println(request.getRequestURI());
		   System.out.println("aaa访问controller控制器之前的拦截");
	      User member = (User) request.getSession().getAttribute("user");
	 
	      if (member == null) {
	         // 1.请求重定向：
	         // /---代表http://localhost:8080
	    	  System.out.println(request.getContextPath());
	         // 跳转到一个页面
	         response.sendRedirect(request.getContextPath() + "/login.jsp");
	 
	         request.getRequestDispatcher("/aaa.jsp").forward(request, response);
	 
	         return false;// 不执行之后的拦截器
	      }
	      return true; // 执行之后的拦截器
	   }
	 
	   // 在controller控制器执行完后，呈现视图之前调用拦截器
	   @Override
	   public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
	         throws Exception {
	      System.err.println("bbbcontroller控制器执行完后，生成视图之前的拦截器");
	   }
	 
	   // controller控制器执行完后，呈现视图之后调用的拦载器，释放资源
	   @Override
	   public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
	         throws Exception {
	      System.err.println("ccc生成视图后的拦载器，释放资源");
	   }

	
}
