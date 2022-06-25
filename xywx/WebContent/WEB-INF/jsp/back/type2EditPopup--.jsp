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
	margin-right:40px;
}
.text_summary{
	min-height:400px;
}
</style>
</head> 
<body class="childrenBody"> 
	<form class="layui-form">  
		<div class="layui-form-item">
			<label class="layui-form-label">事项标题</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input newsName" maxlength="20" name="title" value="${obj.title}" lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">初建时间</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input newsTime" name="set_time" value="${obj.set_time}"lay-verify="required|date" onclick="layui.laydate({elem:this})"> 
				</div>
			</div>
		</div> 
		<input type="hidden" value="${obj.id}" id="itemId">
		<div class="layui-form-item">
			<label class="layui-form-label">详细内容</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea text_summary">${obj.txt}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block" style="text-align: center;margin-left:40px;">
				<!-- <button class="layui-btn itemEdit">立即提交</button> -->
			<button class="layui-btn itemEdit" lay-submit="" lay-filter="itemEdit" >立即提交</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/workTimeLineEdit.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>