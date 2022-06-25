<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆弹窗</title>
<script src="<%=request.getContextPath()%>/layui/layui.js"></script>   
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" media="all" />
<style type="text/css">
        *{
            margin: 0 auto;
            padding: 0;
        }
        .login_page{
            padding-top: 50px;
        }
        .login_form{
            display: block;
            width: 400px;
            margin: 0 auto;
        }
        .login_item{
            width: 400px;
            height: 40px;
            line-height: 40px;
            margin: 10px auto;
        }
        .login_item label{
            display: inline-block;
            width: 80px;
            height: 35px;
        }
        .login_item .input,input{
            display: inline-block;
            width: 300px;
            height: 35px;
            border-radius: 3px;
            outline: none;
        }
        .secure_code_input input{
            display: inline-block;
            width: 100px;
        }
        .button_label{
            visibility: hidden;
        }
        .button{
            margin-top: 50px;
            width: 300px;
            height: 40px !important;
            line-height: 40px !important;
            font-size: 16px !important;
            padding: 0 !important;
        }

    </style>
</head> 
<body>
	<div class="login_page">
    <form class="login_form">
        <div class="login_item ">
            <label class="user_text">用户名</label>
            <div class="input user_input">
                <input type="text" class="username">
            </div>
        </div>
        <div class="login_item">
                <label class="password_text">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                <div class="input password_input ">
                    <input type="text" class="password">
                </div>
        </div>
        <div class="login_item">
                <label class="secure_code_text">验证码</label>
                <div class="input secure_code_input ">
                    <input type="text" class="secure_code">
                    <input type="text" class="secure_code">
                </div>
        </div>
        <!--<input type="hidden" value="${obj.work_id}" id="workId">-->
        <div class="login_item">
                <label class="button_label">登&nbsp;&nbsp;&nbsp;&nbsp;陆</label>
                  <button class="layui-btn button">登录</button>
        </div>
    </form>
</div>
	
	<!-- 移动导航 -->
	 <script type="text/javascript" src="<%=request.getContextPath()%>/layui/lay/modules/layer.js"></script>

</body>
</html>