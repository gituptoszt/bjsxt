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
			<label class="layui-form-label">文章标题</label>
			<div class="layui-input-block">
				<input type="text" maxlength="24" class="layui-input newsName" name="title" value="${obj.title}" lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">发布时间</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input newsTime" name="set_time" value="${obj.set_time}"lay-verify="required|date" onclick="layui.laydate({elem:this})"> 
				</div>
			</div>
			
		</div> 
		
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">文章类型</label>
				<div class="layui-inline">
				<select name="quiz2" class="layui-select" lay-filter="select_1" id="select_1" lay-verify="required">
					<option value="0" disabled>一级类型</option>
					<%-- <option value="${obj.type_id}" selected disabled>一级类型</option> --%>
				</select>
				<!-- //根据这个值判断是不是选中 -->
				<input type="hidden" value="${obj.type_id}" id="selected_1">
				</div>
			
				<div class="layui-inline">
				<select name="quiz3" class="layui-select" lay-filter="select_2" id="select_2">
					<option value="0" disabled>二级类型</option>
					<%-- <option value="${obj.type2_id}" selected disabled>二级类型</option> --%>
				</select>
				<input type="hidden" value="${obj.type2_id}" id="selected_2">
				</div>
			</div>
		</div> 
		
		<div class="layui-form-item">
			<label class="layui-form-label">文章内容</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="news_content">${obj.txt}</textarea>
			</div>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/articleEditShow.js"></script>
</body>
</html>