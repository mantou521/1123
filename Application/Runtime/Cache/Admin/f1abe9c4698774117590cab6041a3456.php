<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

    <!--[if lt IE 9]>
<script type="text/javascript" src="/Public/lib/html5.js"></script>
<script type="text/javascript" src="/Public/lib/respond.min.js"></script>
<script type="text/javascript" src="/Public/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/Public/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/Public/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/Public/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/Public/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/Public/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/Public/static/h-ui.admin/css/style.css" />

    <!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
    <link rel="stylesheet" href="/Public/Home/css/style.css">
    <script src="/Public/Home/js/jquery-1.8.1.min.js"></script>
    <script src="/Public/Home/js/my.js"></script>
    <script src="/Public/Home/js/laydate/laydate.js"></script>
<link href="/Public/lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >

    <title>开店报单</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({maxDate:'#F<?php echo ($dp["$D('datemax')"]); ?>'})" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F<?php echo ($dp["$D('datemin')"]); ?>',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong>88</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="80">工号</th>
            <th width="100">姓名</th>
            <th width="40">开店级别</th>
            <th width="90">地址</th>
            <th width="90">铺货类型</th>
            <th width="90">加盟费用</th>
            <th width="90">支付方式</th>
            <th width="90">支付状态</th>
            <th width="100">申请时间</th>
            <th width="100">操作</th>
        </tr>
		</thead>
		<tbody>
        <?php if(is_array($res)): foreach($res as $key=>$vo): ?><tr class="text-c">
                <td><input type="checkbox" value="1" name=""></td>
                <td><?php echo ($vo['nickname']); ?></td>
                <td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')"><?php echo ($vo['username']); ?></u></td>
                <td><?php if(($vo["st_level"] == 1)): ?>A级市级店<?php elseif(($vo["st_level"] == 2)): ?>市级店<?php elseif(($vo["st_level"] == 3)): ?>县级店<?php elseif(($vo["st_level"] == 4)): ?>街道店<?php elseif(($vo["st_level"] == 5)): ?>社区店<?php endif; ?></td>
                <td><?php echo ($vo['address']); ?></td>
                <td><?php echo ($vo['st_type']); ?></td>
                <td><?php if(($vo["st_level"] == 1)): ?>900000<?php elseif(($vo["st_level"] == 2)): ?>300000<?php elseif(($vo["st_level"] == 3)): ?>100000<?php elseif(($vo["st_level"] == 4)): ?>50000<?php elseif(($vo["st_level"] == 5)): ?>25000<?php endif; ?></td>
                <td> <?php if(($vo["pay_type"] == 1)): ?>在线支付<?php else: ?> 线下支付<div class="picbox"><a href="/Public/Home/images/upload/pingzheng/<?php echo ($vo["pay_img"]); ?>" data-lightbox="gallery" data-title="<?php echo ($vo['username']); ?>"><img src="/Public/Home/images/upload/pingzheng/<?php echo ($vo["pay_img"]); ?>" width="60"></a></div><?php endif; ?></td>

                <td> <?php if(($vo["pay_status"] == 1)): ?>已支付<?php else: ?> 未支付<?php endif; ?></td>
                <td><?php echo date("Y-m-d",$vo['date']); ?></td>
                <td class="td-manage"><a style="text-decoration:none" href="javascript:;" onClick="member_huanyuan(this,<?php echo ($vo['id']); ?>)" title="" class="label label-success radius">激活</a> <a title="删除" href="javascript:;" onclick="member_del(this,<?php echo ($vo['id']); ?>)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr><?php endforeach; endif; ?>
        </tbody>
	</table>
	</div>
</div>


<script type="text/javascript" src="/Public/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Public/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/Public/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="/Public/Admin/js/layui/layui.js"></script>
<script type="text/javascript" src="/Public/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/Public/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="/Public/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/Public/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/Public/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Public/lib/lightbox2/2.8.1/js/lightbox-plus-jquery.min.js"></script>



<script type="text/javascript">


$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
});

/*用户-激活*/
function member_huanyuan(obj,id){
	layer.confirm('确认要激活吗？',function(index){
        $.ajax({
            url:"/index.php/Admin/Mem/store_act",
            type:'post',
            data:{'id':id},
            dataType:'json',
        })
		$(obj).remove();
		layer.msg('已激活!',{icon: 6,time:1000});
	});
}

/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
        $.ajax({
            url:"/index.php/Admin/Mem/member_delete",
            type:'post',
            data:{'id':id},
            dataType:'json',
        })
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script> 
</body>
</html>