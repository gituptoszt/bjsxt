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
			 <!--下面是两个下拉选择框 ,必须带layui-form样式的容器包含,否则没有样式-->
			<div class="layui-form layui-inline">
			<div class="layui-inline">
				<!-- layui的第一个select --> 
				<select name="quiz1" class="layui-select"  lay-filter="select_1" id="select_1">
					<option data1-id="0"  value="0" disabled selected>一级类型</option>
					<!-- <option value="杭州">杭州</option> 
					<option value="宁波">宁波</option>
					<option value="温州">温州</option>
					<option value="温州">台州</option>
					<option value="温州">绍兴</option> -->
				</select>
			</div>

			<div class="layui-inline">
			<!-- layui的第二个select -->  
				<select name="quiz2" class="layui-select" lay-filter="select_2" id="select_2"> 
					<option value="0">二级类型</option>
					<!-- <option value="西湖区">西湖区</option>
					<option value="余杭区">余杭区</option>
					<option value="拱墅区">临安市</option> -->
				</select>
			</div>
			</div>
			

			<a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn">添加文章</a>
		</div>
		
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>  
	</blockquote>
	<div class="layui-form works_list"> 
	  	<table class="layui-table">
		    <colgroup>
				<col width="50">
				<col width="50">
				<col>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="8%">
				<col width="8%">
				<col width="20%">   
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th>序号</th>
					<th style="text-align:left;">文章标题</th>
					<th>一级类型</th>
					<th>二级类型</th>
					<th>发布人</th>
					<th>发布时间</th>
					<th>是否展示</th>
					<th>置顶</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="works_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script> 
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/articleListShow.js"></script>  
</body>
</html>