<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>掌方圆商城管理后台</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css" />
</head>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<body>
<img src="<%=request.getContextPath() %>/img/8.jpg" alt="" class="ig1">
<img src="<%=request.getContextPath() %>/img/login.png" alt="" class="ig2">
<div class="title">
    <span>掌方圆商城管理后台</span>
</div>
<div class="login">
    <div class="form-title">用户登录</div>
    <div class="lin"></div>
       <form id='form1' name='form1' method='post' action='<%=request.getContextPath() %>/LoginController/login'>
            <ul class="list">
                <li>
                    <span class="iconfont icon-yonghuming logo"></span>
                    <input type="text" name="username" id="username" placeholder="用户名"/>
                    <div class="error"></div>
                </li>
                <li>
                    <span class="iconfont icon-mima logo"></span>
                    <input type="password" name="password" id="password" placeholder="密码"/>
                    <div class="error"></div>
                </li>
            </ul>
           <input type="submit" class="submit submit2"></input>
       </form>
</div>
</body>
</html>