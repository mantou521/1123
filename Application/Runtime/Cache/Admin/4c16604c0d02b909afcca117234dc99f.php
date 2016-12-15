<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <LINK rel="Bookmark" href="/favicon.ico" >
    <LINK rel="Shortcut Icon" href="/favicon.ico" />
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
    <script type="text/javascript" src="/Public/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

<link href="/Public/Admin/css/theme.min.css" rel="stylesheet">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="wrap">
  <div class="common-form">
    <form action="<?php echo U('Admin/backup/import');?>" method="post">
    	<div class="table_list">
    	<table width="100%" cellspacing="0" class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th align="left"><?php echo L('NAME');?></th>
                    <th><?php echo L('FILE_SIZE');?></th>
                    <th><?php echo L('BACKUP_TIME');?></th>
                    <th><?php echo L('ACTIONS');?></th>
                </tr>
            </thead>
        	<tbody>
            <?php if(is_array($backups)): $i = 0; $__LIST__ = $backups;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><tr class="collapsed">
                <td>
                    <span style="padding-left: 20px" name="<?php echo ($val["name"]); ?>" class="expander"></span>
                    <?php echo ($val["name"]); ?>
                </td>
                <td><?php echo ($val["total_size"]); ?>kb</td>
                <td><?php echo ($val["date_str"]); ?></td>
                <td>
                    <a href="<?php echo U('Admin/backup/del_backup', array('backup'=>$val['name']));?>"  class="js-ajax-delete"><?php echo L('DELETE');?></a> | 
                    <a href="<?php echo U('Admin/backup/import', array('backup'=>$val['name']));?>" class="js-ajax-dialog-btn" data-msg="确定恢复吗？"><?php echo L('RESTORE');?></a>
                </td>
            </tr>
            <?php if(is_array($val['vols'])): $i = 0; $__LIST__ = $val['vols'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><tr parent="<?php echo ($val["name"]); ?>" class="hide">
                <td><?php echo ($vol["file"]); ?></td>
                <td><?php echo ($vol["size"]); ?>kb</td>
                <td><?php echo ($val["date_str"]); ?></td>
                <td>
                    <a href="<?php echo U('Admin/backup/download', array('backup'=>$val['name'], 'file'=>$vol['file']));?>"><?php echo L('DOWNLOAD');?></a>
                </td>
            </tr><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
        	</tbody>
        </table>
        </div>
    </form>
    </div> 
</div>
<style type="text/css">
.hide{display:none;}
.table_list tr.expanded td .expander{
	background: url(__TMPL__Public/assets/images/tv-collapsable.gif) center center no-repeat;
}
.table_list tr.collapsed td .expander{
	background: url(__TMPL__Public/assets/images/tv-expandable.gif) center center no-repeat;
}
</style>
<script src="/Public/js/common.js"></script>
<script>
$(function(){
    $(".show_sub").click(function(){
        $(this).attr("src",function(){
            if(this.src == '__TMPL__Public/assets/images/tv-expandable.gif'){
                return '__TMPL__Public/assets/images/tv-collapsable.gif';
            } else {
                return '__TMPL__Public/assets/images/tv-expandable.gif';
            }
        });
        var sub_id = $(this).attr('sub');
        $("tr[parent='"+sub_id+"']").toggle();
    });
    $('.expander').toggle(function(){
        $(this).parent().parent().removeClass('collapsed').addClass('expanded');
        $('tr[parent="'+$(this).attr('name')+'"]').show();
    },function(){
        $(this).parent().parent().removeClass('expanded').addClass('collapsed');
        $('tr[parent="'+$(this).attr('name')+'"]').hide();
    });
});
</script>
</body>
</html>