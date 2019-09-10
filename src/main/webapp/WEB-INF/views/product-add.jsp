<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/font/iconfont.css">
</head>
<body>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<div class="box">
    <div class="control-group control-group1">
        <label class="control-label"><s>*</s>图片：</label>
        <c:if test="${product.productImg==null }">
                <img src="<%=request.getContextPath() %>/img/ig.png" id="yushow" class="sh2"/>
        </c:if>
        
        <c:if test="${product.productImg !=null }">
                <img src="<%=request.getContextPath() %>/serverimg/${product.productImg }" id="yushow" class="sh2"/>
        </c:if>

    </div>
    <form action="" id="form_2" enctype="multipart/form-data">
    <input type="text" name="id" value="${product.id}">
    <input type="text" id="productImg" name="productImg" value="${product.productImg}">
    <input type="text" id="file"  value="上传一个文件">
    <input type="file" class="jtt"  name="img"   style="background: #880000;">
    <div class="row">
        <div class="control-group">
            <label class="control-label">商品名字：</label>
            <input type="text"  name="productName" class="control-text" value="${product.productName}">
        </div>
    </div>
    <div class="row">
        <div class="control-group">
            <label class="control-label">商品价格</label>
            <input type="text"  name="productPrice" class="control-text" value="${product.productPrice }">
        </div>
    </div>
    <div class="btn" id="submit">
        <span>添加</span>
    </div>
</form>
</div>
</body>
<script>
    $(document).ready(function(){
        let imgarr=['jpeg','png','gif'];
        let size=10*1024*1024;
        console.log($('.jt'))
        
        $('.jtt').get(0).onchange=function (e){
           var that=this;
            console.dir(this)
            var read=new FileReader();
            read.readAsDataURL(this.files[0]);
            console.log($('.sh2').get(0).src)
            read.onload=function () {
                $('.sh2').get(0).src=this.result;
            }
        }
        
        $('#submit').eq(0).click(function(){
      		 var formData = new FormData($("#form_2")[0]);
                   $.ajax({
                      url:'<%= request.getContextPath()%>/product/save',
                      type:"POST",
                      data:formData,
                      dataType:"json",
                      processData : false, //必须false才会避开jQuery对 formdata 的默认处理
                      contentType : false, //必须false才会自动加上正确的Content-Type
                      cache : false, //true的话会读缓存
                      success: function(data) {
                          if(data.message=="成功"){
                              $('#pos1').css({'display':'block'});
                              $('#pos2').addClass('dis-none');
                              window.location.href="<%=request.getContextPath() %>/product/selectByproducts";
                          }else{
                              $('#pos2').css({'display':'block'});
                              $('#pos1').addClass('dis-none');
                          }
                      }
                  });
          }) 
    })
</script>
</html>