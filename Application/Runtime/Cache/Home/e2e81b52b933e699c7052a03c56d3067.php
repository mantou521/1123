<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
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
    <script src="/Public/Home/js/laydate/laydate.js"></script>
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
                    <li <?php if(($us_menu["pay_type"] == 1 || $us_menu["pay_img"] != 0)): ?>style="display: none"<?php endif; ?> ><a href="<?php echo U('Home/Store/open_offline');?>">开店报单</a></li>
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
                <span>个人信息</span>
            </div>
            <div class="main_right_con">
                <div class="c">
                    <div class="yeji_con_res info_con_res">
                        <div class="personal">
                            <div class="info_box">
                                <div class="personal_l">
                                    <div class="per_l">
                                        <div class="per_ll">人员编号：</div>
                                        <div class="per_lr"><?php echo ($user["nickname"]); echo ($user["postcode"]); echo ($user["e_ulevel"]); ?></div>
                                    </div>
                                    <div class="per_l">
                                        <div class="per_ll">一寸照片：</div>
                                        <div class="per_lr">
                                            <img src="/Public/Home/images/upload/<?php echo ($user["img1"]); ?>" width="120" alt=""/>
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
                                    <div class="per_l">
                                        <div class="per_ll">银行名称：</div>
                                        <div class="per_lr"><?php echo ($user["bankname"]); ?></div>
                                    </div>
                                    <div class="per_l">
                                        <div class="per_ll">合同编号：</div>
                                        <div class="per_lr"><?php echo ($user["constract_no"]); ?></div>
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
                                        <?php if(($uppor != 0)): if(is_array($uppor)): foreach($uppor as $k=>$vo): if($vo["status"] == 1): ?><div class="r_cont_p">
                                                        <div class="r_cont_img">
                                                            <img src="/Public/Home/images/last.png" alt=""/>
                                                        </div>
                                                        <div class="r_cont_cont">
                                                            <span><?php echo ($vo["datetime"]); ?></span>
                                                            <span class="r_span">晋升为<?php echo ($vo["lvname"]); ?></span>
                                                        </div>
                                                    </div><?php endif; ?>
                                                <div class="r_cont_p">
                                                    <div class="r_cont_img">
                                                        <img src="/Public/Home/images/last.png" alt=""/>
                                                    </div>
                                                    <div class="r_cont_cont">
                                                        <span><?php echo ($vo["wait_time"]); ?></span>
                                                        <span class="r_span">符合成为<?php echo ($vo["lvname"]); ?>的标准</span>
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
                            <?php if($store_num > 0): ?><div class="main_right_con1 info_bg_left">
                                <h4>说明</h4>
                            </div>

                            <div class="info_box">
                                <div class="personal_l">
                                    <div class="per_l">
                                        <div class="per_ll">店铺地址：</div>
                                        <div class="per_lr"><?php echo ($store["address"]); ?></div>
                                    </div>
                                    <div class="per_l">
                                        <div class="per_ll">开店级别：</div>
                                        <div class="per_lr"><?php echo ($store["sname"]); ?></div>
                                    </div>
                                    <div class="per_l">
                                        <div class="per_ll">铺货类型：</div>
                                        <div class="per_lr"><?php echo ($store["type_name"]); ?></div>
                                    </div>
                                    <div class="per_l">
                                        <div class="per_ll">营业执照：</div>
                                        <div class="per_lr">
                                            <img style="height: 200px;width: 250px" src="/Public/Home/images/upload/store/<?php echo ($store["img"]); ?>" alt=""/>
                                        </div>
                                    </div>
                                    <div class="per_l">
                                        <div class="per_ll">开户银行：</div>
                                        <div class="per_lr"><?php echo ($user["bankname"]); ?></div>
                                    </div>
                                    <div class="per_l">
                                        <div class="per_ll">银行卡号：</div>
                                        <div class="per_lr"><?php echo ($user["bankcard"]); ?></div>
                                    </div>
                                </div>
                                <div class="personal_r">
                                    <div class="r_top">晋升过程：</div>
                                    <div class="r_cont">
                                        <div class="r_cont_p">
                                            <div class="r_cont_img">
                                                <img src="/Public/Home/images/now.png" alt=""/>
                                            </div>
                                            <div class="r_cont_cont">
                                                <span><?php echo ($store["t"]); ?></span>
                                                <span class="r_span">升级店铺<i><?php echo ($store["sname"]); ?></i></span>
                                            </div>
                                        </div>
                                        <?php if(is_array($record)): foreach($record as $key=>$re): ?><div class="r_cont_p">
                                            <div class="r_cont_img">
                                                <img src="/Public/Home/images/now.png" alt=""/>
                                            </div>
                                            <div class="r_cont_cont">
                                                <span><?php echo ($re["t"]); ?></span>
                                                <span class="r_span">升级店铺<i><?php echo ($re["sname"]); ?></i></span>
                                            </div>
                                        </div><?php endforeach; endif; ?>


                                    </div>
                                </div>
                            </div><?php endif; ?>
                            <div class="person_xiugai">
                                <a href="<?php echo U('Home/Member/per_edit');?>">信息修改</a>
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

<div class="bg"></div>
<div class="bg_img">
    <img src="/Public/Home/images/upload/<?php echo ($user["img2"]); ?>" alt="" class="bg_img2"/>
    <img src="/Public/Home/images/upload/<?php echo ($user["img4"]); ?>" alt="" class="bg_img2"/>
    <img src="/Public/Home/images/upload/<?php echo ($user["img3"]); ?>" alt="" class="bg_img2"/>
    <img src="/Public/Home/images/list_a.png" alt="" class="bg_img_close"/>
</div>

</body>
</html>
<script>

    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
        laydate({elem: '#demo2'});//绑定元素
    }();

    //
    var r_h=$('.r_cont_p').height();
    var r_n=$('.r_cont:eq(0) .r_cont_p').length;
    $('.r_cont:eq(0)').height(r_h*(r_n-1)+21+'px').css('overflow','hidden');
    var r_n_1=$('.r_cont:eq(1) .r_cont_p').length;
    $('.r_cont:eq(1)').height(r_h*(r_n_1-1)+21+'px').css('overflow','hidden');
//    console.log(r_n);
//    console.log(r_n_1);
//    console.log(r_h*(r_n_1-1)+21);
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
        $('.bg_img .bg_img_close').hide();
    });
</script>