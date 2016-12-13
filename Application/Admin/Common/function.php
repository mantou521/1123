<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/9/1
 * Time: 15:52
 */
//登录验证
function checkLoginA($NickName,$PassWord){
    $PassWord = md5($PassWord);
    $Mem=M('admin_user');
    $userCount = $Mem->where("user_name= '$NickName' AND password= '$PassWord'")->count();
    if($userCount >= 1){
        return true;
    }else{
        return false;
    }
}
//根据账号获取会员信息
function getAdminbyusername($ausername){
    $Mem=M('admin_user');
    $res = $Mem->where("user_name='$ausername'")->find();
    return $res;
}