<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="">
    <title>登陆</title>
    <link rel="shortcut icon" href="favicon.ico">
    <meta name="keywords" content="游邮文化,UU"/>
    <meta name="renderer" content="webkit">
    <meta name="renderer" content="ie-comp">
    <meta name="renderer" content="ie-stand">
    <meta name="description" content="游邮文化,UU"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/Public/Home/css/style.css">
    <script src="/Public/Home/js/jquery-1.8.1.min.js"></script>
    <script src="/Public/Home/js/my.js"></script>
    <script src="/Public/Home/js/validation.js"></script>
</head>
<body>
<div class="container_w login_w">
    <div class="container login">
        <div class="login_title">登陆</div>
        <div class="login_con">
            <div class="login_con_box">
                <FORM method="post" action="<?php echo U('Home/Index/login');?>">
                <div class="login_con_con_box_user">
                    <span>用户名</span><br>
                    <input tip="用户名" type="text" name="username" class="data_list" required="required" placeholder="张三">
                </div>
                <div class="login_con_con_box_user">
                    <span>密码</span><br>
                    <input tip="密码" type="password" name="pwd" class="data_list" required="required" placeholder="fas">
                </div>
                <div class="login_bot">
                    <div class="l login_bot_rem" style="display: none">
                        <em class="cur" onOff='0'></em>
                        <span class="login_bot_span_pwd">记住密码</span>
                    </div>
                    <div ><input class="r cur login_bot_span_login" name="submit" type="submit" value="登陆"></a></div>
                </div>
                </FORM>

                <div class="login_bot_foot" style="display: none">
                    <a href="pwd.html" class="login_bot_foot_a">忘记密码</a><a href="reg.html">会员注册</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="c container_w login_foot_w">
    <div class="container footer div_text_center">
        Copyright@2013Enterprise information All Rights Reserved 京ICP备 01245785号
    </div>
</div>
<script type="text/javascript" src="/Public/Admin/js/layui/layui.js"></script>
<script type="text/javascript" src="/Public/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>