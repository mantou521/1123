<?php if (!defined('THINK_PATH')) exit();?><!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
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
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->





<title>旅游销售提成  </title>
</head>
<body>
<article class="page-container">
    <form class="layui-form" action="<?php echo U('Travel/commission');?>" method="post" class="form form-horizontal"
          id="form-change-password">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>订单号：</label>
            <div class="formControls col-xs-8 col-sm-9"> <?php echo ($order["order_sn"]); ?></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单人利润：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" lay-verify="required" autocomplete="off" placeholder=""
                       name="profit" id="profit">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input name="id" type="hidden" value="<?php echo ($order["id"]); ?>">
                <input lay-submit name="cooperation_bonus" class="btn btn-primary radius" type="submit"
                       lay-filter="user" value="&nbsp;&nbsp;发放&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

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



<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

    layui.use('form', function () {
        var form = layui.form(),
                $ = layui.jquery
        //监听提交
        form.on('submit(user)', function (data) {
            var userInfo = data.field;
            var url = "<?php echo U('Travel/sales_commissions');?>";
            $.post(url, userInfo, function (data) {
                if (data.status == 'error') {
                    layer.msg(data.msg, {icon: 5});//失败的表情
                    return;
                } else if (data.status == 'success') {
                    layer.msg(data.msg, {
                        icon: 6,//成功的表情
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function () {
                        layer_close();
                        location.reload();
                    });
                }
            })

            return false;//阻止表单跳转
        });
    });


</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>