<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新沂卫校pageFooter</title>
    <link href="<%=request.getContextPath()%>/css_pc/pcPagePublic.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/swiper/swiper-3.4.2.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/layui/css/modules/layer/default/layer.css" rel="stylesheet" type="text/css"/>

    <script src="<%=request.getContextPath()%>/layui/layui.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/layui/lay/modules/layer.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/swiper/swiper-3.4.2.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/js_pc/jquery-1.11.3.min.js" type="text/javascript"></script>
</head>
<body>
<div class="footer">
    <div class="width">
        <div style="" class="fl">
            <div>
                <div class="title_bg" style="background-color: #E8E8E8;">
                    <span class="pad_l_10 fl">友情链接</span></div>
            </div>
            <div class=" bor_1" style="">
                <div class="pad_10" style="">

                    <ul class="bbba">
                    	<c:forEach var="link" items="${linkList}">
                    		 <li><a href="${link.url}" target="_blank">${link.name}</a></li>
                    	</c:forEach>
                        <!-- <li><a href="http://www.sda.gov.cn/WS01/CL0001/" target="_blank">国家食品药品监督管理局</a></li>
                        <li><a href="http://www.jsfda.gov.cn/" target="_blank">江苏省食品药品监督管理局</a></li>
                        <li><a href="http://juti.cn/" target="_blank">江苏联合职业技术学院</a></li>
                        <li><a href="http://www.jsve.edu.cn/" target="_blank">江苏职教</a></li>
                        <li><a href="http://www.jseea.cn/" target="_blank">江苏省教育考试院</a></li>
                        <li><a href="http://www.ec.js.edu.cn/" target="_blank">江苏教育</a></li>
                        <li><a href="http://www.cnki.net/" target="_blank">CNKI知识创新网</a></li> -->
                    </ul>
                </div>
            </div>

        </div>
    </div>

    <div class="bottom">
        <div class="bottom_text">
            Copyright © 2011-2017. by 江苏省徐州市钟吾卫生学校  All rights reserved.
            <br>
           	 学校地址：江苏省新沂市钟吾路   联系电话：0516-88888888<br>
            <a href="" >后台管理</a>  技术支持：<a href="">臣赐科技</a>
            <br>
        </div>
    </div>
</div>  

</body>
</html>