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
			<label class="layui-form-label">网站名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input webTitle" name="title" value="${obj.name}" lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">网站地址</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input webUrl" name="title" value="${obj.url}" lay-verify="required">
			</div>
		</div>
		<!-- <div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label"></label>
				<div class="layui-input-block">
					<input type="text" class="layui-input newsTime" name="set_time" value=""> 
				</div>
			</div>
		</div> --> 
		<input type="hidden" value="${obj.id}" id="workId">
		<%-- <div class="layui-form-item">
			<label class="layui-form-label">内容摘要</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea text_summary">${obj.txt}</textarea>
			</div>
		</div> --%>
		
		<%-- <div class="layui-form-item">
			<label class="layui-form-label">文章内容</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="news_content">${obj.txt}</textarea>
			</div>
		</div> --%>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn worksEdit" lay-submit="" lay-filter="worksEdit" >立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/linkEditShow.js"></script>
</body>
</html>