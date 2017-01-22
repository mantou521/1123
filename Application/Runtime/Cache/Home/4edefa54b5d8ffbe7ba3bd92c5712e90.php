<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>旅游报单-报团</title>
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
    <script>
        var url = "/Public/Home";//定义js中的url路径
    </script>
    <script src="/Public/Home/js/my.js"></script>
    <script src="/Public/Home/js/laydate/laydate.js"></script>
    <style>
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
                <span>报单<a href="" class="yeji_span"> &gt; 旅游报单</a><a href="lvyou_baodan_info.html" class="yeji_span"> &gt; 详情</a><a href="lvyou_baodan_info2.html" class="yeji_span"> &gt; 报团</a></span>
            </div>
            <form method="post" action="<?php echo U('Travel/apply_post');?>" class="product_right_con baodan_con" enctype="multipart/form-data">

                <h3 class="ruzhi_con_h3">&nbsp</h3>
                <div class="main_right_con1">
                    <h4>报团信息填写</h4>
                    <div class="bt">
                        <p>
                            <span class="bt_span1">路线名称：</span>
                            <span class="bt_span2"><?php echo ($list["tr_name"]); ?></span>
                        </p>
                        <p>
                            <span class="bt_span1">选择日期：</span>
                            <input class="cur laydate-icon" name="date" id="demo1" value="" placeholder="请选择出发日期">
                        </p>
                        <p>
                            <span class="bt_span1">选择交通方式：</span>
                        </p>
                        <ul class="bt_ul">
                            <li>
                                <input type="radio" value="1" name="type"/>
                                <span><i></i></span>
                                火车<em>（默认）</em>
                            </li>
                            <li>
                                <input type="radio" value="2" name="type"/>
                                <span><i></i></span>
                                飞机<em>（需补齐差价）</em>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="main_right_con1">
                    <h4>出团人信息填写</h4>
                    <div class="bts">
                        <div class="bt_box">
                            <img class="bt_remove" src="/Public/Home/images/bt_remove.png" alt=""/>
                            <p>
                                <span class="bt_span_l">UU册编号</span>
                                <input type="text" name="uu[]" placeholder="D0563" class="bt_span_r"/>
                            </p>
                            <p>
                                <span class="bt_span_l">姓名</span>
                                <input type="text" name="name[]" placeholder="张卅" class="bt_span_r"/>
                            </p>
                            <p>
                                <span class="bt_span_l">性别</span>
                                <select name="sex[]" class="bt_select">
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                 </select>
                            </p>
                            <p>
                                <span class="bt_span_l">电话（选填）</span>
                                <input type="text" name="mobile[]" placeholder="15933985798" class="bt_span_r"/>
                            </p>
                            <p>
                                <span class="bt_span_l">身份证号</span>
                                <input type="text" name="usercard[]"  placeholder="320398199903123989" class="bt_span_r"/>
                            </p>
                            <p>
                                <span class="bt_span_l">身份证复印件</span>
                                <input type="text" value="" class="bt_span_r"/>
                                <span class="file_upload">
										<input name="pic[]" type="file"/>
										<a href="javaScript:;">点击上传</a>
									</span>
                            </p>
                            <p>
                                <input type="radio" value="" class="child" checked/>携带儿童
                                <input type="number" name="c_num[]" value="1" class="bt_number" min="0" placeholder="0"/>
                                <span class="biaozhun">
										<a href="javaScript:;">儿童标准</a>
										<span class="bz">
											<span class="bz_div">儿童标准</span>
											<span class="bz_p">身高0.8~1.2米（含），不占床，仅含当地旅游车位，半价套餐，导服，其他不含，儿童1.2~1.5米的，请自行选择儿童票高铁票升级方案。</span>
										</span>
									</span>
                            </p>
                        </div>
                    </div>
                    <div class="bt_add">+添加出团人</div>
                    <div class="bt_zong">
                        <span class="btz1">4</span>人团
                        <span>，</span>
                        含儿童<span class="btz2">2</span>名
                        <?php $ac=I('tr_id'); ?>
                        <input type="hidden" name="tr_id" value="<?php echo ($ac); ?>">
                        <a href="" id="wechat-share"><input type="submit"  value="提交信息" ></a>
                    </div>
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
<script type="text/javascript" src="/Public/Admin/js/layui/layui.js"></script>
<script type="text/javascript" src="/Public/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>
<script>
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
    }();
</script>