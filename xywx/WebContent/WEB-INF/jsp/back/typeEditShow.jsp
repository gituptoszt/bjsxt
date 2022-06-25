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
.s_type{
	/* margin-bottom:4px; */
}
.right_margin{
	margin-right:60px;
	position:relative;
}
.right_del{
	position:relative;
	float:right;
	top:-36px;
	right:-55px;
}
</style>
</head> 
<body class="childrenBody"> 
	<form class="layui-form">  
		<!-- <div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">一级类型</label>
				<div class="layui-inline">
				<select name="quiz2" class="layui-select">
					<option value="1" selected>1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				</div>
			</div>
		</div>  -->
		<div class="layui-form-item">
			<label class="layui-form-label">一级类型</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input webTitle" name="title" value="${obj.name}">
			</div>
		</div>
		
		<div class="layui-form-item">
			
			<label class="layui-form-label"></label>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal newsAdd_btn">添加二级类型</a>
			</div>
			
			
		</div>
		
		
		<div class="layui-form-item addS_type">
			
			<label class="layui-form-label">二级类型</label>
			
			<!-- <div class="layui-input-block right_margin">
				<input type="text" class="layui-input s_type">
				<a class="layui-btn layui-btn-mini right_del">
				<i class="layui-icon">&#xe640;</i> 删除</a>
			</div> -->
			
		</div>
		
		<input type="hidden" value="${obj.id}" id="workId">
		
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn worksEdit" lay-submit="" lay-filter="worksEdit" >立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/typeEditShow.js"></script>
</body>
</html>