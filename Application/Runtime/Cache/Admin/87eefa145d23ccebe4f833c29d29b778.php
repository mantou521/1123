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
    <link href="/Public/lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <link rel="stylesheet" href="/Public/Home/css/style.css">
    <script src="/Public/Home/js/jquery-1.8.1.min.js"></script>
    <script src="/Public/Home/js/my.js"></script>
    <script src="/Public/Home/js/laydate/laydate.js"></script>
    <title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c"> 日期范围：
        <input type="text" onfocus="WdatePicker({maxDate:'#F<?php echo ($dp["$D('datemax')"]); ?>'})" id="datemin" class="input-text Wdate" style="width:120px;">
        -
        <input type="text" onfocus="WdatePicker({minDate:'#F<?php echo ($dp["$D('datemin')"]); ?>',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
        <input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
        <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>

        <div  class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="<?php echo U('Mem/export_excel');?>"  class="btn btn-danger radius"><i class="Hui-iconfont">&#xe644;</i> 导出表格</a> </span>  </div>

    </div>
    <div style="display: none" class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有数据：<strong>88</strong> 条</span> </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">工号</th>
                <th width="100">姓名</th>
                <th width="40">性别</th>
                <th width="90">手机</th>
                <th width="90">邮编</th>
                <th width="90">合同编号</th>
                <th width="90">编号</th>
                <th width="90">部门代码</th>
                <th width="90">推荐人工号</th>
                <th width="100">推荐人姓名</th>
                <th width="100">身份证</th>
                <th width="150">地址</th>
                <th width="130">加入时间</th>
                <th width="70">状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(is_array($res)): foreach($res as $key=>$vo): ?><tr class="text-c">
                    <td><input type="checkbox" value="1" name=""></td>
                    <td><?php echo ($vo['nickname']); ?></td>
                    <td><u style="cursor:pointer" class="text-primary" onclick="member_show('<?php echo ($vo['username']); ?>','member-show.html','<?php echo ($vo['id']); ?>','360','400')"><?php echo ($vo['username']); ?></u></td>
                    <td><?php if(($vo["sex"] == 1)): ?>男<?php else: ?>女<?php endif; ?></td>
                    <td><?php echo ($vo['usertel']); ?></td>
                    <td><?php echo ($vo['postcode']); ?></td>
                    <td><?php echo ($vo['contract_no']); ?></td>
                    <td><?php echo ($vo["nickname"]); echo ($vo["postcode"]); echo ($vo["e_ulevel"]); ?></td>
                    <td><?php echo ($vo['departnum']); ?></td>
                    <td><?php echo ($vo['regonghao']); ?></td>
                    <td><?php echo ($vo['rename']); ?></td>
                    <!--<td><a href="javaScript:;" class="per_lr2 per_a1">查看正面</a></td>-->
                    <td><div class="picbox"><a href="/Public/Home/images/upload/<?php echo ($vo["img1"]); ?>" data-lightbox="gallery" data-title="<?php echo ($vo['username']); ?>"><img src="/Public/Home/images/upload/<?php echo ($vo["img1"]); ?>" width="60"  ></a></div></td>
                    <td class="text-l"><?php echo ($vo['useraddress']); ?></td>
                    <td><?php echo date("Y-m-d",$vo['rdt']); ?></td>
                    <?php if(($vo["islock"] == 0)): ?><td class="td-status"><span class="label label-success radius">已启用</span></td>
                        <?php else: ?>
                        <td class="td-status"><span class="label label-defaunt radius">已停用</span></td><?php endif; ?>
                    <form name="form" method="post" action="/index.php/Admin/Mem/member_edit">
                        <input type="hidden" name="userid" value="<?php echo ($vo['id']); ?>">
                        <td class="td-manage"><?php if(($vo["islock"] == 0)): ?><a style="text-decoration:none" onClick="member_stop(this,<?php echo ($vo['id']); ?>)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a><?php else: ?><a style="text-decoration:none" onClick="member_start(this,<?php echo ($vo['id']); ?>)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a><?php endif; ?><i ><input class="Hui-iconfont" title="编辑" type="submit" name="member_edit" value="&#xe6df;"></i>  <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','<?php echo U('Mem/change_password',array('userid'=>$vo['id']));?>','<?php echo ($vo['id']); ?>','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> </td>
                    </form>
                </tr><?php endforeach; endif; ?>

            </tbody>
        </table>
    </div>
</div>



<script type="text/javascript" src="/Public/lib/lightbox2/2.8.1/js/lightbox-plus-jquery.min.js"></script>
<script type="text/javascript" src="/Public/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Public/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/Public/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/Public/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/Public/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Public/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/Public/static/h-ui.admin/js/H-ui.admin.js"></script>
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
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-查看*/
    function member_show(title,url,id,w,h){

//        layer_show(title,url,w,h);
    }
    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
            $(obj).remove();
            $.ajax({
                url:"/index.php/Admin/Mem/member_lock",
                type:'post',
                data:{'lockid':id},
                dataType:'json',
            })
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            $.ajax({
                url:"/index.php/Admin/Mem/member_lock",
                type:'post',
                data:{'islockid':id},
                dataType:'json',
            })
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    /*用户-编辑*/
    function member_edit(title,url,id,w,h){

        layer_show(title,url,w,h);
    }
    /*密码-修改*/
    function change_password(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    /*导出表格*/
    function export_excel(obj,id){
        layer.confirm('确认要导出表格吗？',function(index){
            $.ajax({
                url:"<?php echo U('Mem/export_excel');?>",
                type:'post',
                data:{'islockid':id},
                dataType:'json',
            })
            layer.msg('已导出表格!',{icon:1,time:1000});
        });
    }

</script>
</body>
</html>