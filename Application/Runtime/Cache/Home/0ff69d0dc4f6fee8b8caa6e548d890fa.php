<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>开店报单</title>
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
	<!--<link href="/Public/Home/css/main.css" rel="stylesheet" type="text/css" />-->
	<!--必要样式-->
	<!--<link href="http://cdn.bootcss.com/bootstrap/3.3.6//Public/Home/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
	<link href="/Public/Home/css/city-picker.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/Public/Home/css/style.css">
	<script src="/Public/Home/js/jquery-1.8.1.min.js"></script>
	<script src="/Public/Home/js/validation.js"></script>
	<script src="/Public/Home/js/my.js"></script>
	<script src="/Public/Home/js/login.js"></script>
	<script src="/Public/Home/js/laydate/laydate.js"></script>
	<style>
		.reg_con_input input.data_list {
			background: white;
		}


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
					<span>报单<a href="sys.html" class="yeji_span"> &gt; 开店报单</a></span>
				</div>
				<form method="post" action="/index.php/Home/Member/store_post" class="main_right_con kaidian" enctype="multipart/form-data">
					<div class="reg_con_input_all">
						<div class="main_right_con1">
							<h4>店铺信息填写</h4>
							<div class="reg_con_input one reg_con_span edit_con_input reg_mar_l open_size">
								<div class="open_div">
									<span>店铺地址：</span>
									<div class="form-group form-group-mar">
										<div style="position: relative;">
											<input id="city-picker3" class="form-control" readonly type="text" name="address" value="北京市/北京市/东城区" data-toggle="city-picker">
										</div>
									</div>
								</div>
								<input tip="家庭住址" type="text" name="address1" id="phone" placeholder="输入详细地址" class="data_list details_ipt a1" value="">
							</div>
							<div class="reg_con_span edit_con_input reg_mar_l open_size">
								<span>开店级别：</span>
								<select class="open_sel" name="st_level">
									<option value="1">A级市级店</option>
									<option value="2">市级店</option>
									<option value="3">县级店</option>
									<option value="4">街道店</option>
									<option value="5">社区店</option>
								</select>
							</div>
                            <div class="reg_con_span edit_con_input reg_mar_l open_size">
								<span>货铺类型：</span>
								<ul class="dia_puhuo">
									<li>
										<input type="radio" name="st_type" value="1" checked/>
										<span><i></i></span>
										100%铺货
									</li>
									<li>
										<input type="radio" name="st_type" value="2"/>
										<span><i></i></span>
										80%UU册铺货+20%商品铺货
									</li>
								</ul>
							</div>
							<div class="reg_con_span edit_con_input reg_mar_l open_size open_size_h">
								<span>上传营业执照：<br/><em class="open_em_color">（选填）</em></span>
								<dl class="open_up_zhizhao">
									<dt id="preview" class='localImag'><img id="imghead" src="" alt="" /></dt>
									<span></span>
									<input type="button" value="点击上传" onclick="doc.click()" class="file_style"/>
									<input type="file" name="img"  id="doc" style="display:none"  onchange="previewImage(this,'preview','imghead')" />
								</dl>
							</div>
							<div class="reg_con_span edit_con_input reg_mar_l open_size">
								<span>加盟费用：</span>
								<span class="jiage_size">￥ 900000.00</span>
							</div>
							<div class="reg_con_span edit_con_input reg_mar_l open_size">
								<span>支付方式：</span>
								<ul class="dia_radio">
									<li>
										<input type="radio" name="zhifu" value="1" checked/>
										<span><i></i></span>
										在线支付
									</li>
									<li>
										<input type="radio" name="zhifu" value="2"/>
										<span><i></i></span>
										线下支付
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="login_bot reg_bot div_text_center reg_btn_font">
						<div ><input class="cur login_bot_span_login login_bot_span_reg" name="submit" type="submit" value="提交信息" id="kaidian_btn"> </div>
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
<script language="javascript" type="text/javascript">
    $(document).ready(function(){
        $('.open_sel').change(function(){
            var p1=$(this).children('option:selected').val();//这就是selected的值
            if(p1==1){
                $('.jiage_size').text('￥ '+ 900000);
            }else if(p1==2){
                $('.jiage_size').text('￥ '+ 300000);
            }else if (p1==3){
                $('.jiage_size').text('￥ '+ 100000);
            }else if (p1==4){
                $('.jiage_size').text('￥ '+ 50000);
            }else if (p1==5){
                $('.jiage_size').text('￥ '+ 25000);
            }

        })
    })
</script>

<script type="text/javascript">
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
				img.style.marginTop = rect.top+'px';
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
			div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
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
</script>