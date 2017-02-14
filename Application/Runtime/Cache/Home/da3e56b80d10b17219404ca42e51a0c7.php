<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>入职推荐报单</title>
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
    <!--可无视-->
    <!--<link href="css/main.css" rel="stylesheet" type="text/css" />-->
    <!--必要样式-->
    <!--<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
    <link href="/Public/Home/css/city-picker.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Public/Home/css/style.css">
    <link rel="stylesheet" href="/Public/Home/css/list.css">
    <script src="/Public/Home/js/jquery-1.8.1.min.js"></script>
    <script src="/Public/Home/js/my.js"></script>
    <!--<script src="/Public/Home/js/login.js"></script>-->
    <script src="/Public/Home/js/validation.js"></script>
    <script src="/Public/Home/js/laydate/laydate.js"></script>
    <style>
        .reg_con_input input.data_list {
            background: white;
        }

        /*.reg_con_input {*/
            /*margin-left: 10px;*/
        /*}*/

        .reg_con_input_all {
            padding-top: 10px;
        }
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
                <span>报单<a href="rztj_baodan.html" class="yeji_span"> &gt; 入职推荐报单</a></span>
                <span class="phone_btn nav">导航</span>
            </div>
            <form name="form1" method="post" action="/index.php/Home/Member/conm_re" enctype="multipart/form-data" class="main_right_con ruzhi_right_con rztj_baodan_con biaodan_hh uu_tijiao">
                <h3 class="ruzhi_con_h3">&nbsp</h3>

                <div class="main_right_con1">
                    <h4>说明</h4>

                    <p>申请人需准备资料：一寸免冠照片三张，身份证复印件，工资卡复印件、保证金500元（离职退还）、培训费300元。</p>

                    <p>签总公司统一代理合同、发放工作证、工号，并领取游邮册一本作为样本，离职后无损坏退还给总公司，总公司退还保证金。</p>
                </div>

                <div class="main_right_con1 ruzhi_right_con1">
                    <div class="certificates">
                        <div class="certificate tt_over">
                            <h4>上传一寸照片</h4>
                            <dl>
                                <dt id="preview" class='localImag'><img id="imghead" src="" alt="" /></dt>
                                <span></span>
                                <input type="button" value="上传头像" onclick="doc.click()" class="file_style"/>
                                <input type="file" name="img1"  id="doc" style="display:none"  onchange="previewImage(this,'preview','imghead')" />
                            </dl>
                        </div>
                        <div class="certificate tt_over">
                            <h4>上传证件（身份证正面）</h4>
                            <dl>
                                <dt id="preview2" class='localImag'><img id="imghead2" src="" alt="" /></dt>
                                <span></span>
                                <input type="button" value="上传证件" onclick="doc2.click()" class="file_style"/>
                                <input type="file" name="img2"  id="doc2" style="display:none"  onchange="previewImage(this,'preview2','imghead2')" />
                            </dl>
                        </div>
                        <div class="certificate tt_over">
                            <h4>上传证件（身份证反面）</h4>
                            <dl>
                                <dt id="preview4" class='localImag'><img id="imghead4" src="" alt="" /></dt>
                                <span></span>
                                <input type="button" value="上传证件" onclick="doc4.click()" class="file_style"/>
                                <input type="file" name="img4"  id="doc4" style="display:none"  onchange="previewImage(this,'preview4','imghead4')" />
                            </dl>
                        </div>
                        <div class="certificate tt_over">
                            <h4>上传银行卡复印件</h4>
                            <dl>
                                <dt id="preview3" class='localImag'><img id="imghead3" src="" alt="" /></dt>
                                <span></span>
                                <input type="button" value="上传银行卡" onclick="doc3.click()" class="file_style"/>
                                <input type="file" name="img3"  id="doc3" style="display:none"  onchange="previewImage(this,'preview3','imghead3')" />
                            </dl>
                        </div>
                    </div>
                    <div class="reg_con_input_all  reg_con_input_all one">
                        <div class="reg_con_input hang_box">
                            <label>开户行信息：</label>
                            <i class="phone_hang phone_hang2">
                                <input name="hang" placeholder="" id="hang" class="a1">
                                <em>银行</em>
                            </i>
                            <i class="phone_hang">
                                <input name="hang2" placeholder="" id="hang2" class="a1">
                                <em>支行</em>
                            </i>
                        </div>
                        <div class="reg_con_input one">
                            <label>银行卡帐号：</label>
                            <input tip="银行卡帐号" yz2='zhanghao' id="hao" type="text" name="hao" class="data_list a1" value="">
                        </div>
                        <div class="reg_con_input one">
                            <label>合同编号：</label>
                            <input tip="合同编号" yz2='zhanghao' id="contract_no" type="text" name="contract_no" class="data_list a1" value="">
                        </div>
                        <div class="reg_con_input one">
                            <label>申　　请：</label>
                            <select name="user_level" id="user_level">
                                <option value="1">代理人 ￥ 800</option>
                                <option value="2">VIP代理人 ￥ 8800</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="c main_right_con1">
                    <h4>个人信息填写</h4>

                    <div class="reg_con_input_all one">
                        <div class="reg_con_input">
                            <label>姓　　名：</label>
                            <input tip="姓名" type="text" name="name" id="name" class="data_list a1" value="">
                        </div>
                        <div class="reg_con_input one">
                            <label>性　　别：</label>
                            <select name="xingbie" id="xingbie">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </div>
                        <div class="reg_con_input one">
                            <label>出生日期：</label>
                            <input tip="出生日期" type="text" id="demo1" name="cs_time" class="data_list cur laydate-icon" value="">
                        </div>
                        <div class="reg_con_input one">
                            <label>入职日期：</label>
                            <input tip="入职日期" type="text" id="demo2" name="rz_time" class="data_list cur laydate-icon" value="">
                        </div>
                        <div class="reg_con_input one">
                            <label>身份证号：</label>
                            <input tip="身份证号" yz2='idcard2' type="text" name="idcard" id="idcard" class="data_list a1" value="">
                        </div>
                        <div class="reg_con_input">
                            <label>联系方式：</label>
                            <input tip="联系方式" yz2='phone2' type="text" name="phone" id="card" class="data_list a1" value="">
                        </div>
                        <div class="reg_con_input one phone_addr2">
                            <div>
                                <label class="dizhi">家庭住址：</label>
                                <div class="form-group">
                                    <div style="position: relative;">
                                        <input id="city-picker3" class="form-control" readonly type="text" name="addre1" value="北京市/北京市/东城区" data-toggle="city-picker">
                                    </div>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                            <input tip="家庭住址" type="text" name="addre2" id="phone" placeholder="输入详细地址" class="data_list details_ipt a1" value="">
                        </div>
                        <div class="reg_con_input one">
                            <label>邮　　编：</label>
                            <input tip="邮编" yz2='youbian' type="text" name="youbian" id="youbian" class="data_list a1" value="">
                        </div>
                    </div>
                </div>
                <div class="cur zf_cur">
                    <!--<input type="button" value="" class="ruzhi_zhifu"/>-->
                    <input class="ruzhi_zhifu" type="submit" name="re_submit" id="send"  value="提交信息" >
                    <!--<a href="javaScript:;" class="ruzhi_zhifu" id="send">提交信息</a>-->
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


</body>
</html>

<!-- 城市选择-->
<script src="/Public/Home/js/js_city/jquery.js"></script>
<script src="/Public/Home/js/js_city/bootstrap.js"></script>
<script src="/Public/Home/js/js_city/city-picker.data.js"></script>
<script src="/Public/Home/js/js_city/city-picker.js"></script>
<script src="/Public/Home/js/js_city/main.js"></script>

<script type="text/javascript">
//    $(document).ready(function(){
//
//    });

    //图片上传预览    IE是用了滤镜。
    function previewImage(file,id1,id2)
    {
        var MAXWIDTH  = 260;
        var MAXHEIGHT = 180;
        var div = document.getElementById(''+id1+'');
        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id='+id2+'>';
            var img = document.getElementById(''+id2+'');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
                //                 img.style.marginLeft = rect.left+'px';
//                img.style.marginTop = rect.top+'px';
                img.style.marginTop = 0+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById(''+id2+'');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+0+"px;"+sFilter+src+"\"'></div>";
        }
    }
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight )
        {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight )
            {
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else
            {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }

    //高度
//    $('.main_w').height($('.main_right').height()+150+'px');
    //日期插件
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
        laydate({elem: '#demo2'});//绑定元素
    }();
</script>
<script type="text/javascript">
    $('.main_left ul li:eq(12) a').addClass('a_cur');
</script>