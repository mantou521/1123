<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人力架构</title>
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

        /*.regular-radio:checked + label {
            background-color: #e9ecee;
            color: #99a1a7;
            border: 1px solid #adb8c0;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1), inset 0px 0px 10px rgba(0,0,0,0.1);
        }*/

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
                <li><a href="<?php echo U('Home/Bonus/storeBonus');?>">店铺租金支持</a></li>
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
                <span>人力<a href="sys.html" class="yeji_span"> &gt; 人力架构</a></span>
            </div>
            <div class="c yeji_con_tiaojian yeji_con_tiaojian_query">

                <span class="yeji_con_span_line"></span>
                <span class="yeji_con_span_search">查询条件</span>
                <span class="yeji_con_span_line"></span>

                <div class="yeji_con_search sys_con_search">
                    <form  method="post" action="/index.php/Home/Member/human_serch">

                        <div class="l yeji_con_search_l">
                            <div class="yeji_con_search_time">
                                <span>类型：</span>
                                <!-- <span class="yeji_con_lx_span"><input class='yeji_input_radio' type="radio" name="team" id="">团队</span>
                                <span><input class='yeji_input_radio' checked type="radio" name="team" id="">个人</span> -->
                                <div class="button-holder">
                                    <input type="radio" value="0" id="radio-1-1" name="radio" class="regular-radio yeji_input_radio" checked="checked" /><label for="radio-1-1"></label>&nbsp 团队
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" id="radio-1-2" name="radio" value="1" class="regular-radio yeji_input_radio" /><label for="radio-1-2"></label>&nbsp 个人
                                </div>
                            </div>
                        </div>
                        <div class="yeji2_form">
                            <div>
                                <label for="">姓名：</label>
                                <input type="text" name="username"/>
                            </div>
                            <div>
                                <label for="">人员代码：</label>
                                <input type="text" name="nickname"/>
                            </div>
                            <div >
                                <input class="r cur yeji_con_search_r" name="submit" type="submit" value="查询">
                            </div>
                        </div>
                    </form>

                </div>

            </div>
            <div class="c yeji_con_tiaojian">
                <span class="yeji_con_span_line"></span>
                <span class="yeji_con_span_search">查询结果</span>
                <span class="yeji_con_span_line"></span>
                <div class="yeji_con_res">

                    <table border="1" class="yeji_table">

                        <tr>
                            <th>序号</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>职级</th>
                            <th>编码</th>
                            <th>合同编号</th>
                            <th>部门</th>
                            <th>推荐人</th>
                            <th>推荐人代码</th>
                            <th>联系电话</th>
                        </tr>
                        <?php $i=1; ?>
                        <?php if(is_array($mem)): foreach($mem as $k=>$vo): ?><tr>
                                <td><?php echo ($i++); ?></td>
                                <td><?php echo ($vo["nickname"]); ?></td>
                                <td><?php echo ($vo["username"]); ?></td>
                                <td><?php echo ($vo["lvname"]); ?></td>
                                <td><?php echo ($vo["nickname"]); echo ($vo["postcode"]); echo ($vo["e_ulevel"]); ?></td>
                                <td><?php echo ($vo["contract_no"]); ?></td>
                                <td><?php echo ($vo["departnum"]); ?></td>
                                <td><?php echo ($vo["rname"]); ?></td>
                                <td><?php $par=getMemberbyID($vo['reid']); echo $par['nickname']; ?></td>
                                <td><?php echo ($vo["usertel"]); ?></td>
                            </tr><?php endforeach; endif; ?>
                    </table>

                    <div class="div_text_center yeji_page">
                        <?php echo ($page); ?>
                        <div class="ye_together">每页10条，共<em><?php echo ($yetotal); ?></em>条</div>
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

</body>
</html>
<script>


    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
        laydate({elem: '#demo2'});//绑定元素
    }();
</script>