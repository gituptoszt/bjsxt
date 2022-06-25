layui.config({
	base : "js/"
}).use(['form','layer'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		$ = layui.jquery;
	//video背景
	$(window).resize(function(){
		if($(".video-player").width() > $(window).width()){
			$(".video-player").css({"height":$(window).height(),"width":"auto","left":-($(".video-player").width()-$(window).width())/2});
		}else{
			$(".video-player").css({"width":$(window).width(),"height":"auto","left":-($(".video-player").width()-$(window).width())/2});
		}
	}).resize();
	
	//点击图片更改验证码
	$("#verifyImg").click(function(){
		changeCheckCode();
	});
	
	//登录按钮事件
	form.on("submit(login)",function(data){
		
		var user=$(".username").val();
		var pwd=$(".password").val();
		var codeGetPwd=$(".codeGetPwd").val();
		
		$.ajax({
			type:"post",
			url:"isLoginSuccess.html",
			data:{
				user:user,
				pwd:pwd,
				bei_1:codeGetPwd,
			},
			beforeSend:function(){
				index=layer.msg('正在登陆,请稍后',{
					icon:6,
					time:false,
					shade:0.8
				});
			},
			success:function(data){
				if(data==2){
					layer.close(index);
					layer.msg('验证码错误,请重新登陆');
				}else if(data==1){
					layer.close(index);
					layer.msg('用户名或密码错误,请重新登陆');
				}else{
					parent.location.reload();
					setTimeout(function(){
					top.layer.msg("登陆成功！"); 
					layer.closeAll();
					/*window.location.href = "pcIndex.html";	*/
					//刷新父页面
			 		parent.location.reload();
					},1000);  
				}
			}
		});
		
		return false;
	});
});
function changeCheckCode() {
	document.getElementById('verifyImg').src = '../codeGetPwd.html?update='
			+ Math.random();
}