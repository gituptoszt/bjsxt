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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" media="all" />    
</head> 
<body>
	<video class="video-player" preload="auto" autoplay="autoplay" loop="loop" data-height="1080" data-width="1920" height="1080" width="1920">
	    <source src="<%=request.getContextPath()%>/video/login.mp4" type="video/mp4"></source>
	    <!-- 此视频文件为支付宝所有，在此仅供样式参考，如用到商业用途，请自行更换为其他视频或图片，否则造成的任何问题使用者本人承担，谢谢 -->
	</video>
	<div class="video_mask"></div>
	<div class="login">  
	    <h1>后台管理登录</h1>
	    <form class="layui-form">
	    	<div class="layui-form-item">
				<input class="layui-input username" name="username" placeholder="用户名" lay-verify="required" type="text" autocomplete="off">
		    </div>
		    <div class="layui-form-item">
				<input class="layui-input password" name="password" placeholder="密码" lay-verify="required" type="password" autocomplete="off">
		    </div>
		   <div class="layui-form-item form_code">
				<input class="layui-input codeGetPwd" name="code" placeholder="验证码" lay-verify="required" type="text" autocomplete="off">
				<div class="code"><img id="verifyImg" src="<%=request.getContextPath()%>/codeGetPwd.html" width="116" height="36"></div>   
		    </div>
			<button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>
		</form>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>   
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></script>
</body>
</html>