/**
 * 页面公共部分头部的js
 */ 	
/*getUser();*/
$(function(){
	
	/*点击登陆弹出窗口*/
   $("body").on("click","#login",function(){
	   layer.open({
			type : 2,
			title : false,
			closeBtn : 1,
			shadeClose : true,
			area : [ "300px", "300px" ],
			/*maxmin : true,*/
			content : 'pcLogin2.html'
		});
    });
    /*点击退出登陆*/
	$("body").on("click","#logout",function(){
		location.href="pcLogout.html";
		
		 
		
	    /*layer.open({
		type : 2,
		title : false,
		closeBtn : 0,
		shadeClose : false,
		area : [ "300px", "300px" ],
		maxmin : true,
		content : 'pcLogout.html'
	});*/
	    
});
	
    /*点击导航栏类型打开窗口*/
    //根据一级类型获取文章列表
    $("body").on("click",".type_first",function(){
    	
    	if(isLogin()==1){
    		return false;
    	}
    	
		//获取id
    	var id=$(this).attr("data-id");
    	location.href="pcPageList1.html?type_id="+id;
    });
    
    //根据二级类型获取文章列表
    $("body").on("click",".type_second",function(){
    	
    	if(isLogin()==1){
    		return false;
    	}
    	
		//获取id 
    	var id=$(this).attr("data-id");
    	location.href="pcPageList2.html?type2_id="+id;
    });
    
    
    /*点击公告进入公告文章页面 */
    $("body").on("click",".notice",function(){
    	
    	
    	if(isLogin()==1){
    		return false;
    	}
    	
		//获取id 
    	var id=$(this).attr("data-id");
    	location.href="pcPageNotice.html?id="+id;
    });
    
});
function getUser() {
	$.ajax({
		type : "post",
		url : "getUserInfo.html",
		dataType : 'json',
		success : function(result) {
			result = eval(result);
			if (result == 200) {

			} else {
				/*layer.alert('尚未登陆或超时,请重新登录！', {
					icon : 3,
					title : '提示信息',
					closeBtn : 0
				}, function(index) {
					location.href = "pcLogin.html";
				}, 1000);*/
				
				   layer.open({
						type : 2,
						title : false,
						closeBtn : 1,
						shadeClose : true,
						area : [ "300px", "300px" ],
						/*maxmin : true,*/
						content : 'pcLogin2.html'
					});
			}
		}
	});
}

//判断是否登陆,若未登陆,则无法不跳转
function isLogin(){
	/*var admin=sessionStorage.getItem("pcAdminSession");*/
	var admin=$("#login span").html();
	var noUser=1;
	if(admin==null){
		var index1=layer.confirm(
				'登陆才可操作,是否登陆？',
				{icon:3, title:'提示信息'},
				function(index){
					layer.close(index1);
					layer.open({
						type : 2,
						title : false,
						closeBtn : 1,
						shadeClose : true,
						area : [ "300px", "300px" ],
						/*maxmin : true,*/
						content : 'pcLogin2.html'
					});
				});
		return noUser;
	}
}


