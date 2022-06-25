<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新沂卫校首页</title>
<script src="<%=request.getContextPath()%>/layui/layui.js"></script>   
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" media="all" />
<link href="<%=request.getContextPath()%>/css_pc/pcIndex.css" rel="stylesheet" type="text/css"/>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css_pc/pcLogin.css" media="all"/> --%> 
</head> 
<body>
	<!-- 导入头部样式 -->
	<%@ include file="pcPageTop.jsp" %>
	
	
	 <div class="all_contents">
    <div class="home_page_all_contents">
            <div class="body_top">
                <div class="slides_show_top ">
                    <div class="swiper-container" id="swiper-container0">
                    <div class="swiper-wrapper">
                    	<!-- 取公告的5张图片放到这里 -->
                    	<c:forEach var="notice" items="${noticeList}" varStatus="index">
                                <c:if test="${index.count < 6}">
                                <div class="swiper-slide">
                           			 <img  src="${notice.img}" 
                           			 data-id="${notice.id}"  class="notice_img"/>
                        		</div>
                        		</c:if>
						</c:forEach>

						</div>
                        <!--分页器-->
                        <div class="swiper-pagination" id="swiper-pagination0"></div>
                    </div>
                </div>
                
                <div class="table_top">
               <!-- 将两个一级类型下的文章放到主体头部 -->
               <c:forEach var="type" items="${typeList}" varStatus="typeIndex">
              	 <c:if test="${not empty type}">
						<c:if test="${typeIndex.count < 3}">
               <div class="table_top_1">
                <table>
                    <colgroup>
                        <col width="380px">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>
                                <div class="title_bg">
                                    <span class="title_txt">${type.name}</span>
                                    <span class="more" data-id="${type.id}"><a>更多&gt;&gt;</a></span>
                                </div>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr height="43px">
                        	<c:forEach var="article" items="${articleList}" varStatus="articleIndex">
                        		<c:if test="${article.type_id==type.id}">
                        					<td height="43px"><img
											src="<%=request.getContextPath()%>/images_pc/list_left.gif">
											<span>[${type.name}]</span>
											 <a data-id="${article.id}" class="title_link">${article.title}</a>
											</td>
                        		</c:if>
                        	</c:forEach>
                        </tr>
                    </tbody>
                </table>
                </div>
               
               </c:if>
				</c:if>
               </c:forEach>
                
            </div>
            </div>
            <div class="img_1200">
                <img src="<%=request.getContextPath()%>/images_pc/img1200.jpg" width="1200" height="100"/>
            </div>
            <div class="table_4">

				<c:forEach var="type" items="${typeList}" varStatus="typeIndex">
					<c:if test="${not empty type}">
						<c:if test="${typeIndex.count >= 3}">
						
						
						<div class="table_up_1">
                        <table>
                            <colgroup>
                                <col width="380px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>
                                    <div class="title_bg">
                                        <span class="title_txt">${type.name}</span>
                                        <span class="more" data-id="${type.id}"><a>更多&gt;&gt;</a></span>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr height="43px">
                            	<c:forEach var="article" items="${articleList}" varStatus="articleIndex">
                        		<c:if test="${article.type_id==type.id}">
										<td height="43px"><img
											src="<%=request.getContextPath()%>/images_pc/list_left.gif">
											<span>[${type.name}]</span>
											 <a class="title_link" data-id="${article.id}">${article.title}</a>
											</td>
                        		</c:if>
                        		 
                        	</c:forEach>
                              
                            </tr>
                            </tbody>
                        </table>
                    </div>
						
						</c:if>
					</c:if>
				</c:forEach>
                </div>
			
			<div class="img_1200">
                <img src="<%=request.getContextPath()%>/images_pc/img1201.jpg" width="1200" height="100"/>
            </div>
			<div class="slides_show_footer">
				<div class="swiper-container" id="swiper-container1">
					<div class="swiper-wrapper">

						<!-- 取公告的8张图片放到这里 -->
						<c:forEach var="notice" items="${noticeList}" varStatus="index">
							<c:if test="${index.count < 9}">
								<div class="swiper-slide">
									<img src="${notice.img}" data-id="${notice.id}"
										class="notice_img" />
								</div>
							</c:if>
						</c:forEach>
					</div>
					<!--分页器-->

					<div class="swiper-pagination" id="swiper-pagination1"></div>
				</div>
			</div>
		</div>
             
             
    </div>
	
	
	
	<!-- 导入底部样式 -->
	<%@ include file="pcPageFooter.jsp" %>
	
	


 <script src="<%=request.getContextPath()%>/swiper/swiper-3.4.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js_pc/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	
	$(function(){
		 document.oncontextmenu = function (){
			 return false;
		 }
	});
	
	
    /*主体顶部轮播图显示开始*/
        var mySwiper=new Swiper("#swiper-container0",{
            direction: 'vertical',
            loop:true,
            effect:'cube',
            autoplay : 5000,

            pagination: '#swiper-pagination0',
            paginationElement : 'li',
            paginationClickable :true,
         /*   自定义-分页器样式类型（前提） */
            paginationType : 'custom',
           /*  //设置自定义分页器的内容 */
            paginationCustomRender: function (swiper, current, total) {
            var _html = '';
            for (var i = 1; i <= total; i++) {
                if (current == i) {
                    _html += '<li class="swiper-pagination-bullet-active">' + i + '</li>';
                }else{
                    _html += '<li class="swiper-pagination-bullet">' + i  + '</li>';
                }
            }
            return _html;/* //返回所有的页码html */
        }
    })
    
    $('#swiper-pagination0').on('click','li',function(){
        var index = this.innerHTML;
        mySwiper.slideTo(index, 500, false);/*切换到第一个slide，速度为1秒 */
    });
    /*主体顶部轮播图显示结束*/
    
    
        /*主体底部轮播图显示开始*/
        var swiper1 = new Swiper('#swiper-container1', {
            slidesPerView: 5,
            spaceBetween: 10,
            freeMode: true,
            autoplay : 5000,
            pagination: '#swiper-pagination1',
            paginationClickable :true,
        });
    /*主体底部轮播图显示结束*/
    
    
    /*点击更多根据一级类型获取文章列表跳转网页  */
    $("body").on("click",".more",function(){
    	
    	
    	if(isLogin()==1){
    		return false;
    	}
    	
    	var id=$(this).attr("data-id");
    	location.href="pcPageList1.html?type_id="+id;
    });
    
    /*点击文章标题进入文章页面 */
    $("body").on("click",".title_link",function(){
    	
    	if(isLogin()==1){
    		return false;
    	}
    	
		//获取id 
    	var id=$(this).attr("data-id");
    	location.href="pcPageDetail.html?id="+id;
    });
    /*点击公告进入公告文章页面 */
    $("body").on("click",".notice_img",function(){
    	
    	if(isLogin()==1){
    		return false;
    	}
    	
		//获取id 
    	var id=$(this).attr("data-id");
    	location.href="pcPageNotice.html?id="+id;
    });
    $(function(){
    	var html="<p>&nbsp;&nbsp;&nbsp;&nbsp;暂无数据!</p>";
    	var trList=$("tbody tr");
    	for(var i=0;i<trList.length;i++){
    		if(trList.eq(i).find("td").length==0){
    			trList.eq(i).append(html);
        	}
    	}
    	
    });
    
    
    
    
</script>

</body>
</html>