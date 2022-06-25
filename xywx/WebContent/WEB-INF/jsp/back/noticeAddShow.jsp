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
.text_summary{
	min-height: 300px;
	max-height:600px;
}
</style>
</head> 
<body class="childrenBody"> 
	<form class="layui-form">  
		<div class="layui-form-item">
			<label class="layui-form-label">学校公告</label>
			<div class="layui-input-block">
				<input type="text" maxlength="24" class="layui-input newsName" name="title" lay-verify="required" placeholder="请输入文章标题">
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">公告时间</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input newsTime" name="set_time" lay-verify="required|date" onclick="layui.laydate({elem:this})">
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">图片上传</label> 
			<input type="file" class="layui-upload-file fileUpload" lay-title="上传图片" name="file">
			
			<div id="put_img">
			<label class="layui-form-label"></label>
			<img src="" class="" id="userFace" style="display:none;width:  200px; height: 200px;">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">文章内容</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="news_content"></textarea>
			</div>
		</div>
		<div class="layui-form-item " style="text-align:center">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="worksAdd">立即提交</button>   
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/noticeAddShow.js"></script>
</body>
</html>