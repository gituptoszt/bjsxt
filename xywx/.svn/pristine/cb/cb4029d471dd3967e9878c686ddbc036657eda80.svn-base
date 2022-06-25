var $form;
var form;
var $;
layui.config({
	base : "../../js/"
}).use([ 'form', 'layer', 'upload', 'laydate' ], function() {
	form = layui.form();
	var layer = parent.layer === undefined ? layui.layer : parent.layer;
	$ = layui.jquery;
	$form = $('form');
	laydate = layui.laydate;

	
	/*var path = getRealPath();*/
	layui.upload({ 
		url : "imgUpload.html",
		success : function(res) {
			res=eval(res);   
			/*$("#userFace").attr("src",path+res.data.src); */
			$("#userFace").attr("src",res.data.src); 
		}    
	}); 

/*	layui.upload({ 
	    url: 'imgUpload.html' //接口url
	    ,type: 'post' //默认post
	    ,success : function(res) {
			res=eval(res); 
			alert(res);
			$("#userFace").attr("src",res.data.src); 
				
		}
		,error:function(res){
			alert(1);
		}
	});*/
	
	//这一段是将图片显示在页面
	/*var url = "imgLoad.html?path="+$("#userFace").attr("src");   
    var xhr = new XMLHttpRequest();  
    xhr.open('GET', url, true);  
    xhr.responseType = "blob";  
    xhr.onload = function () {  
        if (this.status == 1) {  
            var blob = this.response;  
            var img = document.createElement("img");  
            img.onload = function (e) {  
                window.URL.revokeObjectURL(img.src);  
            };  
            img.src = window.URL.createObjectURL(blob);  
            $("#userFace").attr("src",img.src);    
        }  
    };  
    xhr.send();*/
	
	//上传图片
   /* layui.upload({
		url : "imgUpload.html",
		before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
			top.layer.msg('数据提交中，请稍候', {
				icon : 16,
				time : false,
				shade : 0.8
			});
		 },
		success : function(res) {
			setTimeout(function() {
				res=eval(res);  
				$("#userImg").val(res.data.src); 
				var url = "imgLoad.html?path="+res.data.src;  
			    var xhr = new XMLHttpRequest();  
			    xhr.open('GET', url, true);  
			    xhr.responseType = "blob";  
			    xhr.onload = function () {  
			        if (this.status == 1) {  
			            var blob = this.response;  
			            var img = document.createElement("img");  
			            img.onload = function (e) {  
			                window.URL.revokeObjectURL(img.src);  
			            };  
			            img.src = window.URL.createObjectURL(blob);  
			            $("#userFace").attr("src",img.src);    
			        }  
			    };  
			    xhr.send();
			    layer.closeAll(); //关闭loading
			}, 1000);   
			
		},
		error : function(res) {
			layer.closeAll(); //关闭loading
		}
	});*/

    
    
	/*提交个人资料,这里默认的是form提交,并不是ajax,所以底部要加上return false; 
		这样action方法返回类型才可以是void,否则跳转找不到页面*/
	form.on("submit(changeUser)", function(data) {
		var index;
		var user = $(".username").val();
		var name = $(".nickname").val();
		var id = $(".obj_id").val();
		var img = $("#userFace").attr("src");
		//修改个人信息
		$.ajax({
			type : "post",
			url : "userInfoUpdate.html",
			data : {
				'user' : user,
				'name' : name,
				'img' : img,
				'id' : id
			},
			async : false,
			dataType : 'json',
			beforeSend : function() {
				index = top.layer.msg('数据提交中，请稍候', {
					icon : 16,
					time : false,
					shade : 0.8
				});
			},
			success : function(ret) {
				setTimeout(function() {
					layer.close(index);
					layer.msg("信息修改成功！");
					top.location.reload(); 
				}, 2000);
			},
			error : function() {

			}
		});
			
		return false; 
		 });

	//修改密码
	form.on("submit(changePwd)", function(data) {
		var newPwd = $("#newPwd").val();
		var index;
		$.ajax({
			type : "post",
			url : "userPwdUpdate.html",
			data : {
				"pwd" : newPwd,
			},
			dataType : 'json',
			beforeSend : function() {
				index = top.layer.msg('数据提交中，请稍候', {
					icon : 16,
					time : false,
					shade : 0.8
				});
			},
			success : function(ret) {
				setTimeout(function() {
					layer.close(index);
					layer.msg("密码修改成功！");
					$(".pwd").val("");
				}, 2000);
			}
		});

		return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
});
//下面尚未用到
function getRealPath() {
	var localObj = window.location;
	var contextPath = localObj.pathname.split("/")[1];
	var basePath = localObj.protocol + "//" + localObj.host + "/" + contextPath;
	return basePath;
}