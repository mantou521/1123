<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/20
 * Time: 14:55
 */
namespace Home\Model;
use Think\Model;
class UserModel extends Model{

    protected $tableName = 'member';
    protected $_validate = array(
        array('useraddress','require','用户地址不能为空！'), // 用户名必须
        array('img3','require','银行卡图片不能为空！'), // 用户名必须
    );
}