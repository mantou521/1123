<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UU册订单</title>
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
                <span>报单<a href="" class="yeji_span"> &gt; UU册报单</a></span>
            </div>
            <div class="product_right_con baodan_con">
                <div class="kucun_head">
                    <a href="<?php echo U('Home/Uuce/uu_re');?>">UU册报单</a>
                    <span>UU册订单</span>
                </div>
                <div class="result record">
                    <table class="result_tab record_tab" cellpadding="0" cellspacing="0">
                        <tr>
                            <th>UU册名称</th>
                            <th>UU报单日期</th>
                            <th>UU册编号</th>
                            <th>数量（册）</th>
                            <th>总价</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <?php if(is_array($list)): foreach($list as $key=>$vo): ?><tr>
                                <td>
                                    <a href=""><?php echo ($vo["goods_name"]); ?></a>
                                </td>
                                <td>
                                    <span><?php echo ($vo["add_time"]); ?></span>
                                </td>
                                <td>
                                    <span><?php echo ($vo["goods_sn"]); ?></span>
                                </td>
                                <td>
                                    <span><?php echo ($vo["goods_num"]); ?> </span>
                                </td>
                                <td>
                                    <span><?php echo ($vo["total"]); ?> </span>
                                </td>
                                <td>
                                    <span><?php if(($vo["pay_status"] == 1)): ?>已支付<?php else: ?>未付款<?php endif; ?></span>
                                </td>
                                <td>
                                    <?php if(($vo["pay_status"] == 0)): ?><a href="<?php echo U('Order/order_pay',array('order_sn'=>$vo['order_sn'],'total'=>$vo['total'],'type'=>4));?>" target="_blank" class="result_a">付款</a><?php else: ?>已付款<?php endif; ?>
                                    <em>|</em>
                                    <a href="" class="result_a">删除</a>
                                </td>
                            </tr><?php endforeach; endif; ?>
                    </table>
                </div>
                <div class="div_text_center yeji_page">
                    <?php echo ($page); ?>
                    <div class="ye_together">每页10条，共<em><?php echo ($yetotal); ?></em>页</div>
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