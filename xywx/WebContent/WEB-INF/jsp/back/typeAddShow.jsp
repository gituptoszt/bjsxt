<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta charset="UTF-8">
<title>后台管理-首页</title>
<script src="<%=request.getContextPath()%>/layui/layui.js"></script>   
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font_tnyc012u2rlwstt9.css" media="all" />  
<style type="text/css">
.layui-form-item{
	margin-top:40px;
}
</style>
</head> 
<body class="childrenBody"> 
	<form class="layui-form">  
		<div class="layui-form-item">
			<label class="layui-form-label">一级类型</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input webTitle"   lay-verify="required" placeholder="请输入一级类型"> 
			</div>
		</div>
		<!-- <div class="layui-form-item">
			<label class="layui-form-label">二级类型</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input webUrl"   lay-verify="required" placeholder="请输入网站地址">
			</div>
		</div> -->
		
		<div class="layui-form-item " style="text-align:center">
			<div class="">
				<button class="layui-btn" lay-submit="" lay-filter="worksAdd">立即提交</button>   
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/typeAddShow.js"></script>
</body>
</html>