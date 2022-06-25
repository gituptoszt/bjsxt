<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${type.name}</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css_pc/pcPageList.css" media="all" />

<script src="<%=request.getContextPath()%>/js_pc/jquery-1.11.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js_pc/page2.js"></script>  
</head> 
<body>
	<!-- 导入头部样式 -->
	<%@ include file="pcPageTop.jsp" %>
	
	<div class="list_sum">
<div class="list_model">
    <div class="list_title">
        <div class="title_title" id="title_title">
            <h2>${type.name}</h2>
        </div>
        <div class="title_right">
            <span>当前位置：</span>
            <span><a href="<%=request.getContextPath()%>/pc/pcIndex.html">首页</a></span>&gt;
            <span><a href="#" id="rightTitle">${type.name}</a></span>
        </div>
    </div>
    <div class="list_list">
    	
    	<div style="">
					<c:if test="${articleList== null || fn:length(articleList) == 0}">
						<span id="title_model" data-id="">页面无数据</span>
					</c:if>
    	</div>
        <div>
            <ul>
					<c:forEach var="article" items="${articleList}" varStatus="articleIndex">
							<li>
								<!-- 如果二级类型不为空,则显示二级类型名称 -->
								<c:if test="${article.type2_name!=null}">
								<span class="list_left">[${article.type2_name}]</span> 
								</c:if>
								<!-- 如果二级类型为空,则显示一级类型名称 -->
								<c:if test="${article.type2_name==null}">
								<span class="list_left">[${article.type_name}]</span> 
								</c:if>
								<a class="list_right" data-id="${article.id}"> 
								<span>${article.title}</span>
								</a>
							</li>
					</c:forEach>
            </ul>

        </div>
        <form
				<%-- action="<%=request.getContextPath()%>/homeMenu/financialStatistics.html" --%>
				method="post" id="page_form">
				<input type="hidden" id="page_start" name="start"
					value="${obj.start}"> <input type="hidden" id="id"
					name="type" value="${obj.id}">
				</form>
			<div style="height: 50px; width: 100%; margin-top: 10px;">
				<div id="page"></div>
			</div>
			<script type="text/javascript">
				/*若是点击的一级菜单,则传的二级类型的id是为0*/
				if(${obj.type2_id}==0){
		  		getpage('<%=request.getContextPath()%>/pc/pcPageList1.html?type_id='+${obj.type_id},${count},${obj.number},${obj.start},1,'start','number');          
				}else{
		  		getpage('<%=request.getContextPath()%>/pc/pcPageList1.html?type2_id='+${obj.type2_id},${count},${obj.number},${obj.start},1,'start','number');          
				}
	   		</script>
    </div>
</div>
</div>
	
	
	
	<!-- 导入底部样式 -->
	<%@ include file="pcPageFooter.jsp" %>
	
	
	<script type="text/javascript">

	$("body").on("click",".list_right",function(){
		//获取id 
    	var id=$(this).attr("data-id");
    	location.href="pcPageDetail.html?id="+id;
    });
	
	</script>
	
	
</body> 
</html>