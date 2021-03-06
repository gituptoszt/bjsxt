layui.config({
	base : "js/"
}).use(['form','layer','jquery','laypage'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	//加载页面数据
	var usersData = '';
	$.get("usersList.html", function(data){
		usersData = eval(data);
		//执行加载数据的方法
		usersList();
	});

	//查询
	$(".search_btn").click(function(){
		var userArray = [];
		if($(".search_input").val() != ''){
			var index = layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
            setTimeout(function(){
            	$.ajax({
					url : "usersList.html", 
					type : "get",
					dataType : "json",
					success : function(data){
						for(var i=0;i<data.length;i++){
							var usersStr = data[i];
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
		            		//名
		            		if(usersStr.name.indexOf(selectStr) > -1){
			            		usersStr["name"] = changeStr(usersStr.name);
		            		}
		            		//用户名
		            		if(usersStr.user.indexOf(selectStr) > -1){
		            			usersStr["user"] = changeStr(usersStr.user);
		            		}
		            		
		            		if(usersStr.name.indexOf(selectStr)>-1||usersStr.user.indexOf(selectStr)>-1){
		            			userArray.push(usersStr);
		            		}
		            	}
		            	usersData = userArray;
		            	usersList(usersData);
					}
				});  
                layer.close(index);
            },2000);
		}else{
			layer.msg("请输入需要查询的内容");
		}
	});

	//添加用户
	$(window).one("resize",function(){
	$(".usersAdd_btn").click(function(){
		var index = layui.layer.open({
			title : "添加用户",
			type : 2,
			area:["550px","300px"],
			content : "addUser.html",
			success : function(layero, index){
				setTimeout(function(){
					layui.layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},500);
			}
		});
		//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
		/*$(window).resize(function(){
			layui.layer.full(index);
		});*/
		/*layui.layer.full(index);*/
	});
	}).resize();
	//用户编辑
	$("body").on("click",".users_edit",function(){  //编辑
			var id=$(this).attr("value");
			var index = layui.layer.open({
				title : "编辑用户",
				type : 2,
				area:["550px","300px"],
				content : "editUser.html?id="+id,
				success : function(layero, index){
					setTimeout(function(){
						layui.layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
							tips: 3
						});
					},500);
				}
			});
			//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
			/*$(window).resize(function(){
				layui.layer.full(index);
			});
			layui.layer.full(index);*/
		
	});
	//批量删除
	$(".batchDel").click(function(){
		var $checkbox = $('.users_list tbody input[type="checkbox"][name="checked"]');    
		var cars="";
		if($checkbox.is(":checked")){
			layer.confirm(
					'确定删除选中的信息？',  
					{icon:3, title:'提示信息'},
					function(index){
						var index = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
						setTimeout(function(){
						    
							$.ajax({
								type : "post",
								url : "usersDelete.html",
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
			layer.msg("请选择需要删除的用户");
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

	//通过判断 是否全部选中来确定全选按钮是否选中
	form.on("checkbox(choose)",function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"]):checked')
		if(childChecked.length == child.length){
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
		}else{
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
		}
		form.render('checkbox');
	});


	//用户删除
	$("body").on("click",".users_del",function(){  //删除   
		var _this = $(this);
		var cars="";
		layer.confirm(
				'确定删除此此用户？',
				{icon:3, title:'提示信息'},
				function(index){
					cars=_this.attr("data-id")+",";
					$.ajax({
						type : "post",
						url : "usersDelete.html",
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

	function usersList(){
		//渲染数据
		function renderDate(data,curr){
			var dataHtml = '';
			currData = usersData.concat().splice(curr*nums-nums, nums);
			if(currData.length != 0){
				for(var i=0;i<currData.length;i++){
					dataHtml += '<tr>'
			    	+  '<td><input type="checkbox" name="checked" lay-skin="primary" value="'+currData[i].id+'" lay-filter="choose"></td>'
			    	+  '<td>'+(curr*nums-nums+i+1)+'</td>' 
			    	+  '<td>'+currData[i].name+'</td>'
			    	+  '<td>'+currData[i].user+'</td>'  
			    	+  '<td>'
					+    '<a class="layui-btn layui-btn-mini users_edit" value="'+currData[i].id+'"><i class="iconfont icon-edit"></i> 编辑</a>'
					+    '<a class="layui-btn layui-btn-danger layui-btn-mini users_del" data-id="'+currData[i].id+'"><i class="layui-icon">&#xe640;</i> 删除</a>'
			        +  '</td>'   
			    	+'</tr>';
				}
			}else{
				dataHtml = '<tr><td colspan="8">暂无数据</td></tr>';
			}
		    return dataHtml;
		}

		//分页
		var nums = 13; //每页出现的数据量
		laypage({
			cont : "page",
			pages : Math.ceil(usersData.length/nums),
			jump : function(obj){
				$(".users_content").html(renderDate(usersData,obj.curr));
				$('.users_list thead input[type="checkbox"]').prop("checked",false);
		    	form.render();
			}
		});
	}
        
});