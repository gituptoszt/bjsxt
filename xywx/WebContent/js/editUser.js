var $;
layui.config({
	base : "js/"
}).use(['form','layer','jquery'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		$ = layui.jquery;
	
	
	
 	form.on("submit(editUser)",function(data){
 		var id=$(".layui-form").attr("data.id");
 		var name=$(".name").val();
 		var user=$(".user").val();
 		var pwd=$(".pwd").val();

 		$.ajax({   
			type : "post",
			url : "userUpdate.html",
			data :{
				"id":id,
				"name":name,
				"user":user,   
				"pwd":pwd   
			},
			dataType : 'json',
			beforeSend : function() {
				index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
			},
			success : function(ret) {
				setTimeout(function(){
					 	top.layer.close(index);
						top.layer.msg("用户修改成功！");
			 			layer.closeAll("iframe");
				 		//刷新父页面
				 		parent.location.reload();
		        },1000);
			}
		});
 		return false;
 	});
	
});