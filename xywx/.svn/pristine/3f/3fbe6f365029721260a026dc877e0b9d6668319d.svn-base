layui.config({
	base : "js/"
}).use(['form','element','layer','jquery'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		element = layui.element(),
		$ = layui.jquery;

	$(".panel a").on("click",function(){
		window.parent.addTab($(this));
	});
	
	//用户数
	$.get("allUsersNum.html",
		function(data){
			$(".userAll span").text(data);
		}
	);
	//文章总数
	$.get("allArticleNum.html",
		function(data){
			$(".allArticle span").text(data);
		}
	);
	//学校公告
	/*$.get("allNoticeNum.html",
 			function(data) {
				$(".allNotice span").text(data);
			}
	);*/
	
	//动态获取学校最新公告
	$.get("noticeList.html",
		function(data){
			data=eval(data);
			
			$(".allNotice span").text(data.length);  //总数
			
			/*var waitNews = [];
			for(var i=0;i<data.length;i++){
				var newsStr = data[i];
				if(newsStr["newsStatus"] == "待审核"){
					waitNews.push(newsStr);
				}
			}
			$(".waitNews span").text(waitNews.length);  */
			//加载最新文章
			var hotNewsHtml = '';
			var dataL=0;
			
			if(data.length<=5){
				dataL=data.length;
			}else{
				dataL=5;
			}
			for(var i=0;i<dataL;i++){
				hotNewsHtml += '<tr data-id="'+data[i].id+'"class="works_item">'
		    	+'<td align="left">'+data[i].title+'</td>'
		    	+'<td>'+data[i].set_time+'</td>' 
		    	+'</tr>';
			}
			$(".hot_news").html(hotNewsHtml);
		}
	);
	//公告展示编辑
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$("body").on("click",".works_item",function(){ 
			var id=$(this).attr("data-id");
			var index = layui.layer.open({
				title : "公告展示编辑",
				type : 2,
				
				content : "noticeEditShow.html?id="+id,
				success : function(layero, index){
					setTimeout(function(){
						layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
							tips: 3
						});
					},500);
				}
			});		
			layui.layer.full(index);
		});
	}).resize();
	


});
