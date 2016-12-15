<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
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
    <script>
        var GV = {
            ROOT: "/",
            WEB_ROOT: "__WEB_ROOT__/",
            JS_ROOT: "public/js/",
            APP:'<?php echo (MODULE_NAME); ?>'/*当前应用名*/
        };
    </script>
</head>
<body>
<div class="container_w head_w">
    <div class="container head">
        <div class="l head_left">
            <a href="<?php echo U('Home/Index/index');?>"><img src="/Public/Home/images/uu_logo.png" alt=""></a>
        </div>
        <div class="r head_right">
            <span class="head_right_back"><em></em> <a href="<?php echo U('Home/Index/index');?>">返回首页</a></span>
            <span class="head_right_back head_right_out"><em></em> <a href="<?php echo U('Home/Index/login');?>">退出系统</a></span>
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
                <span>首页</span>
            </div>
            <div class="yeji_con_res info_con_res">
                <?php if($tra["reback"] == 1): ?><div class="feedback_zhifu">
                    <a href="<?php echo U('Travel/travel_feedback',array('order_sn'=>$tra['order_sn']));?>">您的旅游报单收到反馈信息，您可以去付款了...</a>
                </div><?php endif; ?>
                <div class="main_right_con1 main_right_con22">
                    <h4>个人信息</h4>
                </div>
                <div class="personal" style="padding-top: 0;">
                    <div class="personal_l">
                        <div class="per_l">
                            <div class="per_ll">人员编号：</div>
                            <div class="per_lr"><?php echo ($user["nickname"]); echo ($user["postcode"]); echo ($user["e_ulevel"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">一寸照片：</div>
                            <div class="per_lr">
                                <img src="/Public/Home/images/upload/<?php echo ($user["img1"]); ?>" alt=""/>
                            </div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">姓名：</div>
                            <div class="per_lr"><?php echo ($user["username"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">性别：</div>
                            <div class="per_lr"><?php if(($user["sex"] == 1)): ?>男<?php else: ?>女<?php endif; ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">出生日期：</div>
                            <div class="per_lr"><?php echo ($user["birthday"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">身份证号：</div>
                            <div class="per_lr"><?php echo ($user["usercard"]); ?></div>
                            <a href="javaScript:;" class="per_lr2 per_a1">查看正面</a>
                            <a href="javaScript:;" class="per_lr2 per_a2">查看反面</a>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">银行卡号：</div>
                            <div class="per_lr"><?php echo ($user["bankcard"]); ?></div>
                            <a href="javaScript:;" class="per_lr2 per_a3">查看附件</a>
                        </div>
                        <div class="per_l per_l2">
                            <div class="per_ll">教育程度：</div>
                            <div class="per_lr"><?php echo ($user["xueli"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">联系电话：</div>
                            <div class="per_lr"><?php echo ($user["usertel"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">居住地址：</div>
                            <div class="per_lr"><?php echo ($user["useraddress"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">邮编：</div>
                            <div class="per_lr"><?php echo ($user["postcode"]); ?></div>
                        </div>
                        <div class="per_l per_l3">
                            <div class="per_ll">入职时间：</div>
                            <div class="per_lr"><?php echo date("Y-m-d",$user['rdt']); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">工号：</div>
                            <div class="per_lr"><?php echo ($user["nickname"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">部门代码：</div>
                            <div class="per_lr"><?php echo ($user["departnum"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">职级：</div>
                            <div class="per_lr"><?php echo ($user["lvname"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">推荐人：</div>
                            <div class="per_lr"><?php echo ($user["rname"]); ?></div>
                        </div>
                        <div class="per_l">
                            <div class="per_ll">推荐人工号：</div>
                            <div class="per_lr"><?php echo ($parent["nickname"]); ?></div>
                        </div>
                    </div>
                    <div class="personal_r">
                        <div class="r_top">晋升过程：</div>
                        <div class="r_cont">
                            <?php if(($uppor != 0)): if(is_array($uppor)): foreach($uppor as $k=>$vo): ?><div class="r_cont_p">
                                        <div class="r_cont_img">
                                            <img src="/Public/Home/images/last.png" alt=""/>
                                        </div>
                                        <div class="r_cont_cont">
                                            <span><?php echo ($vo["datetime"]); ?></span>
                                            <span class="r_span">晋升为<?php echo ($vo["lvname"]); ?></span>
                                        </div>
                                    </div><?php endforeach; endif; endif; ?>
                            <div class="r_cont_p">
                                <div class="r_cont_img">
                                    <img src="/Public/Home/images/last.png" alt=""/>
                                </div>
                                <div class="r_cont_cont">
                                    <span><?php echo ($regtime); ?></span>
                                    <span class="r_span">加入组织，成为代理</span>
                                </div>
                            </div>
                        </div>
                    </div>
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
<div class="bg"></div>
<div class="bg_img">
    <img src="/Public/Home/images/upload/<?php echo ($user["img2"]); ?>" alt="" class="bg_img2"/>
    <img src="/Public/Home/images/upload/<?php echo ($user["img4"]); ?>" alt="" class="bg_img2"/>
    <img src="/Public/Home/images/upload/<?php echo ($user["img3"]); ?>" alt="" class="bg_img2"/>
    <img src="/Public/Home/images/list_a.png" alt="" class="bg_img_close"/>
</div>
<script>
    //去除下线
//    var r_h=$('.r_cont_p').height();
//    console.log(r_h);
    var r_n=$('.r_cont .r_cont_p').length;
    $('.r_cont').height(88*(r_n-1)+21+'px').css('overflow','hidden');


    $('.bg').height($('body,html').height());
    var bg_img=($('body,html').width()-$('.bg_img .bg_img2').width())/2;
    $('.bg_img .bg_img2').css('left',bg_img+'px');
    $('.bg_img .bg_img_close').css('right',(bg_img-10)+'px');
    $('.per_a1').click(function(){
        $('.bg').show();
        $('.bg_img .bg_img2').eq(0).show();
        $('.bg_img .bg_img_close').show();
    });
    $('.per_a2').click(function(){
        $('.bg').show();
        $('.bg_img .bg_img2').eq(1).show();
        $('.bg_img .bg_img_close').show();
    });
    $('.per_a3').click(function(){
        $('.bg').show();
        $('.bg_img .bg_img2').eq(2).show();
        $('.bg_img .bg_img_close').show();
    });
    $('.bg_img .bg_img_close').click(function(){
        $('.bg').hide();
        $('.bg_img .bg_img2').eq(0).hide();
        $('.bg_img .bg_img2').eq(1).hide();
        $('.bg_img .bg_img2').eq(2).hide();
        $('.bg_img .bg_img_close').hide();
    });
</script>
</body>
</html>