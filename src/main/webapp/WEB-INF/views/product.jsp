<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/font/iconfont.css">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
</head>
<style>
</style>
<body>

<div class="doc-content">
    <ul class="breadcrumb breadcrumb2"></ul>
    <ul class="breadcrumb">
        <li>
            <span class="iconfont icon-shouye"></span>
            <a href="#">首页</a> <span class="divider"><span class="iconfont icon-down-trangle1"></span></span>
        </li>
        <li class="active">商品管理</li>
    </ul>
    <div class="tit">
        <span class="iconfont icon-guanlianniu"></span>
        <span>商品管理列表</span>
        <span class="iconfont icon-down-trangle2"></span>
    </div>

    <div class="span95">
    <table cellspacing="0" class="table table-head-bordered table-bordered">
        <a href="<%=request.getContextPath() %>/product/add">
            <div class="s-btn">
                <span style="color: black">新增</span>
            </div>
        </a>
        <thead>
        <tr style="">
            <th>图片</th>
            <th>名字</th>
            <th>价格</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="item">
	        <tr>
	            <td>
	                <img src="<%=request.getContextPath() %>/serverimg/${item.productImg}" alt="">
	            </td>
	            <td>${item.productName}</td>
	            <td>${item.productPrice}</td>
	            <td>${item.createtime}</td>
	            <td><a href="<%=request.getContextPath() %>/product/add?id=${item.id}">编辑</a> <a href="#">删除</a></td>
	        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


</div>

<script>

$(function(){
	$("#pageSize").val("${number}");
})
	
	//点击分页按钮时触发的事件
function page(i){
   //获取到下拉框选中的值
   var pageSize = $("#pageSize").find("option:selected").text()
   //跳转路径再次查询分页数据
   window.location.href="<%=request.getContextPath() %>/product/selectByproducts?currentPage="+i+"&pageSize="+pageSize+" "
}
 
</script>
<!-- 获取分页的html代码进行显示-->
${page}
</body>
</html>