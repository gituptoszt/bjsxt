layui.config({
	base : "js/"
}).use(['form','layer','jquery','laypage'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	
	//加载学校公告页面数据
	var workData = '';
	$.get("noticeList.html", function(data) {
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
					url : "noticeList.html",
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
			layer.msg("请输入需要查询的内容");
		}
	});

	//添加学校公告
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$(".newsAdd_btn").click(function(){
			var index = layui.layer.open({
				title : "添加公告",
				type : 2,
				content : "noticeAddShow.html",
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
	//编辑工作事项
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$("body").on("click",".works_edit",function(){ 
			var id=$(this).attr("data-id");
			/*alert(id);*/
			var index = layui.layer.open({
				title : "编辑公告",
				type : 2,
				content : "noticeEditShow.html?id="+id,
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
			layer.confirm(
					'确定删除选中的信息？',
					{icon:3, title:'提示信息'},
					function(index){
							var index = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
							setTimeout(function(){
									$('.works_list tbody input[type="checkbox"][name="checked"]:checked').each(function(i){
											cars+=$(this).val()+",";
									});  
									$.ajax({
										type : "post",
										url : "noticeDelete.html",
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
				'确定删除此工作记录？',
				{icon:3, title:'提示信息'},
				function(index){
					cars=_this.attr("data-id")+",";
					$.ajax({
						type : "post",
						url : "noticeDelete.html",
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
			    	+'<td align="left">'+currData[i].title+'</td>'   
					+'<td>'+currData[i].set_time+'</td>'  
					/*+  '<td><a class="layui-btn layui-btn-mini works_item" data-id="'+data[i].id+'"><i class="iconfont icon-edit"></i> 事项</a> '*/
					+  '<td><a class="layui-btn layui-btn-mini works_edit" data-id="'+currData[i].id+'"><i class="iconfont icon-edit"></i> 编辑</a>'
					+  '<a class="layui-btn layui-btn-danger layui-btn-mini works_del" data-id="'+currData[i].id+'"><i class="layui-icon">&#xe640;</i> 删除</a>'
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
