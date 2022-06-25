layui.config({
	base : "js/"
}).use(['form','layer','jquery','laypage'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	
	//加载类型数据
	var workData = '';
	$.get("typeList.html", function(data) {
		workData = eval(data);
		newsList();
	});

	//查询
	$(".search_btn").click(function(){
		var newArray = [];
		if($(".search_input").val() != ''){
			var index = layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
            setTimeout(function(){
            	$.ajax({
					url : "typeList.html",
					type : "get",
					dataType : "json",
					success : function(data){
						workData = data;
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
		            		//一级类型
		            		if(newsStr.name.indexOf(selectStr) > -1){
			            		newsStr["name"] = changeStr(newsStr.name);
		            		}
		            		//二级类型,二级类型有的为空,若为空需要加判断,否则报错
		            		if(null==newsStr.type|| ""==newsStr.type){
		            			
							}else if(newsStr.type.indexOf(selectStr) > -1){
		            			newsStr["type"] = changeStr(newsStr.type);
		            		}
		            		
		            		
		            		
		            		if(newsStr.name.indexOf(selectStr) > -1){
		            			newArray.push(newsStr);
		            		} 
		            		
		            		if(null==newsStr.type|| ""==newsStr.type){
		            			
							}else if(!(newsStr.name.indexOf(selectStr) > -1)&&(newsStr.type.indexOf(selectStr) > -1)){
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
			layer.msg("请输入需要查询的内容");
		}
	});

	//添加一级类型
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$(".newsAdd_btn").click(function(){
			var index = layui.layer.open({
				title : "添加一级类型",
				type : 2,
				content : "typeAddShow.html",
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
	
	//点击添加二级类型
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$("body").on("click",".works_add",function(){ 
			var id=$(this).attr("data-id");
			/*alert(id);*/
			var index = layui.layer.open({
				title : "添加二级类型",
				type : 2,
				content : "type2AddShow.html?id="+id,
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
	//编辑类型
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$("body").on("click",".works_edit",function(){ 
			var id=$(this).attr("data-id");
			/*alert(id);*/
			var index = layui.layer.open({
				title : "类型编辑",
				type : 2,
				content : "typeEditShow.html?id="+id,
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
						url : "typeDelete.html",
						data :{
							"ids":cars   
						},
						dataType : 'json',
						beforeSend : function() {
							index = top.layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
						},
						success : function(ret) {
							$('.users_list thead input[type="checkbox"]').prop("checked",false);
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
				'确定删除此类型？',
				{icon:3, title:'提示信息'},
				function(index){
					cars=_this.attr("data-id")+",";
					$.ajax({
						type : "post",
						url : "typeDelete.html",
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
					if(null==currData[i].type|| ""==currData[i].type){
						currData[i].type="无";
					}
					dataHtml += '<tr>'
			    	+'<td><input type="checkbox" name="checked" value="'+data[i].id+'" lay-skin="primary" lay-filter="choose"></td>'   
			    	+'<td align="left">'+(i+1)+'</td>'   
					+'<td>'+currData[i].name+'</td>'  
					+  '<td><a class="layui-btn layui-btn-mini works_edit" data-id="'+data[i].id+'"><i class="iconfont icon-edit"></i> 编辑</a>'
					+  '<a class="layui-btn layui-btn-danger layui-btn-mini works_del" data-id="'+data[i].id+'"><i class="layui-icon">&#xe640;</i> 删除</a>'
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
