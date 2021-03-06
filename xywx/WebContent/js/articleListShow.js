var select1_id=0;//第一个选择下拉框对应option的id
var select2_id=0;//第二个选择下拉框对应option的id
layui.config({
	base : "js/"
}).use(['form','layer','jquery','laypage'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	
	//加载文章页面数据
	var workData = '';
	$.get("articleList.html", function(data) {
		workData = eval(data);
		newsList();
	});
	
	//获取第一个下拉框select的值放到页面上
	$.get("typeList.html", function(data) {
		//data是所有一级类型的集合
		var type1Data = JSON.parse(data);
		//将一级类型拼接到第一个下拉框下
		if(type1Data.length!=0){
			$.each(type1Data,function(i,option){
				//将一级菜单的id以及name值(类型)拼接到下拉框
				 var optionHtml='<option value="'+option.id+'" >'+option.name+'</option>';
				 $("#select_1").append(optionHtml); 
				});
		}
		form.render(); 
	});
	
	
	
	//获取下拉框值对应的id
	form.on('select(select_1)',function(data){
		select1_id=data.value;  //获取所选择下拉框的id
		//根据第一个下拉框获取第二个下拉框select的值放到页面上 
		if(select1_id==0){
			
		}else{
			//获取第二个下拉框select的值放到页面上
			$.get("type2List.html",{type_id:select1_id}, function(data) {
				//data是所有二级类型的集合
				workData = eval(data);
				 $("#select_2").html('<option value="0">二级类型</option>');
				//将二级类型拼接到第二个下拉框下
				if(workData.length!=0){
					$.each(workData,function(i,option){
						//将二级菜单的id以及name值(类型)拼接到下拉框
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
			select2_id=data.value;  //获取所选择下拉框的id
		});
	
	//查询
	$(".search_btn").click(function(){
		var newArray = [];
		//返回到后台的数据,根据此数据查询
		var data={};
    	if(select1_id==0){
    		data={};
    	}else if(select1_id!=0&&select2_id==0){
    		data={type_id:select1_id};
    	}else if(select1_id!=0&&select2_id!=0){
    		//若是两个下拉框都选择,只按照第二个查询
    		data={type2_id:select2_id};
    	}
		if($(".search_input").val() != ''){
			var index = layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
			setTimeout(function(){
            	$.ajax({
					url : "articleList.html",
					type : "get",
					data:data,
					dataType : "json",
					success : function(data1){
						workData = data1;
						for(var i=0;i<workData.length;i++){
							var newsStr = workData[i];
							var selectStr = $(".search_input").val();
		            		function changeStr(data){
		            			var dataStr = '';
		            			var showNum = data.split(eval("/"+selectStr+"/ig")).length - 1;
		            			if(showNum > 1){
									for (var j=0;j<showNum;j++) {
		            					dataStr += data.split(eval("/"+selectStr+"/ig"))[j] + "<i style='color:#03c339;font-weight:bold;'>" + selectStr + "</i>";
		            				}
		            				dataStr += data.split(eval("/"+selectStr+"/ig"))[showNum];
		            				return dataStr;
		            			}else{
		            				dataStr = data.split(eval("/"+selectStr+"/ig"))[0] + "<i style='color:#03c339;font-weight:bold;'>" + selectStr + "</i>" + data.split(eval("/"+selectStr+"/ig"))[1];
		            				return dataStr;
		            			}
		            		}
		            		//文章标题
		            		if(newsStr.title.indexOf(selectStr) > -1){
		            			newsStr["title"] = changeStr(newsStr.title);
		            		}
		            		
		            		if(newsStr.title.indexOf(selectStr)>-1){
		            			newArray.push(newsStr);
		            		}  
		            	}
		            	workData = newArray;
		            	newsList(workData);
					}
				});
            	
                layer.close(index);
            },2000);
		}else{
			/*layer.msg("请输入需要查询的内容");*/
			var index = layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
			setTimeout(function(){
			$.get("articleList.html",data, function(data) {
				workData = eval(data);
				newsList();
			});
			 layer.close(index);
		},2000);
		}
			
	}); 

	//添加文章
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$(".newsAdd_btn").click(function(){
			var index = layui.layer.open({
				title : "添加文章",
				type : 2,
				content : "articleAddShow.html",
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
	//编辑文章
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$("body").on("click",".works_edit",function(){ 
			var id=$(this).attr("data-id");
			/*alert(id);*/
			var index = layui.layer.open({
				title : "编辑文章",
				type : 2,
				content : "articleEditShow.html?id="+id,
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
	//设置文章是否展示(display)
	//监听指定开关
	  form.on('switch(switchTestDisplay)', function(data){
			var id=$(this).attr("data-id");
			var display=$(this).attr("data-display");
			if(display==1){
				display=2;
			}else if(display==2){
				display=1;
			}
			$(this).attr("data-display",display);
			$.ajax({ 
				type : "post",
				url : "articleUpdate.html",
				data :{
					id:id,
					display:display,
				},
				dataType : 'json',
				/*beforeSend : function() {
					index = top.layer.msg('提交数据，请稍候',{icon: 16,time:false,shade:0.8});
				},*/
				success : function(ret) {
					 setTimeout(function(){
						top.layer.msg("修改成功！");   
			 			layer.closeAll("iframe");
				 		//刷新父页面
					 },1000);   
					/* location.reload();*/
				},
				error : function(ret) {
					setTimeout(function(){
						top.layer.msg("修改失败！");   
						layer.closeAll("iframe");
					},1000);   
					/* location.reload();*/
				}  
			});
			return false;
	  });
	
		//设置文章是否置顶(hot)2为置顶
		//监听指定开关
		  form.on('switch(switchTestHot)', function(data){
				var id=$(this).attr("data-id");
				var hot=$(this).attr("data-hot");
				//若是1,点击后改为2
				if(hot==1){
					hot=2;
				}else if(hot==2){
					hot=1;
				}
				$(this).attr("data-hot",hot);
				$.ajax({ 
					type : "post",
					url : "articleUpdate.html",
					data :{
						id:id,
						hot:hot,
					},
					dataType : 'json',
					/*beforeSend : function() {
						index = top.layer.msg('提交数据，请稍候',{icon: 16,time:false,shade:0.8});
					},*/
					success : function(ret) {
						 setTimeout(function(){
				           /* top.layer.close(index);*/
							top.layer.msg("修改成功！");   
				 			layer.closeAll("iframe");
						 },1000);   
						/* location.reload();*/
					},
					error : function(ret) {
						setTimeout(function(){
							top.layer.msg("修改失败！");   
							layer.closeAll("iframe");
						},1000);   
						/* location.reload();*/
					} 
				});
				return false;
		  });
	//批量删除
	$(".batchDel").click(function(){  
		var $checkbox = $('.works_list tbody input[type="checkbox"][name="checked"]');
		var cars="";
		if($checkbox.is(":checked")){
			layer.confirm('确定删除选中的信息？',{icon:3, title:'提示信息'},function(index){
				var index = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
	            setTimeout(function(){
					$('.works_list tbody input[type="checkbox"][name="checked"]:checked').each(function(i){
						cars+=$(this).val()+",";
					});  
					$.ajax({
						type : "post",
						url : "articleDelete.html",
						data :{
							"ids":cars   
						},
						dataType : 'json',
						beforeSend : function() {
							index = top.layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
						},
						success : function(ret) {
							$('.works_list thead input[type="checkbox"]').prop("checked",false);
			            	form.render();
			                layer.close(index);   
							layer.msg("删除成功");
							location.reload();
						}
					});
		        },2000);
	        });
		}else{ 
			layer.msg("请选择需要删除的信息");
		}
	});

	//全选
	form.on('checkbox(allChoose)', function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		child.each(function(index, item){
			item.checked = data.elem.checked;
		});
		form.render('checkbox');
	});

	//通过判断文章是否全部选中来确定全选按钮是否选中
	form.on("checkbox(choose)",function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"]):checked');
		if(childChecked.length == child.length){
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
		}else{
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
		}
		form.render('checkbox');
	});

	//删除单个
	$("body").on("click",".works_del",function(){  
		var _this = $(this);
		var cars="";
		layer.confirm(
				'确定删除此文章？',
				{icon:3, title:'提示信息'},
				function(index){
					cars=_this.attr("data-id")+",";
					$.ajax({
						type : "post",
						url : "articleDelete.html",
						data :{
							"ids":cars
						},
						dataType : 'json',
						success : function(ret) {
							layer.close(index); 
							layer.msg("删除成功");
							location.reload();	
						}
					});
				});
	});

	function newsList(that){
		//渲染数据
		function renderDate(data,curr){
			var dataHtml = '';
			if(!that){
				currData = workData.concat().splice(curr*nums-nums, nums);
			}else{
				currData = that.concat().splice(curr*nums-nums, nums);
			}
			if(currData.length != 0){
				for(var i=0;i<currData.length;i++){
					dataHtml += '<tr>'
			    	+'<td><input type="checkbox" name="checked" value="'+currData[i].id+'" lay-skin="primary" lay-filter="choose"></td>'   
			    	+'<td>'+(curr*nums-nums+i+1)+'</td>' 
			    	+'<td align="left">'+currData[i].title+'</td>'; 
					var user_id=currData[i].user_id;
					var type_id=currData[i].type_id;
					var type2_id=currData[i].type2_id;
					var user_name="";
					var type_name="";
					var type2_name="";
					//根据type_id获取一级类型名称
					$.ajax({
						type : "post",
						url : "getTypeName.html",
						async: false,
						data :{
							id:type_id
						},
						dataType : 'json',
						success : function(ret) {
							var curData=eval(ret);
							if(curData==null||curData.length==0){
								type_name='此一级类型已被删';//这句前台是显示不出来的,因为1级类型是必须有的
							}else{
								type_name=curData.name;
							}
							/*dataHtml+='<td>'+curData.name+'</td>';*/
						}
					});
					
					//根据type2_id获取用户昵称
					if(type2_id==0){
						type2_name='无';
					}else{
						$.ajax({
							type : "post",
							url : "getType2Name.html",
							async: false,
							data :{
								id:type2_id
							},
							dataType : 'json',
							success : function(ret) {
								var curData=eval(ret);
								if(curData==null||curData.length==0){
									type2_name='无';
								}else{
									type2_name=curData.name;
								}
								/*dataHtml+='<td>'+curData.name+'</td>';*/
							}
						});
						
					}
					
					
					
					
					//根据user_id获取用户昵称
						$.ajax({
							type : "post",
							url : "getUserName.html",
							async: false,
							data :{
								id:user_id
							},
							dataType : 'json',
							success : function(ret) {
								var curData=eval(ret);
								if(curData==null||curData.length==0){
									user_name='已注销';
								}else{
									user_name=curData.name;
								}
								/*dataHtml+='<td>'+curData.name+'</td>';*/
							}
						});
					dataHtml+='<td>'+type_name+'</td>';  
					dataHtml+='<td>'+type2_name+'</td>';  
					dataHtml+='<td>'+user_name+'</td>';  
					dataHtml+='<td>'+currData[i].set_time+'</td>';  
					
					//若文章的展示位 是1,则CheckBox是选中状态,否则就是不显示
					if(currData[i].display==1){
						
						dataHtml+='<td> <input type="checkbox" checked data-id="'+currData[i].id+'" data-display="'+currData[i].display+'" lay-skin="switch" class="switchTestDisplay" lay-filter="switchTestDisplay" lay-text="ON|OFF"></td>';  
					}else{
						dataHtml+='<td> <input type="checkbox"  data-id="'+currData[i].id+'" data-display="'+currData[i].display+'" lay-skin="switch" class="switchTestDisplay" lay-filter="switchTestDisplay" lay-text="ON|OFF"></td>';
					}
					//若文章的置顶位置是1,则不置顶,否则置顶
					if(currData[i].hot==1){
						dataHtml+='<td> <input type="checkbox"  data-id="'+currData[i].id+'" data-hot="'+currData[i].hot+'" lay-skin="switch" class="switchTestHot" lay-filter="switchTestHot" lay-text="ON|OFF"></td>';  
					}else{
						dataHtml+='<td> <input type="checkbox" checked data-id="'+currData[i].id+'" data-hot="'+currData[i].hot+'" lay-skin="switch" class="switchTestHot" lay-filter="switchTestHot" lay-text="ON|OFF"></td>';  
					}
					
					dataHtml+='<td><a class="layui-btn layui-btn-mini works_edit" data-id="'+currData[i].id+'"><i class="iconfont icon-edit"></i> 编辑</a>'
					+'<a class="layui-btn layui-btn-danger layui-btn-mini works_del" data-id="'+currData[i].id+'"><i class="layui-icon">&#xe640;</i> 删除</a>'
			        +'</td>'   
			    	+'</tr>';  
				}
			}else{
				dataHtml = '<tr><td colspan="8">暂无数据</td></tr>';
			}
		    return dataHtml;
		}

		//分页
		var nums = 13; //每页出现的数据量
		if(that){
			workData = that;
		}   
		laypage({
			cont : "page",
			pages : Math.ceil(workData.length/nums),
			jump : function(obj){
				$(".works_content").html(renderDate(workData,obj.curr));
				$('.works_list thead input[type="checkbox"]').prop("checked",false);
		    	form.render();
			}
		});
	}
});
