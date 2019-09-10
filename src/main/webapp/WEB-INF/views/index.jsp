<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>掌方圆商城管理后台</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/font/iconfont.css">
</head>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<body>
<div class="head">
    <div class="title">掌方圆商城管理后台</div>
    <div class="right1">

        <span class="iconfont icon-yonghu"></span>
        <span><shiro:principal /></span>
        <a href="<%=request.getContextPath() %>/login/loginout" style="color: white">
            <span class="iconfont icon-tuichu"></span>
            <span>退出</span>
        </a>
    </div>
</div>

<ul class="left11">
    <li>
        <a href="<%=request.getContextPath() %>/home.jsp" target="right">
            <span class="iconfont icon-shouye"></span>
            <span>首页</span>
            <span class="iconfont icon-xiangxia xx" style="opacity: 0"></span>
            <span class="iconfont icon-xiangxia rotate" style="opacity: 0"></span>
        </a>
        <ul></ul>
    </li>
    <li>
        <a>
            <span class="iconfont icon-shouye--dibuge-"></span>
            <span>商城首页配置</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
            <li>
                <a href="<%=request.getContextPath() %>/banner/selectBybanners" target="right">
                    <span>首页banner列表</span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a>
            <span class="iconfont icon-shangpinguanli"></span>
            <span>商品管理</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
          <li>
                <a href="<%=request.getContextPath() %>/product/selectByproducts" target="right">
                    <span>商品列表</span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a>
            <span class="iconfont icon-dingdanguanli"></span>
            <span>订单管理</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
            <li>
                <a href="order-pay.html" target="right">
                    <span>已支付订单</span>
                </a>
            </li>
            <li>
                <a href="order-deliver-goods.html" target="right">
                    <span>已发货订单</span>
                </a>
            </li>
            <li>
                <a href="order-finished.html" target="right">
                    <span>已完成订单</span>
                </a>
            </li>
            <li>
                <a href="order-all.html" target="right">
                    <span>全部订单</span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a>
            <span class="iconfont icon-gongyingshang2"></span>
            <span>店铺管理</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
            <li>
                <a href="store-mes-check.html" target="right">
                    <span>店铺信息查询</span>
                </a>
            </li>
            <li>
                <a href="store-mes-edit.html" target="right">
                    <span>店铺编辑多图上传</span>
                </a>
            </li>
			<li>
                <a href="store-mes-edit-one.html" target="right">
                    <span>店铺编辑单图上传</span>
                </a>
            </li>
            <li>
                <a href="store-mes-dis.html" target="right">
                    <span>店铺详情</span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a>
            <span class="iconfont icon-gongyingshang"></span>
            <span>供应商管理</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
            <li>
                <a href="supplier-mes.html" target="right">
                    <span>供应商信息查询</span>
                </a>
            </li>
            <li>
                <a href="supplier-mes-check.html" target="right">
                    <span>信息查看</span>
                </a>
            </li>
            <li>
                <a href="supplier-mes-add.html" target="right">
                    <span>信息新增</span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a>
            <span class="iconfont icon-shouhouwentichulishenqing"></span>
            <span> 售后申请</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
            <li>
                <a href="goods-pay-apply.html" target="right">
                    <span>售后申请</span>
                </a>
            </li>
        </ul>
    </li>
    <shiro:hasRole name="管理员">
    <li>
        <a>
            <span class="iconfont icon-quanxian"></span>
            <span>权限管理</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
            <li>
                <a href="privilege-roles-modles.html" target="right">
                    <span>角色模块管理</span>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath() %>/user/selectAll" target="right">
                    <span>用户管理</span>
                </a>
            </li>
            <li>
                <a href="privilege-password.html" target="right">
                    <span>修改密码</span>
                </a>
            </li>
        </ul>
    </li>
    </shiro:hasRole>
    <li>
        <a>
            <span class="iconfont icon-baobiao"></span>
            <span>报表</span>
            <span class="iconfont icon-xiangxia xx"></span>
            <span class="iconfont icon-xiangxia rotate"></span>
        </a>
        <ul>
            <li>
                <a href="list-sell.html" target="right">
                    <span>收入报表</span>
                </a>
            </li>
            <li>
                <a href="list-order.html" target="right">
                    <span>订单报表</span>
                </a>
            </li>
            <li>
                <a href="list-member.html" target="right">
                    <span>会员报表</span>
                </a>
            </li>
            <li>
                <a href="list-itemUpshelf.html" target="right">
                    <span>上架商品报表</span>
                </a>
            </li>
        </ul>
    </li>
</ul>

<div class="right11">
    <iframe scrolling="auto" rameborder="0" src="<%=request.getContextPath() %>/home.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div class="bot">
   <span>本站信息由山西哆来咪公司全权提供</span>
</div>
</body>
<script>
    $(document).ready(function () {
        $('.left11>li>a').each(function(ind){
            $(this).click(function(){
                $('.left11>li .xx').eq(ind).slideToggle(0);
                $('.left11>li .rotate').eq(ind).slideToggle(0);
                $('.left11>li>ul ').eq(ind).slideToggle("slow");
            })
        })
    })
</script>
</html>