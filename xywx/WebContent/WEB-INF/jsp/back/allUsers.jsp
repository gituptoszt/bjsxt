<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta charset="UTF-8">
<title>后台管理-用户列表</title>
<script src="<%=request.getContextPath()%>/layui/layui.js"></script>   
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user.css" media="all" />  
</head> 
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal usersAdd_btn">添加用户</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
	</blockquote>
	<div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="5%">
				<col width="5%">
				<col width="20%">
				<col width="20%"> 
				<col width="20%"> 
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th>序号</th>
					<th>昵称</th>
					<th>账号</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>  
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/allUsers.js"></script>
</body>
</html>