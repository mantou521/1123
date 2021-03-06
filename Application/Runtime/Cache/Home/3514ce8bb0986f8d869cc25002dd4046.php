<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UU册报单详情</title>
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
    <!--可无视-->
    <!--<link href="/Public/Home/css/main.css" rel="stylesheet" type="text/css" />-->
    <!--必要样式-->
    <!--<link href="http://cdn.bootcss.com/bootstrap/3.3.6//Public/Home/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
    <link href="/Public/Home/css/city-picker.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Public/Home/css/style.css">
    <script src="/Public/Home/js/jquery-1.8.1.min.js"></script>
    <script src="/Public/Home/js/validation.js"></script>
    <script src="/Public/Home/js/my.js"></script>
    <script src="/Public/Home/js/login.js"></script>
    <script src="/Public/Home/js/laydate/laydate.js"></script>
    <style>
        .reg_con_input input.data_list {
            background: white;
        }


        .reg_con_input_all {
            padding-top: 10px;
        }
        .button-holder{margin-top: -55px;margin-left: 50px;}
        .yeji_input_radio{display: none;opacity: 0;}

        .regular-radio + label {
            -webkit-appearance: none;
            background-color: #fafafa;
            border: 1px solid #cacece;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
            padding:6px;
            border-radius: 50px;
            display: inline-block;
            position: relative;
        }

        .regular-radio:checked + label:after {
            content: ' ';
            width: 10px;
            height: 10px;
            border-radius: 50px;
            position: absolute;
            top: 1px;
            background: #99a1a7;
            box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3);
            text-shadow: 0px;
            left: 1px;
            font-size: 32px;
        }
    </style>
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
                <span>报单<a href="" class="yeji_span"> &gt; UU册报单</a><a href="uu_baodan_info.html" class="yeji_span"> &gt; 详情</a></span>
            </div>
            <div class="c yeji_con_tiaojian product_right_con buy_right_con">
                <div class="buy_right_con_top">
                    <div class="l buy_right_con_top_l">
                        <img src="/Public/Uploads/uuce/<?php echo ($good['thumb']); ?>" alt="" class="uu_big_img">
                        <div class="uu_imgs">
                            <div class="uu_img_left" style="background-image: url(/Public/Home/images/3_left.png)"></div>
                            <div class="uu_img_mid">
                                <ul class="uu_img_ul">
                                    <?php if(is_array($img)): foreach($img as $key=>$mg): ?><li>
                                        <a href="javaScript:;" class="uu_img">
                                            <img src="/Public/Uploads/<?php echo ($mg); ?>" alt=""/>
                                        </a>
                                    </li><?php endforeach; endif; ?>
                                </ul>
                            </div>
                            <div class="uu_img_right" style="background-image: url(/Public/Home/images/3_right.png)"></div>
                        </div>
                    </div>
                    <form name="form" action="<?php echo U('Home/Uuce/uu_order');?>" method="post">
                    <div class="l buy_right_con_top_r">
                        <p><?php echo ($good['goods_name']); echo ($good['goods_description']); ?></p>
                        <p class="buy_right_price">
                            <label>价　　格：</label>
                            <span><em>¥</em> <?php echo ($good['goods_price']); ?></span>
                        </p>
                        <p class="buy_right_price">
                            <label>数　　量：</label>
                            <span class="jiajian jian">-</span>
                            <input type="text" name="goods_num" value="1"/>
                            <span class="jiajian jia">+</span>
                        </p>
                        <div >
                            <input type="hidden" name="goods_id" value="<?php echo ($good["goods_id"]); ?>">
                            <input type="submit" value="立即报单" class="cur ruzhi_zhifu buy_zhifu" >
                        </div>
                    </div>
                    </form>
                </div>
                <div class="recommend">uu册详情</div>
                <div class="recommended">
                    <?php echo ($good["goods_content"]); ?>
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
<!-- up_bianhao-->

<!-- up_alert-->
<div style="display: none" class="dialog2 wechat-share-dialog">
    <div class="dialog-overlay"></div>
    <div class="dialog-content2 uu-content"  style="opacity: 1;">
        <div class="dia_header">
            <span>收件信息填写</span>
            <img src="/Public/Home/images/dia_close.png" alt="" class="dialog-close2"/>
        </div>
        <form class="dia_cont">
            <div class="uu_cont1">
                <div class="uu_ipt">
                    <span class="uu_span">收件人姓名：</span>
                    <input type="text" value=""/>
                </div>
                <div class="uu_ipt">
                    <span class="uu_span">联系方式：</span>
                    <input type="text" value=""/>
                </div>
                <div class="reg_con_input uu_ipt2 one">
                    <div>
                        <span class="dizhi">收货住址：</span>
                        <div class="form-group">
                            <div style="position: relative;">
                                <input id="city-picker3" class="form-control" readonly type="text" value="北京市/北京市/东城区" data-toggle="city-picker">
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <input tip="收货住址" type="text" name="phone" id="phone" placeholder="输入详细地址" class="data_list details_ipt a1" value="">
                </div>
            </div>
            <div class="dia_cont2 free_cont2">
                <span class="dia_span">应付金额：</span>
                <span class="dia_cont2_color">￥8800.00</span>
            </div>
            <div class="dia_cont3">
                <span>支付方式：</span>
                <!-- radio-->
                <em>在线支付</em>
            </div>
            <div class="up_zhifu">
                <a href="open_online.html">确认支付</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<!-- 城市选择-->
<script src="js_city/jquery.js"></script>
<script src="js_city/bootstrap.js"></script>
<script src="js_city/city-picker.data.js"></script>
<script src="js_city/city-picker.js"></script>
<script src="js_city/main.js"></script>

<script>
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
        laydate({elem: '#demo2'});//绑定元素
    }();
</script>
<script>
    $('.buy_right_price span.jia').click(function(){
        $val=$(this).parent().find('input').val();
        // alert($val);
        $val=parseInt($val);

        $val=$val+1;

        if(isNaN($val)){
            $val=1;
        }
        $(this).parent().find('input').val($val);
    })
    $('.buy_right_price span.jian').click(function(){
        $val=$(this).parent().find('input').val();
        $val=parseInt($val);

        // alert($val);
        $val=$val-1;
        if($val<=0){
            $val=0;
        }

        if(isNaN($val)){
            $val=1;
        }
        $(this).parent().find('input').val($val);
    })

</script>