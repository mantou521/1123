<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/20
 * Time: 14:55
 */
namespace Home\Model;
use Think\Model;
class TravelOrderModel extends Model{

    protected $tableName = 'travel_order';
    protected $_validate = array(
        array('time','require','请选择出行时间！'), // 用户名必须
//        array('user_sn','require','人员编号不能为空！'), // 用户名必须
//        array('text','require','uu册编号不能为空！'), // 用户名必须
//        array('user_num','checkgonghao','人员工号不存在！',0,'function'), // 用户名必须
    );



}