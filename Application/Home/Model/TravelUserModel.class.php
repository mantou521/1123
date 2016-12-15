<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/20
 * Time: 14:55
 */
namespace Home\Model;
use Think\Model;
class TravelUserModel extends Model{

    protected $tableName = 'travel_user';
    protected $_validate = array(
        array('user_name','require','请填写姓名！'), // 用户名必须
        array('usercard','require','请填写身份证号！'), // 用户名必须
//        array('text','require','uu册编号不能为空！'), // 用户名必须
//        array('user_num','checkgonghao','人员工号不存在！',0,'function'), // 用户名必须
    );



}