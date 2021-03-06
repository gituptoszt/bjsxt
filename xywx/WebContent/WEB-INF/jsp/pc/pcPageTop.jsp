<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新沂卫校pageTop</title>
    <link href="<%=request.getContextPath()%>/css_pc/pcPagePublic.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/swiper/swiper-3.4.2.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/layui/css/modules/layer/default/layer.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="wrapper">
   <!-- 时间显示开始-->
    <div class="top_1">
        <div class="width" style="height: 36px;">
            <div class="timer">
                <div class="zi" id="webjx"></div>
            </div>
            <c:if test="${not empty pcAdminSession}">
            <div class="login_a" id="login_a">
                <a id="login">欢迎!&nbsp;&nbsp;<span>${pcAdminSession.name}</span></a>
                <a id="logout">&nbsp;&nbsp;退出</a>
            </div>
            </c:if>
            <c:if test="${empty pcAdminSession}">
            <div class="login_a" id="login_a">
                <a id="login">请登录</a>
            </div>
            </c:if>
        </div>
    </div>
    <!-- 时间显示结束-->

    <!-- 轮播图显示开始-->
    <div class="carousel_top">
        <div id="container" class="swiper-container">
            <div id="aa1" class="sections swiper-wrapper">
                <div class="swiper-slide section" id="section0"></div>
                <div class="swiper-slide section" id="section1"></div>
            </div>
            <!--分页器-->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <!-- 轮播图显示结束-->



    <!-- 导航栏显示开始-->
    <div class="dd-navigation">
        <div class="nav-strip">
            <ul>
                <li class="nav-item">
                <a href="<%=request.getContextPath()%>/pc/pcIndex.html" target="">首页</a></li>
                
                <c:forEach var="type" items="${typeList}">
						<li class="nav-item"><a data-id="${type.id}" class="type_first">${type.name}</a>
							<div class="subnav">
								<div class="subnav-inner">
									<ul>
										<c:forEach var="type2" items="${type2List}">
											<c:if test="${type.id ==type2.type_id}">
												<li class="aa"><span><a class="type_second"
														data-id="${type2.id}" title="${type2.name}"
														target="">${type2.name}</a></span></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div></li>
					</c:forEach>
            </ul>
        </div>
    </div>
    <!-- 导航栏显示结束-->
    <!--网站公告开始-->
    <div class="wzgg">
        <div class="width" style="height: 41px; border-bottom: 1px solid #CCC;">
            <div class="fl" style="width: 200px; display: inline-block">
                <img src="<%=request.getContextPath()%>/images_pc/new_notice.jpg">
            </div>
            <div class="fr" style="width: 1000px; overflow: hidden;">
                <div id="mrq">
                    <div id="Marquee_x">
                        <ul style="width: 1000%;">
                            <li id="notice1">
                                <c:forEach var="notice" items="${noticeList}">
                                <div>
                                    <a  title="${notice.title}" data-id="${notice.id}" class="notice">${notice.title}</a> ${notice.set_time}
                                </div>
								</c:forEach>
                            </li>
                            
                            <li id="notice2">
                            	<c:forEach var="notice" items="${noticeList}">
                                <div>
                                    <a  title="${notice.title}" data-id="${notice.id}" class="notice">${notice.title}</a> ${notice.set_time}
                                </div>
								</c:forEach>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--网页公告结束-->
</div>
    <%-- <script src="<%=request.getContextPath()%>/layui/layui.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/layui/lay/modules/layer.js" type="text/javascript"></script> --%>
    <script src="<%=request.getContextPath()%>/layui/lay/dest/layui.all.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/swiper/swiper-3.4.2.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/js_pc/jquery-1.11.3.min.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/js_pc/pcPageTop.js" type="text/javascript"></script> 

<script>
    /*时间显示开始*/
    setInterval("webjx.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
    /*时间显示结束*/
    /*轮播图显示开始*/
        var mySwiper=new Swiper(".swiper-container",{
            direction:'horizontal',
            loop:true,
            pagination:'.swiper-pagination',
            effect:'fade',
            autoplay : 5000,
        });
    /*轮播图显示结束*/
    /*文字滚动公告开始*/
    var demo = document.getElementById("Marquee_x");
    var demo1 = document.getElementById("notice1");
    var demo2 = document.getElementById("notice2");
    demo2.innerHTML=document.getElementById("notice1").innerHTML;
    function Marquee(){
        if(demo.scrollLeft-demo2.offsetWidth>=0){
            demo.scrollLeft-=demo1.offsetWidth;
        }
        else{
            demo.scrollLeft++;
        }
    }
    var myvar=setInterval(Marquee,30);
    demo.onmouseout=function (){myvar=setInterval(Marquee,30);}
    demo.onmouseover=function(){clearInterval(myvar);}
    /*文字滚动公告结束*/
	

</script>
</body>
</html>