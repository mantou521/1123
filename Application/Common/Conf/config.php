<?php
return array(
    'LOAD_EXT_FILE' =>'common',

    'LOAD_EXT_CONFIG'=>'db', // 加载数据库配置文件

    '__CSSS_PATH__'                     =>   __WEB_PATH__.'Statics/Home/Css/', // 增加新的css类库路径替换规则
    '__IMGS_PATH__'                     =>   __WEB_PATH__.'Statics/Home/Images/', // 增加新的IMG上传路径替换规则
    '__JS_PATH__'                      =>   __WEB_PATH__.'Public/Home/Js/', // 增加新的js上传路径替换规则
    // '__WEB_PATH__'                        => 'http://bm.democast.cn/', // 站点根目录
    '__WEB_PATH__'                     =>   'http://127.0.0.1/thinkphp_3.2.3/', // 站点根目录

    //'配置项'=>'配置值'
    'TAGLIB_BUILD_IN'       =>  'Cx,Common\Tag\My',   //加载自定义标签

    'LANG_SWITCH_ON'     =>     true,    //开启语言包功能
    'LANG_AUTO_DETECT'     =>     true, // 自动侦测语言
    'DEFAULT_LANG'         =>     'zh-cn', // 默认语言
    'LANG_LIST'            =>    'en-us,zh-cn,zh-tw', //必须写可允许的语言列表
    'VAR_LANGUAGE'     => 'l', // 默认语言切换变量
);