layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
	
	//数据提交更新 
 	form.on("submit(worksEdit)",function(data){
 		var id=$("#workId").val(); 
 		var webTitle=$.trim($(".webTitle").val());  //一级类型
 		var type2input=$(".s_type");//获得二级类型所有input元素
 		var type2List=[];//用来存放所有的input的值
 		//添加的input里面都有一个data_id且设为0,获取后,后端判断这个值是不是为0,若为0,则添加到数据库中 
 		var type2IdList=[];//用来存放所有的input的Id,新添加的没有Id
 		
 		for(var i=0;i<type2input.length;i++){
 			type2List.push($.trim(type2input.eq(i).val()));
 			type2IdList.push(type2input.eq(i).attr("data_id"));
 		}
 		var type2ListStr=type2List.join(","); 		
 		var type2IdListStr=type2IdList.join(",");
 		$.ajax({ 
			type : "post",
			url : "typeUpdate.html",
			data :{
				id:id,
				name:webTitle,
				bei_1:type2ListStr,
				bei_2:type2IdListStr,
			},
			dataType : 'json',
			beforeSend : function() {
				index = top.layer.msg('提交数据，请稍候',{icon: 16,time:false,shade:0.8});
			},
			success : function(ret) {
				 setTimeout(function(){
		            top.layer.close(index);
					top.layer.msg("数据添加修改成功！");   
		 			layer.closeAll("iframe");
			 		//刷新父页面
			 		parent.location.reload();
				 },1000);   
			} 
		});
 		return false;
 	});
 	
 	//点击添加二级类型
 	$("body").on("click",".newsAdd_btn",function(){
 		var s_type_isExist=$(".s_type:last");
 		var last_input=$.trim($(".s_type:last").val());
 		if(s_type_isExist.length==0||(s_type_isExist.length!=0&&
 				(""!=last_input))){
 			//添加的input里面都有一个data_id且设为0,获取后,后端判断这个值是不是为0,若为0,则添加到数据库中 
 			var html='';
 			html+='<div class="layui-input-block right_margin">'
 			+'<input type="text" class="layui-input s_type" lay-verify="required" data_id="0">'
 			+'<a class="layui-btn layui-btn-mini right_del" data_id="0">'
 			+'<i class="layui-icon">&#xe640;</i> 删除</a></div>';
 			$(".addS_type").append(html);
 		}else{
 			layer.msg('尚有二级分类未填写!', {icon: 2});
 		}
 		
 	});
 	
 	//查询表二对应表一id的数据展示在页面上
 	$(function(){
 		var id=$("#workId").val(); 
 		var html='';
 		$.ajax({
 			type : "post",
 			url:"type2EditShow.html",
 			data :{
				type_id:id,
			},
			dataType:"json",
			success:function(data){
				 $.each(data,function(i,type2){
					 html='<div class="layui-input-block right_margin">'
				 			+'<input type="text" class="layui-input s_type hava_id" '
				 			+'value="'+type2.name+'" lay-verify="required" data_id="'+type2.id+'">'
				 			+'<a class="layui-btn layui-btn-mini right_del" data_id="'+type2.id+'">'
				 			+'<i class="layui-icon">&#xe640;</i> 删除</a></div>';
				 	$(".addS_type").append(html); 
				 });
			}
 		});
 		
 	});
 	
 	
 	//点击删除
 	$("body").on("click",".right_del",function(){
 		var _this=$(this);
 		//新添加的id为0,获取type2的id
 		var id=$(this).attr("data_id");
 		//如果id不为0,删除二级类型,在后端将对应的文章st更改
 		if(id!=0){
 			layer.confirm(
 	 				'确定删除此类型？',
 					{icon:3, title:'提示信息'},
 					function(index){
 						$.ajax({
 						type : "post",
 						url : "type2Delete.html",
 						data : {
 							id : id
 							},
 						dataType : "json",
 						success : function(data) {
 								layer.close(index); 
 								layer.msg("删除成功");
 								//删除在页面的元素
 								_this.parent().remove();
 								location.reload();
 						}
 						
 				});
 	 		});
 		}else{
 			layer.msg("删除成功");
				//删除在页面的元素
				_this.parent().remove();
 		}
 		
 	});
 	
 	
/* 	$("body").on("click",".right_del",function(){
 		var _this=$(this);
 		//新添加的id为0
 		var id=$(this).attr("data_id");
 		layer.confirm(
 				'确定删除此类型？',
				{icon:3, title:'提示信息'},
				function(index){
					$.ajax({
					type : "post",
					url : "type2Delete.html",
					data : {
						id : id
						},
					dataType : "json",
					success : function(data) {
						if(a==1){
							layer.close(index); 
							layer.msg("删除成功");
							//删除在页面的元素
							_this.parent().remove();
							location.reload();
							}else{
								
							}
					}
					
			});
 		});
 	});*/
 	
});
