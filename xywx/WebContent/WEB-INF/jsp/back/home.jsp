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
	<div class="panel_box row">
		<div class="panel col">
			<a href="javascript:;" data-url="noticeListShow.html">
				<div class="panel_icon">
					<i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
				</div>
				<div class="panel_word allNotice">
					<span></span>
					<em style="display:block;font-size:16px;font-style:normal;">公告总数</em>
					<cite style="display:none">学校公告</cite>
				</div>
			</a>
		</div>
		
		<div class="panel col">
			<a href="javascript:;" data-url="allUsers.html">
				<div class="panel_icon" style="background-color:#009688;">
					<i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
				</div>
				<div class="panel_word userAll">
					<span></span>
					<em style="display:block;font-size:16px;font-style:normal;">用户总数</em>
					<cite style="display:none">用户列表</cite>
				</div>
			</a>
		</div>
		<div class="panel col max_panel">
			<a href="javascript:;" data-url="articleListShow.html">
				<div class="panel_icon" style="background-color:#2F4056;">
					<i class="iconfont icon-text" data-icon="icon-text"></i>
				</div>
				<div class="panel_word allArticle">
					<span></span>
					<em style="display:block;font-size:16px;font-style:normal;">文章总数</em>
					<cite style="display:none">文章列表</cite>
				</div>
			</a>
		</div>
	</div>
 
		<div class="sysNotice col">
			<%-- <blockquote class="layui-elem-quote title">学校基本信息</blockquote>
			<table class="layui-table">
				<colgroup>
					<col width="150">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td>学生人数</td>
						<td class="version"></td>
					</tr>
					<tr>
						<td>职工人数</td>
						<td class="author"></td>
					</tr>
					<tr>
						<td>用户人数</td>
						<td class="homePage"></td>
					</tr>
					<tr>
						<td>学校地址</td>
						<td class="server"></td>
					</tr>
					<tr>
						<td>联系方式</td>
						<td class="dataBase"></td>
					</tr>
					<tr>
						<td>网站主页</td>
						<td class="maxUpload"></td>
					</tr>
					<tr>
						<td>网站后台</td>
						<td class="maxUpload"></td>
					</tr>
				</tbody>
			</table> --%>
			<blockquote class="layui-elem-quote title">最新公告<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news"></tbody>
			</table> 
		</div>
	</div>

	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>  
</body>
</html>