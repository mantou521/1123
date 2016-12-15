<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>内部转让</title>
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
                <span>我的库存<a href="kucun_info.html" class="yeji_span"> &gt; 详情</a><a href="type_inner.html" class="yeji_span"> &gt; 内部转让</a></span>
            </div>
            <div class="main_right_con">
                <div class="main_right_con ruzhi_right_con uu_tijiao">
                    <h3 class="ruzhi_con_h3">&nbsp</h3>
                    <div class="main_right_con1">
                        <h4>内部转让信息填写</h4>
                        <form action="<?php echo U('Uuce/sell_post');?>" method="post" class="type_inner">
                            <div class="uu_ipt">
                                <span class="uu_span">收件人姓名：</span>
                                <input name="consignee" type="text" value="">
                            </div>
                            <div class="uu_ipt">
                                <span class="uu_span">人员编号：</span>
                                <input name="user_num" type="text" value="">
                            </div>
                            <div class="uu_ipt">
                                <span class="uu_span">联系电话：</span>
                                <input name="mobile" type="text" value="">
                            </div>
                            <div class="uu_ipt">
                                <span class="uu_span">数      量：</span>
                                <input name="goods_num" type="text" value="">
                            </div>
                            <div class="uu_ipt">
                                <span class="uu_span">UU册名称：</span>
                                <span class="uu_span_cont"><?php echo ($goods["goods_name"]); ?></span>
                            </div>
                            <div class="uu_ipt">
                                <span class="uu_span">选择编码：</span>
                                <span class="inner_span">
										<a href="javaScript:;" class="uu_choose"  id="wechat-share">选择编号</a>
										<textarea name="goods_sn" class="inner_tex"></textarea>
									</span>
                            </div>
                            <input type="hidden" name="goods_id" value="<?php echo ($goods["goods_id"]); ?>">
                            <input type="hidden" name="type" value="1">
                            <div class="cur zhifu_mar">
                                <input class="ruzhi_zhifu" type="submit" value="提交信息">
                            </div>
                        </form>
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
<!-- up_bianhao-->
<div class="dialog wechat-share-dialog">
    <div class="dialog-overlay"></div>
    <div class="dialog-content alert_radios"  style="opacity: 1;">
        <div class="dia_header">
            <span>选择编码</span>
            <img src="/Public/Home/images/dia_close.png" alt="" class="dialog-close"/>
        </div>
        <form class="dia_cont tishi_cont">
            <div class="alert_rad">
                <ul class="bm_radio">
                    <?php if(is_array($goods_sn)): foreach($goods_sn as $key=>$vo): ?><li>
                        <input type="checkbox" name=""/>
                        <span><i></i></span>
                        <em><?php echo ($vo); ?></em>
                    </li><?php endforeach; endif; ?>
                </ul>
            </div>
            <div class="alert_bm">确认</div>
        </form>
    </div>
</div>
</body>
</html>