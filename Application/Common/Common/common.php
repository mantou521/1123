<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2017/1/3
 * Time: 10:24
 */



function hello(){
    echo 'hello,exist';
}

/**
 * 查找   激活时间为空的用户
 *
 * 更新   激活时间 = 注册时间
 * 
 */
function generate_pdt()
{
    $users = M('member')->field('id')->where('rdt = \'\'')->select();

    foreach ($users as $user) {
        M('member')->execute("update think_member set rdt=pdt where id=". $user['id']);
    }
}

