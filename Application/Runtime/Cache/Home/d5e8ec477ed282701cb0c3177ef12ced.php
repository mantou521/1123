<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>开店报单</title>
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
                <li><a href="<?php echo U('Home/Performc/uu_pc');?>">UU册业绩</a></li>
                <li><a href="<?php echo U('Home/Performc/travel_pc');?>">旅游业绩</a></li>
                <li><a href="<?php echo U('Home/Performc/recommend_pc');?>">入职推荐业绩</a></li>
            </ol>
        </li>
        <li class="cur main_left_li3">
            <span><a href="<?php echo U('Home/Uuce/uu_kucun');?>">我的库存</a></span>
        </li>
        <li onOff='0' class="cur main_left_li_dif main_left_li4">
            <span>报单</span>
                <li><a href="<?php echo U('Home/Uuce/uu_re');?>">UU册报单</a></li>
                <li><a href="<?php echo U('Home/Travel/travel_list');?>">旅游报单</a></li>
                <li><a href="<?php echo U('Home/Member/conm_re');?>">入职推荐报单</a></li>
                    <?php if(($us_menu["pay_type"] == 2 && $us_menu["pay_img"] == 0)): ?><li><a href="<?php echo U('Home/Store/open_offline');?>">开店报单</a></li>
                        <?php elseif($us_menu["pay_status"] != 1): ?>
                        <li><a href="<?php echo U('Home/Member/store');?>">开店报单</a></li><?php endif; ?>
                <?php if(($us_menu["pay_status"] == 1)): ?><li><a href="<?php echo U('Home/Store/store_info');?>">店铺信息</a></li><?php endif; ?>
            </ol>
        </li>
        <li class="cur main_left_li5"  style="background: url(/Public/Home/images/edit.jpg) no-repeat 15px center;">
            <span><a href="<?php echo U('Home/Member/userset');?>">密码修改</a></span>
        </li>
        <li class="cur main_left_li5"  style="background: url(/Public/Home/images/personal_cur.png) no-repeat 15px center;">
            <span><a href="<?php echo U('Home/Member/per_info');?>"  style="color:#006445;">个人信息</a></span>
        </li>

    </ul>
</div>

        <div class="r main_right">
            <div class="main_right_title main_right_title_blue">
                <em></em>
                <span>报单<a href="sys.html" class="yeji_span"> &gt; 开店报单</a></span>
            </div>
            <div class="main_right_con">
                <div class="reg_con_input_all">
                    <div class="main_right_con1">
                        <h4>店铺信息</h4>

                        <div class="reg_con_span edit_con_input reg_mar_l">
                            <span>店铺地址：</span>
                            <span><?php echo ($user["address"]); ?></span>
                        </div>
                        <div class="reg_con_span edit_con_input reg_mar_l">
                            <span>开店级别：</span>
                            <span><?php echo ($user["sname"]); ?></span>
                        </div>
                        <div class="reg_con_span edit_con_input reg_mar_l">
                            <span>货铺类型：</span>
                            <span>100%铺货</span>
                        </div>
                        <div class="reg_con_span edit_con_input reg_mar_l">
                            <span>营业执照：</span>
                            <img src="/Public/Home/images/upload/store/<?php echo ($user["img"]); ?>" alt=""/>
                        </div>
                        <div class="reg_con_span edit_con_input reg_mar_l">
                            <span>加盟费用：</span>
                            <span class="jiage_size">￥<em><?php echo ($user["free"]); ?></em></span>
                        </div>
                    </div>
                </div>
                <?php if($user["slevel"] > 1): ?><div class="login_bot reg_bot reg_btn_font">
                        <div class="cur login_bot_span_login" id="wechat-share">升级店铺</div>
                    </div><?php endif; ?>
            </div>
        </div>
    </div>
</div>
<div class="c container_w login_foot_w">
    <div class="container footer div_text_center">
        Copyright@2013Enterprise information All Rights Reserved 京ICP备 01245785号
    </div>
</div>
<!-- up_alert-->
<div class="dialog wechat-share-dialog">
    <div class="dialog-overlay"></div>
    <div class="dialog-content"  style="opacity: 1;">
        <div class="dia_header">
            <span>店铺升级</span>
            <img src="/Public/Home/images/dia_close.png" alt="" class="dialog-close"/>
        </div>
        <form class="dia_cont">
            <div class="dia_cont1">
                <input type="hidden" id="userid" value="<?php echo ($_SESSION["id"]); ?>" >
                <span class="dia_span">选择提升的级别：</span>
                <?php $mon=$level[0]['free']-$user['free']?>
                <select class="sel">
                    <?php if(is_array($level)): foreach($level as $key=>$vo): $le=$user['slevel']; $cha=$vo['free']-$user['free'];?>
                        <?php if(($vo["slevel"] < $le)): ?><option value="<?php echo ($vo["slevel"]); ?>" jp="<?php echo ($cha); ?>" checked="checked"><?php echo ($vo["sname"]); ?></option><?php endif; endforeach; endif; ?>
                </select>
            </div>
            <div class="dia_cont2">
                <span class="dia_span">应付金额：￥</span>

                <span class="dia_cont2_color" ><?php echo ($mon); ?></span>
            </div>
            <div class="dia_cont3">
                <span>支付方式：</span>
                <!-- radio-->
                <ul class="dia_radio">
                    <li>
                        <input type="radio" name="zhifu" value="1"/>
                        <span><i></i></span>
                        在线支付
                    </li>
                    <li>
                        <input type="radio" name="zhifu" value="2"/>
                        <span><i></i></span>
                        线下支付
                    </li>
                </ul>
            </div>
            <div class="up_zhifu">
                <a href="javaScript:;">确认升级</a>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    /*select*/
    $('.sel').change(function(){
        $('.dia_cont2_color').html($(".sel option:selected").attr('jp'));
        //console.log($(this).val());
    });
    $('.up_zhifu').click(function(){

        var free= $('.dia_cont2_color ').text();
        var uplevel= $('.sel ').val();
        var type= $('.dia_radio li input[name="zhifu"]:checked').val();
        var userid= $('#userid').val();
        $.ajax({
            url:"/index.php/Home/Store/store_up",
            type:'post',
            data:{'free':free,uplevel:uplevel,type:type,userid:userid},
            dataType:'json',
            success:function(data){
                if(data=='false'){
                    alert('您已经申请,请等待审核')
                }else{
                    if($('.dia_radio li:eq(0)').hasClass('zhifu_cur')){
                        window.location.href="index.php?m=Home&c=Order&a=order_pay&order_sn="+data+"&type=5";
                    }else{
                        window.location.href='<?php echo U('Store/open_offline',array('type'=>'update'));?>';
                    }

                }
            }
        })

    })


    //确认升级
    //    $('.up_zhifu a').click(function(){
    //        if($('.dia_radio li:eq(0)').hasClass('zhifu_cur')){
    //            window.location.href='open_online.html';
    //        }else{
    //            window.location.href='open_offline.html';
    //        }
    //    });
</script>
</body>
</html>