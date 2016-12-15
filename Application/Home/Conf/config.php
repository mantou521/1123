<?php
return array(
    //'配置项'=>'配置值'
//    'DB_TYPE'=>'mysql',// 数据库类型
//    'DB_HOST'=>'localhost',// 服务器地址
//    'DB_NAME'=>'fenxiao',// 数据库名
//    'DB_USER'=>'root',// 用户名
//    'DB_PWD'=>'KeYpZrZx',// 密码
//    'DB_PORT'=>3306,// 端口
//    'DB_PREFIX'=>'think_',// 数据库表前缀
//    'DB_CHARSET'=>'utf8',// 数据库字符集
    //自定义success和error的提示页面模板
//    'TMPL_ACTION_SUCCESS'=>'Public:dispatch_jump',
//    'TMPL_ACTION_ERROR'=>'Public:dispatch_jump',

    //支付宝配置参数
    'alipay_config'=>array(
        'partner' =>'2088421877121942',   //这里是你在成功申请支付宝接口后获取到的PID；
        'key'=>'xmk26danzvpu9e9dzax2hubrua599e1n',//这里是你在成功申请支付宝接口后获取到的Key
        'sign_type'=>strtoupper('MD5'),
        'input_charset'=> strtolower('utf-8'),
        'cacert'=> getcwd().'\\cacert.pem',
        'transport'=> 'http',
    ),
    //以上配置项，是从接口包中alipay.config.php 文件中复制过来，进行配置；

    'alipay'   =>array(
        //这里是卖家的支付宝账号，也就是你申请接口时注册的支付宝账号
        'seller_email'=>'2355838906@qq.com',
        //这里是异步通知页面url，提交到项目的Pay控制器的notifyurl方法；
        'notify_url'=>SITE_URL.'/index.php?m=Home&c=Pay&a=notifyurl',
        //这里是页面跳转通知url，提交到项目的Pay控制器的returnurl方法；
        'return_url'=>SITE_URL.'/index.php?m=Home&c=Pay&a=returnurl',
        //支付成功跳转到的页面，我这里跳转到项目的User控制器，myorder方法，并传参payed（已支付列表）
        'successpage'=>SITE_URL.'/index.php',
        //支付失败跳转到的页面，我这里跳转到项目的User控制器，myorder方法，并传参unpay（未支付列表）
        'errorpage'=>SITE_URL.'/index.php',
    ),
);