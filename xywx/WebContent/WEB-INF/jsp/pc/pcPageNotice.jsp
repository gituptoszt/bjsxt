<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公告详细</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css_pc/pcPageDetail.css" media="all" />  
</head> 
<body>
	<!-- 导入头部样式 -->
	<%@ include file="pcPageTop.jsp" %>

	<div class="detail_sum">
		<div class="detail_model">
			<div class="detail_title">
				<div class="title_title">
					<h2>${notice.title}</h2>
				</div>
				<div class="title_right">
					<span>当前位置：</span> <span><a href="/">首页</a></span>&gt; <span><a
						href="#">公告详细页</a></span>
				</div>
			</div>


			<div class="detail_content">
				<div>
					<p>${notice.txt}</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 导入底部样式 -->
		<%@ include file="pcPageFooter.jsp"%>


		<script src="<%=request.getContextPath()%>/js_pc/jquery-1.11.3.min.js"
			type="text/javascript"></script>
		<script type="text/javascript">
		
	/*  $(function(){
		var title=$("#title_model").html();
		$("title").html(title);
		$("#title_title h2").html(title);
		$("#rightTitle").html(title);
		
	}); */
	
	/* $("body").on("click",".list_right",function(){
		//获取id 
    	var id=$(this).attr("data-id");
    	location.href="pcPageDetail.html?id="+id;
    }); */
	
	
	</script>
</body> 
</html>