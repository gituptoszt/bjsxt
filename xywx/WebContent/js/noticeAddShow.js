layui.config({
	base : "js/"
}).use(['form','layer','jquery','upload','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
 	
	var imgPath="";
	 //独立的图片上传
	layui.upload({ 
		url : "imgUpload.html",
		success : function(res) {
			res=eval(res);   
			$("#userFace").attr("src",res.data.src);
			imgPath=res.data.src;
			$("#userFace").show();
			/*$("#put_img").html("");
			imgHtml='<img src="'+res.data.src+'" id="userFace" style="display:block;width: 200px;height: 200px;"/>';
			$("#put_img").html(imgHtml);*/
		}    
	}); 
	
 	//文本编辑器的文件上传,必须写在创建一个编辑器的前面
    layedit.set({
	    uploadImage: {
	    url: 'imgUpload.html' //接口url
	    ,type: 'post' //默认post
	     }
	   });
    
 	//创建一个编辑器,
 	var editIndex = layedit.build('news_content');
 	
 	
 	form.on("submit(worksAdd)",function(data){
 		//获取上传的公告标题,时间,以及文本编辑器的内容
 		var title=$.trim($(".newsName").val());
 		var newsTime=$.trim($(".newsTime").val());
 		//获取编辑器的内容(不是纯文本)
 		var txt=layedit.getContent(editIndex);
 		
 		$.ajax({ 
			type : "post",
			url : "noticeAdd.html",
			data :{
				title:title,
				set_time:newsTime,
				txt:txt,
				img:imgPath,
				
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
