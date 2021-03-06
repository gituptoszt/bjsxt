layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
	
	/*$("body").on("click",".itemEdit",function(){*/
 	form.on("submit(itemEdit)",function(data){
 		var id=$("#itemId").val();
 		var title=$.trim($(".newsName").val());
 		var newsTime=$.trim($(".newsTime").val());
 		var text_summary=$.trim($(".text_summary").val());
 		/*alert(text_summary);*/
 		$.ajax({ 
			type : "post",
			url : "workItemListEdit.html",
			data :{
				id:id,   
				title:title,
				txt:text_summary,
				set_time:newsTime
			},
			dataType : 'json',
			beforeSend : function() {
				index = top.layer.msg('提交数据，请稍候',{icon: 16,time:false,shade:0.8});
			},
			success : function(ret) {
				 setTimeout(function(){
		            top.layer.close(index);
					top.layer.msg("数据编辑成功！");   
		 			layer.closeAll("iframe");
			 		//刷新父页面
			 		parent.location.reload();
				 },1000);   
			} 
		});
 		return false;
 	});
});
