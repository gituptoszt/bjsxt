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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user.css" media="all" />  
</head> 
<body class="childrenBody">
	<form class="layui-form">
		<div class="user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">用户</label>
				<div class="layui-input-block">
					<input type="text" value="${adminSession.user}" disabled
						class="layui-input layui-disabled username">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-block">
					<input type="text" value="${adminSession.name}" class="layui-input nickname">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<input type="file"  class="layui-upload-file fileUpload" 
				    	lay-title="更换头像"  name="file" >
				<img src="${adminSession.img}" class="layui-circle" id="userFace" 
				style="display:inline-block;width: 200px;height: 200px;">
			</div>
			<input type="hidden" value="${adminSession.id}" class="obj_id">
			<input type="hidden" value="" id="userImg">
		</div>
		<div class="layui-form-item" style="margin-left: 5%;">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="changeUser">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/userInfo.js"></script>  
</body> 
</html>