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
 * index 应用。更新数据库
 *
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

/**
 * 计算2个时间段的月份差
 * @param $st   开始时间(时间戳格式)
 * @param $et   结束时间(时间戳格式)
 * @return bool|int|string 差值(月)
 */
function getMonthNum($st, $et)
{
    if ($st > $et) {
    	$c = $et;
        $et = $st;
        $st = $c;
    }
    $s_y = date('Y', $st);
    $e_y = date('Y', $et);
    $s_m = date('n', $st);
    $e_m = date('n', $et);
    $s_d = date('j', $st);
    $e_d = date('j', $et);
    if ($s_y == $e_y) {
    	$month = $e_m - $s_m;
    } else {
        $month = ($e_y - $s_y - 1) * 12 + ($e_m + 12 - $s_m);
    }
    if ($s_d > $e_d && $month >0) {
        $month-=1;
    }

    return $month;
}

/**
 * 时间差
 * 
 * @param $begin_time
 * @param $end_time
 * @return array
 */
function timeDiff($begin_time, $end_time){
    if ( $begin_time < $end_time ) {
        $starttime = $begin_time;
        $endtime = $end_time;
    } else {
        $starttime = $end_time;
        $endtime = $begin_time;
    }
    $timediff = $endtime - $starttime;
    $days = intval( $timediff / 86400 );
    $remain = $timediff % 86400;
    $hours = intval( $remain / 3600 );
    $remain = $remain % 3600;
    $mins = intval( $remain / 60 );
    $secs = $remain % 60;
    $res = array( "day" => $days, "hour" => $hours, "min" => $mins, "sec" => $secs );
    return $res;
}
