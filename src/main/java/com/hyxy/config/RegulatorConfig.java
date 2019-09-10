package com.hyxy.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.hyxy.utils.Regulator;

//@Configuration
public class RegulatorConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// addPathPatterns 用于添加拦截规则
		// excludePathPatterns 用于排除拦截
		InterceptorRegistration addInterceptor = registry.addInterceptor(new Regulator());
		// 排除配置,排除所有静态文件和不拦截的路径
		addInterceptor.addPathPatterns("/**"); // 过滤全部请求
		// 排除配置,排除所有静态文件
		//addInterceptor.excludePathPatterns("/**/*.jpg"); // jpg静态文件不拦截
		//addInterceptor.excludePathPatterns("/user/select"); // 配置不拦截的页面
		// 或
		 addInterceptor.excludePathPatterns("/**/*.jpg","/**/*.png");
		 addInterceptor.excludePathPatterns("/LoginController/login","/css/**","/images/**","/font/**","/js/**","/login.jsp");
	}

}
