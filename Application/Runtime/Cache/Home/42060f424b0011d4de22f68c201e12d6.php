<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线支付</title>
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
    <script src="/Public/Home/js/validation.js"></script>
    <script src="/Public/Home/js/my.js"></script>
</head>
<body>
<div class="container_w head_w">
    <div class="container head">
        <div class="l head_left">
            <a href="<?php echo U('Home/Index/index');?>"><img src="/Public/Home/images/uu_logo.png" alt=""></a>
        </div>
        <div class="r head_right">
            <span class="head_right_back"><em></em> <a href="<?php echo U('Home/Index/index');?>">返回首页</a></span>
            <span class="head_right_back head_right_out"><em></em> <a href="<?php echo U('Home/Public/login');?>">退出系统</a></span>
        </div>
    </div>
</div>

<div class="container_w main_w">
    <div class="container main">
        
<?php
 $us_menu['pay_status']=0; $User=M('member'); $us_menu=$User->table('think_store S') ->join('think_member M on S.user_id=M.id') ->field('S.*,M.username,M.nickname') ->where('M.id='.$_SESSION['id']) ->find(); ?>

<div class="l main_left">
    <ul>
        <li class="cur main_left_menu" style="background: #006445;"><a href="">系统菜单</a></li>
        <li onOff='0' class="cur main_left_li_dif main_left_li1">
            <span>人力</span>
            <ol>
                <li><a href="<?php echo U('Home/Member/sys');?>">系统架构</a></li>
                <li><a href="<?php echo U('Home/Member/human');?>">人力架构</a></li>
            </ol>
        </li>
        <li onOff='0' class="cur main_left_li_dif main_left_li2">
            <span>业绩</span>
            <ol>
                <li><a href="<?php echo U('Home/Bonus/bill');?>">账单</a></li>
            </ol>
        </li>
        <li class="cur main_left_li3">
            <span><a href="<?php echo U('Home/Uuce/uu_kucun');?>">我的库存</a></span>
        </li>
        <li onOff='0' class="cur main_left_li_dif main_left_li4">
            <span>报单</span>
                <ol>
                    <li><a href="<?php echo U('Home/Uuce/uu_re');?>">UU册报单</a></li>
                    <li><a href="<?php echo U('Home/Travel/travel_list');?>">旅游报单</a></li>
                    <li><a href="<?php echo U('Home/Member/conm_re');?>">入职推荐报单</a></li>
                    <?php  if(isset($us_menu)) { ?>
                    <li <?php if(($us_menu["pay_type"] == 1 || $us_menu["pay_img"] != 0)): ?>style="display: none"<?php endif; ?> ><a href="<?php echo U('Home/Store/open_offline');?>">开店报单</a></li>
                    <?php } ?>
                    <li <?php if($us_menu["pay_status"] == 1): ?>style="display: none"<?php endif; ?> ><a href="<?php echo U('Home/Member/store');?>">开店报单</a></li>
                    <li <?php if(($us_menu["pay_status"] != 1)): ?>style="display: none"<?php endif; ?> ><a href="<?php echo U('Home/Store/store_info');?>">店铺信息</a></li>
                </ol>
        </li>
        <li class="cur main_left_li5">
            <span><a href="<?php echo U('Home/Member/userset');?>">密码修改</a></span>
        </li>
        <li class="cur main_left_li6">
            <span><a href="<?php echo U('Home/Member/per_info');?>">个人信息</a></span>
        </li>

    </ul>
</div>

        <div class="r main_right">
            <div class="main_right_title main_right_title_blue">
                <em></em>
                <span>支付<a href="" class="yeji_span">  </a></span>
            </div>
            <form class="main_right_con"  action="<?php echo U('Home/Pay/doalipay');?>" method="post" name="cart4_form" id="cart4_form">
                <div class="reg_con_input_all">
                    <div class="main_right_con1">
                        <h4>在线支付</h4>

                        <div class="reg_con_span edit_con_input reg_mar_l">
                            <span class="online">选择支付方式：</span>
                            <ol>
                                <li class="zhifu1">
                                    <input type="radio" name="radio"/>
                                    <span class="z_span"><i></i></span>
                                    <img src="/Public/Home/images/zhifu21.jpg" style="width:120px; height:40px "   />
                                </li>
<!--                                <li class="zhifu1">
                                    <input type="radio" name="radio"/>
                                    <span class="z_span"><i></i></span>
                                    <img src="/Public/Home/images/zhifu22.jpg" alt=""/>
                                </li>
                                <li class="zhifu1">
                                    <input type="radio" name="radio"/>
                                    <span class="z_span"><i></i></span>
                                    <img src="/Public/Home/images/zhifu23.jpg" alt=""/>
                                </li>
                                <li class="zhifu1">
                                    <input type="radio" name="radio"/>
                                    <span class="z_span"><i></i></span>
                                    <img src="/Public/Home/images/zhifu24.jpg" alt=""/>
                                </li>
                                <li class="zhifu1">
                                    <input type="radio" name="radio"/>
                                    <span class="z_span"><i></i></span>
                                    <img src="/Public/Home/images/zhifu25.jpg" alt=""/>
                                </li>-->
                            </ol>
                        </div>

                    </div>
                </div>
                <div class="online_jg">
                    应付金额：
                    <span>¥ <?php echo ($order["total"]); ?></span>
                </div>
                <input type="hidden" name="total" value="<?php echo ($order["total"]); ?>">
                <input type="hidden" name="order_id" value="<?php echo ($order_id); ?>">
                <input type="hidden" name="type" value="<?php echo ($type); ?>">

                <div class="login_bot reg_bot div_text_center reg_btn_font2">
                <div class="cur login_bot_span_login login_bot_span_reg"> <a  href="javascript:void(0);" onClick="$('#cart4_form').submit();"  >确认支付方式</a></div>

                </div>
            </form>
        </div>
    </div>
</div>
<div class="c container_w login_foot_w">
    <div class="container footer div_text_center">
        Copyright@2013Enterprise information All Rights Reserved 京ICP备 01245785号
    </div>
</div>
</body>
</html>