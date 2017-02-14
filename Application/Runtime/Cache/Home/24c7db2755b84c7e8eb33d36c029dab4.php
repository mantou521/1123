<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>旅游报单-订单详情</title>
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
        /*/!*.main_w,.container.main,.main_right{height:4000px;}*!/
        /!*.product_right_con{height:3800px;}*!/
        .main{padding-top: 0;}*/
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
                <span>报单<a href="lvyou_yeji.html" class="yeji_span"> &gt; 旅游业绩</a></span>
            </div>
            <div class="product_right_con baodan_con">
                <h3 class="ruzhi_con_h3">&nbsp</h3>
                <div class="main_right_con1">
                    <h4>报团信息</h4>
                    <div class="bt">
                        <table class="result_tab record_tab feed_tab" cellpadding="0" cellspacing="0">
                            <tr>
                                <th>路线名称</th>
                                <th>出发日期</th>
                                <th>人数</th>
                                <th>交通方式</th>
                            </tr>
                            <tr>
                                <td>
                                    <a href=""><?php echo ($vo["tr_name"]); ?></a>
                                </td>
                                <td>
                                    <span><?php echo ($vo["t"]); ?></span>
                                </td>
                                <td>
                                    <span><?php echo ($vo["y_num"]); ?>（成人）</span>
                                    <span><?php echo ($vo["c_num"]); ?>（儿童）</span>
                                </td>
                                <td>
                                    <span><?php if(($vo["type"] == 1)): ?>火车<?php else: ?>飞机<?php endif; ?> </span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="main_right_con1">
                    <h4>出团人信息</h4>
                    <div class="bts">
                        <?php if(is_array($users)): foreach($users as $key=>$us): ?><div class="bt_box">
                            <p>
                                <span class="bt_span_l">姓名：</span>
                                <span><?php echo ($us["user_name"]); ?></span>
                            </p>
                            <p>
                                <span class="bt_span_l">性别：</span>
                                <span><?php if($us["sex"] == 1): ?>男<?php else: ?>女<?php endif; ?></span>
                            </p>
                            <p>
                                <span class="bt_span_l">电话（选填）：</span>
                                <span><?php echo ($us["mobile"]); ?></span>
                            </p>
                            <p>
                                <span class="bt_span_l">身份证号：</span>
                                <span><?php echo ($us["usercard"]); ?></span>
                            </p>
                            <p>
                                <span class="bt_span_l">身份证复印件</span>
                                <a href="<?php echo U('Travel/img',array('img'=>$us['card_thumb']));?> " target="_blank" class="card_img">查看</a>
                            </p>
                            <p>
                                <span class="bt_span_l">携带儿童：</span>
                                <span><?php echo ($us["c_num"]); ?>名</span>
                            </p>
                        </div><?php endforeach; endif; ?>
                    </div>
                    <!--<div class="bt_more">更多>></div>-->
                </div>
                <?php if($vo["total"] > 0): ?><div class="main_right_con1">
                    <h4>费用项加详细说明</h4>
                    <div class="bt feed_p">
                        <p>备注：<?php echo ($vo["remark"]); ?></p>
                        <p>费用总计：<span><i>¥ </i><?php echo ($vo["total"]); ?></span></p>
                        <p>支付方式：<em>在线支付</em></p>
                    </div>
                </div>
                <div class="feed_btn">
                
                    <a href="<?php echo U('Pay/doalipay',array('order_id'=>$vo['id'],'total'=>$vo['total'],'type'=>'travel'));?>">确认支付</a>
                    <a href="javaScript:;" id="wechat-share">取消订单</a>
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
<script type="text/javascript" src="/Public/Admin/js/layui/layui.js"></script>
<script type="text/javascript" src="/Public/static/h-ui.admin/js/H-ui.admin.js"></script>

<!-- up_alert-->
<div class="dialog wechat-share-dialog">
    <div class="dialog-overlay"></div>
    <div class="dialog-content"  style="opacity: 1;">
        <div class="dia_header">
            <span>取消订单</span>
            <img src="/Public/Home/images/dia_close.png" alt="" class="dialog-close"/>
        </div>
        <form class="layui-form dia_cont tishi_cont">
            <div class="close_h">取消原因：</div>
            <textarea class="close_tex" lay-verify="required" name="cancel_reason"></textarea>
            <div class="close_sure">
                <input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>">
                <a lay-submit lay-filter="user" href="javaScript:;">确认取消</a>
                <a href="">暂不取消</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script>
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
    }();
    $('.main_w').height('1500px');
    $('.container.main').height('1500px');
    $('.main_right').height('1500px');
    $('.main').height('1300px');
    $('.baodan_con').height('1300px');

    layui.use('form', function(){
        var form = layui.form(),
                $ = layui.jquery
        //监听提交
        form.on('submit(user)', function(data){
            var userInfo = data.field;
            var url = "<?php echo U('Travel/cancel_order');?>";
            $.post(url,userInfo,function(data){
                if(data.status == 'error'){
                    layer.msg(data.msg,{icon: 5});//失败的表情
                    return;
                }else if(data.status == 'success'){
                    layer.msg(data.msg, {
                        icon: 6,//成功的表情
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        layer_close();
                        location.reload();
                    });
                }
            })

            return false;//阻止表单跳转
        });
    });
</script>