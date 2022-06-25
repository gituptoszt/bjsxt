layui.config({
	base : "js/" 
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;
	
	//点击添加二级类型弹出窗口
	/*$(".worksItemAdd").click(function(){*/
	/*$("body").on("click",".worksItemAdd",function(){ 
		var work_id=$("#workId").val(); 
		var index=layui.layer.open({
			title:"添加二级类型",
			type:2,
			area:["550px","650px"],
			content:"workTimeLineAdd.html?work_id="+work_id,
			success:function(layero,index){
				setTimeout(function(){
					layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},500);
			}
		});
		return false;
	});*/
	//点击编辑弹出窗口
	/*$("body").on("click",".item_edit",function(){ 
		
		var id=$(this).attr("data-id"); 
		var index=layui.layer.open({
			title:"编辑二级类型",
			type:2,
			area:["550px","650px"],
			content:"workTimeLineEdit.html?id="+id,
			success:function(layero,index){
				setTimeout(function(){
					layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},500);
			}
		});
		return false;
	});*/
	//点击删除弹出窗口
	/*$("body").on("click",".item_del",function(){ 
		var id=$(this).attr("data-id"); 
		layer.confirm('确定删除该事项?',{icon:3, title:'提示信息'},function(){
			$.ajax({
				type:"post",
				url:"workItemListDel.html",
				data:{id:id},
				dataType : 'json',
				
				success : function(ret) {
					if (ret!=0) {
						layer.msg("删除成功");
						location.reload();
					}
					
			}
			});
		});
	});*/
	
	//加载页面数据
	 
	workItemListQuery();
	function workItemListQuery(){
		var work_id=$("#workId").val();
		var url="type2AddListQuery.html?work_id="+work_id;
		$.get(url,function(data){
			var ItemData=eval(data);
			var dataHtml='';
			if(ItemData.length!=0){
				for(var i=0;i<ItemData.length;i++){
					dataHtml+='<i data-id="'+ItemData[i].id+'" class="layui-icon layui-btn-sm item_del" style="color:red;float:right">&#xe640;</i>'
							+'<i data-id="'+ItemData[i].id+'" class="layui-icon layui-btn-sm item_edit" style="color:red;float:right;">&#xe642;</i></h4>'
							+'<h4>二级类型</h4>'
							+'<p>'+ItemData[i].name+'</p></li>';
					$("ul").append(dataHtml);		
					
				}
			}
			
			
		});
	}
	

});
