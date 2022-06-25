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
				<label class="layui-form-label">一级类型</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input newsName"
					 value="${type.name}" disabled  style="outline: none;">
			</div>
		</div> 
		

		<div class="layui-form-item">
			<div class="layui-input-block" style="text-align:left">
				<button class="layui-btn worksItemAdd">添加二级类型</button>
		    </div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<ul>
					<li></li>
				</ul>
			</div>
		</div>		
		<!-- <div class="layui-form-item">
			<label class="layui-form-label">二级类型</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input webUrl"   lay-verify="required" placeholder="请输入二级类型名称">
			</div>
		</div> -->
		<input type="hidden" value="${type.id}" id="workId">
		<!-- <div class="layui-form-item " style="text-align:center">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="worksAdd2">立即提交</button>   
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div> -->
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/type2AddShow.js"></script>
</body>
</html>