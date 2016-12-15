<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>旅游报单</title>
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
    <link rel="stylesheet" href="/uufenxiao/Public/Home/css/style.css">
    <script src="/uufenxiao/Public/Home/js/jquery-1.8.1.min.js"></script>
    <script src="/uufenxiao/Public/Home/js/my.js"></script>
</head>
<body>
<div class="container_w head_w">
    <div class="container head">
        <div class="l head_left">
            <a href="<?php echo U('Home/Index/index');?>"><img src="/uufenxiao/Public/Home/images/uu_logo.png" alt=""></a>
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
            <if>
                <li><a href="<?php echo U('Home/Uuce/uu_re');?>">UU册报单</a></li>
                <li><a href="<?php echo U('Home/Travel/travel_list');?>">旅游报单</a></li>
                <li><a href="<?php echo U('Home/Member/conm_re');?>">入职推荐报单</a></li>
                <?php if(($us_menu["pay_status"] == 0)): ?><li><a href="<?php echo U('Home/Member/store');?>">开店报单</a></li>
                <?php else: ?>
                <li><a href="<?php echo U('Home/Store/store_info');?>">店铺信息</a></li><?php endif; ?>
            </ol>
        </li>
        <li class="cur main_left_li5"  style="background: url(/uufenxiao/Public/Home/images/edit.jpg) no-repeat 15px center;">
            <span><a href="<?php echo U('Home/Member/userset');?>">密码修改</a></span>
        </li>
        <li class="cur main_left_li5"  style="background: url(/uufenxiao/Public/Home/images/personal_cur.png) no-repeat 15px center;">
            <span><a href="<?php echo U('Home/Member/per_info');?>"  style="color:#006445;">个人信息</a></span>
        </li>

    </ul>
</div>


        <div class="r main_right">
            <div class="main_right_title main_right_title_blue">
                <em></em>
                <span>报单<a href="uu_baodan.html" class="yeji_span"> &gt; 旅游报单</a></span>
            </div>
            <div class="product_right_con baodan_con">
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="uu_baodan_info.html"><img src="/uufenxiao/Public/Home/images/1.jpg" alt=""></a></dt>
                    <dd>
                        <a href="uu_baodan_info.html"><上海迪士尼DISNEY-华东五市双飞6日游><br>禅意拈花湾，国际五星...</a>
                        <em class='r'>¥2929.00</em>
                    </dd>
                </dl>
                <!-- <div class="div_text_center yeji_page product_page">
                    <span><</span>
                    <span class='yeji_page_span'>1</span>
                    <span>2</span>
                    <span>3</span>
                    <span>4</span>
                    <span>5</span>
                    <span>6</span>
                    <span>7</span>
                    <span>...</span>
                    <span>54</span>
                    <span>></span>
                    <span>共54页</span>
                </div> -->
            </div>
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