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
</head> 
<body class="childrenBody">
	<blockquote class="layui-elem-quote works_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加二级类型</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>  
	</blockquote>
	<div class="layui-form-item">
		<label class="layui-form-label">一级类型</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input newsName" value="${type.name}"
				disabled style="outline: none;">
		</div>
	</div>

	<div class="layui-form works_list"> 
	  	<table class="layui-table">
		    <colgroup>
				<col width="50">
				<col width="10%">
				<col>
				<col width="13%"> 
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th style="text-align:left;">序号</th>
					<th>二级类型</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="works_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
	<input type="hidden" value="${type.id}" id="workId">
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script> 
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/type2ListShow.js"></script>  
</body>
</html>