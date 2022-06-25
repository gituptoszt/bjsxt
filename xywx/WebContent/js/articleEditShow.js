var select1_id=0;//第一个选择下拉框对应option的id
var select2_id=0;//第二个选择下拉框对应option的id
layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
	
	layedit.set({
	    uploadImage: {
	    url: 'imgUpload.html' //接口url
	    ,type: 'post' //默认post
	     }
	   });
	
	//创建一个编辑器
 	var editIndex = layedit.build('news_content');
 	//获取selected_1的值
 	var selected_1=$("#selected_1").val();
 	var selected_2=$("#selected_2").val();
 	//获取第一个下拉框select的值放到页面上
	$.get("typeList.html", function(data) {
		//data是所有一级类型的集合
		var type1Data = JSON.parse(data);
		//将一级类型拼接到第一个下拉框下
		if(type1Data.length!=0){
			$.each(type1Data,function(i,option){
				//将一级菜单的id以及name值(类型)拼接到下拉框
				if(selected_1==option.id){
					//若是值相等设置为选中状态
					var optionHtml='<option value="'+option.id+'" selected>'+option.name+'</option>';
				}else{
					var optionHtml='<option value="'+option.id+'" >'+option.name+'</option>';
					
				}
				 $("#select_1").append(optionHtml); 
				});
		}
		form.render(); 
	});
	//根据第一个下拉框相应的值将第二个下拉框的值添加进去
	$.get("type2List.html",{type_id:selected_1},function(data) {
		//data是所有相应二级类型的集合
		var type2Data = JSON.parse(data);
		//将二级类型拼接到第二个下拉框下
		if(type2Data.length!=0){
			$.each(type2Data,function(i,option){
				//将一级菜单的id以及name值(类型)拼接到下拉框
				if(selected_2==option.id){
					//若是值相等设置为选中状态
					var optionHtml='<option value="'+option.id+'" selected>'+option.name+'</option>';
				}else{
					var optionHtml='<option value="'+option.id+'" >'+option.name+'</option>';
					
				}
				 $("#select_2").append(optionHtml); 
				});
		}
		form.render(); 
	});
 	
	
	
	//获取下拉框值对应的id
	form.on('select(select_1)',function(data){
		select1_id=data.value;  //获取所选择一级下拉框的id
		//根据第一个下拉框获取第二个下拉框select的值放到页面上 
		if(select1_id==0){
			
		}else{
			//获取第二个下拉框select的值放到页面上
			$.get("type2List.html",{type_id:select1_id}, function(data) {
				//data是所有二级类型的集合
				workData = eval(data);
				 $("#select_2").html('<option value="0" disabled>二级类型</option>');
				//将二级类型拼接到第二个下拉框下
				if(workData.length!=0){
					$.each(workData,function(i,option){
						//将二级菜单的id以及name值(类型)拼接到下拉框
						
						/*if(selected_2==option.id){
							//若是值相等设置为选中状态
							var optionHtml='<option value="'+option.id+'" selected>'+option.name+'</option>';
						}else{
							var optionHtml='<option value="'+option.id+'" >'+option.name+'</option>';
							
						}*/
						
						var optionHtml='<option value="'+option.id+'" >'+option.name+'</option>';
						 $("#select_2").append(optionHtml);
						});
				}
				form.render(); 
			});
		}
		
		});
		//监听第二个下拉框并获取对应的option的id
		form.on('select(select_2)',function(data){
			select2_id=data.value;  //获取所选择二级下拉框的id
		});
 	
	
 	form.on("submit(worksEdit)",function(data){
 		var id=$("#workId").val(); 
 		var title=$.trim($(".newsName").val());
 		var newsTime=$.trim($(".newsTime").val());
 		//获取编辑器的内容(不是纯文本)
 		var txt=layedit.getContent(editIndex);
 		$.ajax({ 
			type : "post",
			url : "articleUpdate.html",
			data :{
				id:id,
				title:title,
				txt:txt,
				set_time:newsTime,
				type_id:select1_id,
				type2_id:select2_id,
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
