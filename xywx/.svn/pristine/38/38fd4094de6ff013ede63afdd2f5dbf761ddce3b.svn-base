layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
 	
 	//添加一级类型方法
 	form.on("submit(worksAdd)",function(data){
 		var webTitle=$.trim($(".webTitle").val());
 		/*var type=$.trim($(".webUrl").val());*/
 		$.ajax({ 
			type : "post",
			url : "typeInsert.html",
			data :{
				name:webTitle,
				/*type:type,*/
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
 	//添加二级类型方法
 	form.on("submit(worksAdd2)",function(data){
 		var webTitle=$.trim($(".webTitle").val());
 		var type=$.trim($(".webUrl").val());
 		$.ajax({ 
 			type : "post",
 			url : "typeInsert.html",
 			data :{
 				name:webTitle,
				type:type,
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
