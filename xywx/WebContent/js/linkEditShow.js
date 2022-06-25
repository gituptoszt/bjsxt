layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
	
	/*//创建一个编辑器
 	var editIndex = layedit.build('news_content');*/
	
 	form.on("submit(worksEdit)",function(data){
 		var id=$("#workId").val(); 
 		var webTitle=$.trim($(".webTitle").val());
 		var webUrl=$.trim($(".webUrl").val());
 		$.ajax({ 
			type : "post",
			url : "linkUpdate.html",
			data :{
				id:id,
				name:webTitle,
				url:webUrl,
			},
			dataType : 'json',
			beforeSend : function() {
				index = top.layer.msg('提交数据，请稍候',{icon: 16,time:false,shade:0.8});
			},
			success : function(ret) {
				 setTimeout(function(){
		            top.layer.close(index);
					top.layer.msg("数据添加成功！");   
		 			layer.closeAll("iframe");
			 		//刷新父页面
			 		parent.location.reload();
				 },1000);   
			} 
		});
 		return false;
 	});
});
