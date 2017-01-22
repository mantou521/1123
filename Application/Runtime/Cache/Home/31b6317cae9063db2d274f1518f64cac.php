<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的库存-详情</title>
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
                <span>我的库存</span>
            </div>
            <div class="main_right_con kucun_con">
                <div class="kucun_head">
                    <span>我的库存</span>
                    <a href="index.php?m=Home&c=Uuce&a=uu_record">转让记录</a>
                </div>
                <div class="kucun_detail">
                    <div class="kc_d_l buy_right_con_top_l">
                        <img src="/Public/Uploads/uuce/<?php echo ($uuce["thumb"]); ?>" alt="" class="uu_big_img"/>
                    </div>
                    <div class="kc_d_r buy_right_con_top_r">
                        <h2><?php echo ($uuce["goods_name"]); ?></h2>
                        <div class="kc_r_jg">
                            价 格：
                            <span><i>¥</i> <?php echo ($uuce["goods_price"]); ?></span>
                            <em>库存：（<?php echo ($uuce["num"]); ?>）</em>
                        </div>
                        <?php if($uuce["num"] > 0): ?><p>编号：<span><?php echo ($uuce["goods_sn"]); ?></span><span></span></p>
                            <div class="kc_r_out" id="wechat-share">转出</div><?php endif; ?>
                    </div>
                </div>
                <div class="recommend">其它推荐</div>
                <div class="kucun_box">
                    <?php if(is_array($goods)): foreach($goods as $key=>$item): ?><div class="kucun_con_hx">
                        <div class="l kucun_con_l">
                            <a href="<?php echo U('Home/Uuce/kucun_info',array('goods_id'=>$item['goods_id']));?>"><img src="/Public/Uploads/uuce/<?php echo ($item["thumb"]); ?>" alt=""></a>
                            <span class="kucun_span1"><?php echo ($item["goods_name"]); ?></span>
                        </div>
                        <div class="r kucun_con_r">
                            <span  class="kucun_span2">库存：<em><?php echo ($item["num"]); ?></em></span>
                        </div>
                    </div><?php endforeach; endif; ?>

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
<!-- up_alert-->

<div class="dialog wechat-share-dialog">
    <div class="dialog-overlay"></div>
    <div class="dialog-content kucun-content"  style="opacity: 1;">
        <div class="dia_header">
            <span>转出类型</span>
            <img src="/Public/Home/images/dia_close.png" alt="" class="dialog-close"/>
        </div>
        <form class="dia_cont" action="<?php echo U('Uuce/uu_sell');?>" method="post">
            <div class="dia_cont1 kc_cont">
                <ul class="kc_radio">
                    <li>
                        <input type="radio" name="type" value="1"/>
                        <span><i></i></span>
                        内部转让
                    </li>
                    <li>
                        <input type="radio" name="type" value="2"/>
                        <span><i></i></span>
                        外部销售
                    </li>
                </ul>
            </div>
            <input type="hidden" name="goods_id" value="<?php echo ($uuce["goods_id"]); ?>">
            <input type="hidden" name="goods_sn" value="<?php echo ($uuce["usable_uuce"]); ?>">
            <div class="kc_type">
                <input  type="submit" value="确认">
            </div>
        </form>
    </div>
</div>
</body>
</html>