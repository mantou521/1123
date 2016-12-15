<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
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



    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

    <link href="/Public/Admin/css/theme.min.css" rel="stylesheet">
    <link href="/Public/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/Public/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/Public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
        .length_3{width: 180px;}
        form .input-order{margin-bottom: 0px;padding:3px;width:40px;}
        .table-actions{margin-top: 5px; margin-bottom: 5px;padding:0px;}
        .table-list{margin-bottom: 0px;}
    </style>
    <!--[if IE 7]>
    <link rel="stylesheet" href="/Public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
    <![endif]-->
    <script type="text/javascript">
        //全局变量
        var GV = {
            DIMAUB: "/",
            JS_ROOT: "public/js/",
            TOKEN: ""
        };
    </script>
    <!-- Le javascript
        ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/Public/js/jquery.js"></script>
    <script src="/Public/js/wind.js"></script>
    <script src="/Public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
    <?php if(APP_DEBUG): ?><style>
            #think_page_trace_open{
                z-index:9999;
            }
        </style><?php endif; ?>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="common-form">
    <form action="<?php echo U('Admin/backup/index_post');?>" method="post">
        <div class="table_list">
            <table width="100%" cellspacing="0" class="table_form">
                <tr>
                    <td width="150" align="right">每个分卷文件大小</td>
                    <td>
                        <input type="text" name="sizelimit" value="<?php echo ($sizelimit); ?>" size="10"> K
                        &nbsp;&nbsp;(推荐10M以下)
                    </td>
                </tr>
                <tr>
                    <td align="right">备份名称</td>
                    <td><input type="text" name="backup_name" value="<?php echo ($backup_name); ?>"></td>
                </tr>
                <tr>
                    <td align="right">备份类型</td>
                    <td>
                        <label><input type="radio" checked="checked" value="full" name="backup_type" onclick="javascript:$('#js-showtables').hide();"> 全部备份 &nbsp;&nbsp;</label>
                        <label><input type="radio" value="custom" name="backup_type" onclick="javascript:$('#js-showtables').show();"> 自定义备份</label>
                    </td>
                </tr>
                <tr id="js-showtables">
                    <td align="right">
                        <label><input name="selectall" type="checkbox" checked="checked" value="" onclick="javascript:$('.js-checkitem').attr('checked', this.checked);" /> 选择全部</label>
                    </td>
                    <td colspan="2">
                        <?php if(is_array($tables)): $i = 0; $__LIST__ = $tables;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><label class="checkbox inline" style="width:200px;"><input name="backup_tables[<?php echo ($val); ?>]" type="checkbox" value="-1" checked="checked" class="js-checkitem" />&nbsp;&nbsp;<?php echo ($val); ?></label><?php endforeach; endif; else: echo "" ;endif; ?>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="dosubmit" value="开始备份" class="btn btn-primary" style="margin-top: 10px;"></td>
                </tr>
            </table>
        </div>
    </form>
</div>
<script type="text/javascript" src="/Public/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Public/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/Public/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/Public/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/Public/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Public/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/Public/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>