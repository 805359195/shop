<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    <!--<link rel="stylesheet" href="css/common.css">-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/font/iconfont.css">
    <!--<link rel="stylesheet" href="css/supplier-mes.css">-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
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
        <li class="active">
            <a href="#">用户管理</a> <span class="divider"><span class="iconfont"></span></span>
        </li>
    </ul>


    <form class="form-horizontal gd" style="padding-top: 20px;" id="gd2">


        
        <hr>
    </form>
    <div class="tit">
        <span class="iconfont icon-guanlianniu"></span>
        <span>用户列表</span>
        <span class="iconfont icon-down-trangle2"></span>
    </div>
    <div class="span95">
        <table cellspacing="0" class="table table-head-bordered table-bordered table-sm">
            <thead>
            <tr style="">
                <th>id</th>
                <th>用户名</th>
                <th>密码</th>
                <th>角色</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${user }" var="obj">
                <tr>
	                <td>${obj.id }</td>
	                <td>${obj.username}</td>
	                <td>${obj.password}</td>
	                <td>
	                	<select id="${obj.id }" onchange="role('${obj.id }')">
	                		<option value="0">请选择</option>
	                		<c:forEach items="${roles}" var="ro" >
										<option <c:if test="${obj.roleid==ro.id}">selected</c:if>  value="${ro.id }">${ro.rolename}</option>
	                		</c:forEach>
	                	</select>
	                </td>
            	</tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<script type="text/javascript">
function role(id){
	var roleid = $("#"+id+"").val();
	$.ajax({
        url : '<%= request.getContextPath()%>/user/updateroleid',
        type : "POST",
        data : {"roleid":roleid,"id":id},
        dataType : "json",
        success : function(data) {
        	alert(data);
        	console.log(data);
        }
     });
}
</script>




<script type="text/javascript">
//根据后台传的值选中下拉框
$(function(){
	$("#pageSize").val("${number}");
})
//点击分页按钮时触发的事件
function page(i){
	//获取到下拉框选中的值
	var pageSize = $("#pageSize").find("option:selected").text()
	//跳转路径再次查询分页数据
	window.location.href="user_select?currentPage="+i+"&pageSize="+pageSize+" "
}
</script>
<!-- 获取分页的html代码进行显示-->
${page}
</body>
</html>