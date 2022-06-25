// JavaScript Document
/*******************************************************************************
 * 使用方法**************
 * 
 * 第一步: 导入: Jquery.js 建议 导入 Jquery 1.4 版本 和 导入 paging.js . 
 * 第二步: 页面上需要有<div id="page"></div> 这个标签 这个就是用来放分页的地方. 
 * 第三步: 在页面上 加上 小脚本 或者在JS 的 onload里写上getpage(); 都可以
 * 第四步：getpage()需要 6个参数按顺序 分别是  'URL访问路径','总数','每页显示数量',
 *        '当前起始条数（从第多少条开始显示）'"提交类型","start的字段名称","number字段名称"
 * 
 * 提交类型 1 为form 提交 2为 无参数 直接提交
 * FORM 提交 需要在页面上 自己写个form id=page_form表单 里面的内容都是隐藏的
 * 除了自己需要的参数外 有1个是必须的 一是page_start 必须有这个input
 * 
 * 
 * 
 ******************************************************************************/
var p_num;// 每页显示多少条
var w; // 总共页数
var p_action = ""; // 访问路径 如果没有参数 则写上?1=1
var p_pd = ""; // 判断 1.Ajax 2 load 3 form
var page = 8;
var p_startname="";
var p_numbername="";
function getpage(action, maxnum, num, now, pd,startname,numbername) {
	p_action = action; // 路径
	p_startname=startname;
	p_numbername=numbername;
	if (maxnum <= 0)
		return; // 如果最大值 小于等于0
	p_num = num; // me
	p_pd = pd; // 选中
	w = Math.ceil(maxnum / num); // 算法 向上取值
	now = Math.ceil(now / num) + 1; // 算法向上取值
	now == 0 ? now = 1 : 0; // 判断是否有值 
	var d = $("#page"); // 获取page Jquery 对象
	d.html("");
/*	d.append("<div onclick='lyf_page_post(1)'></div> ");*/
	d.append("<div onclick='lyf_page_post(" + (now - 1) + ")'>＜</div> "); // 拼接
	var p = Math.ceil(maxnum / num); // 算法向上取值
	var x = now - parseInt(page / 2) - 1; // 算法向上取值
	for (i = 0; i < page; i++) {
		x = x + 1
		x < 1 ? x = 1 : 0; // 最小页数
		if (p >= x) { // 最大页面
			if (x == now) { // 是当前页
				d.append("<div class='lyf_now' onclick='lyf_page_post(" + x
						+ ")' >" + x + "</div> ");
			} else { // 判断小于等于 9
				d.append("<div onclick='lyf_page_post(" + x + ")' >" + x
						+ "</div> ");
			}
		}    
			 
	}    
	if(w>7){ 
	d.append("<div>···</div> ");
	d.append("<div onclick='lyf_page_post(" + p + ")'>"+p+"</div> ");
	}
	d.append("<div onclick='lyf_page_post(" + (now + 1) + ")'>＞</div> ");
	d.append("<div class='sty_div' style=''><input type='text' class='num_page'></div> ");//自定义页数
	d.append("<div onclick='index_page("+p+")' style='padding:0px;background:red;'><span>GO</span></div> ");//跳转按钮
	 
/*	d.append("<div onclick='lyf_page_post(" + w + ")'></div> ");*/    
	lyf_page_Style(); // 改变样式    
	lyf_now_page();// 设置当前选中的分页样式     

}  

function index_page(p){
	var x=$(".num_page").val();
	if(!isNaN(x)&&x>0){
		if(x>p){
			x=p;
		} 
		lyf_page_post(x);  
	}else{
		 alert("请输入正确的页数!");
	}    
	
}
// 提交
function lyf_page_post(x) {
	x > w ? x = 1 : 0; 
	x == 0 ? x = 1 : 0;
	var start = (x - 1) * p_num; // 算数
	//如果是带条件的分页 请自己在页面上创建一个 隐藏的form表单 自己将数据填充 然后通过分页来提交
	if (p_pd == 1) { // from 提交
		$("#page_form").attr("action", p_action);
		$("#page_start").val(start);
		$("#page_form").submit();
	}
	//alert(location = p_action + "?"+p_startname+"=" + start + "&"+p_numbername+"="+p_num);
	if (p_pd == 2) {
		location = p_action + "?"+p_startname+"=" + start + "&"+p_numbername+"="+p_num;
	}
}

// 改变样式 <style type="text/css">
function lyf_page_Style() {
	$("#page div").css({    
		"background" : "#e7ebee",// 边框样式
		"min-width":"10px",
		 "border-radius":"1px",
		"height":"20px",    
		  "line-height":"20px",    
		  "text-align": "center",  
		"padding" : "4px 12px",// 内距
	"float" : "left",// 左浮动
	"margin" : "0px 3px",// 外边距    
		"cursor" : "pointer",// 鼠标样式
		"color" : "#99a1a7",// 字颜色
		"font-size" : "12px",// 字大小 
		"position" : "relative",// 定位
		/*"right" : "50%",// 为了居中*/	
	
		"font-family" : "microsoft yahei"// 字体样式
	});
	
	$(".num_page").css({		//自己输入页数  
		"width":"30px",    
		"border":"1px solid #ccc",
		
		"height":"26px",
		"margin-right":"5px", 
	})
	$(".sty_div").css({		//自己输入页数 
		"width":"30px",    
		"background":"", 
		"padding":"0", 
		"margin-right":"5px",      
		"margin-left":"2px",      
		"height":"26px"        
	})     
	// 鼠标移上去 和移下来
	$("#page div").hover(function() {  
		$(this).css({
			"background" : "#bdc3c7"
		})
	}, function() { 
		$(this).css({ 
			"background" : "#e7ebee",// 字颜色
		})
		lyf_now_page();
	})
	// 分页框的位置
	$("#page").css({// 分页按钮居中
		"position" : "relative",    
		"float" : "right",
		"margin" : "2px 0px",// 外边距
	});
}
// 设置当前选中的颜色和背景
function lyf_now_page() {
	$("div[class='lyf_now']").css({
		"background" : "#ff6600",
		"color" : "#FFFFFF"
	}); // 设置字体颜色
}
