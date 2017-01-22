<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/20
 * Time: 14:55
 */

namespace Home\Model;

use Think\Model;

class UserModel extends Model
{
    protected $tableName = 'member';
    protected $_validate = array(
        array('useraddress','require','用户地址不能为空！'), // 用户名必须
        array('img3','require','银行卡图片不能为空！'), // 用户名必须
    );

    /**
     * 人力架构，自己和比自己结构下面低于自己级别的
     * @param $id
     * @return mixed
     */
    public function teamCount($id)
    {
        $Mem = M('member');
        $user_level = $Mem->where('id='.$id)->getField('ulevel');
        $res = $Mem->where("((repath like '%\\,{$id}\\,%' and ".C('DB_PREFIX')."member.ulevel<$user_level) or id=$id ) and ispay=1  ")->join('__ULEVEL__ ON __ULEVEL__.ulevel = __MEMBER__.ulevel')->count();
        return $res;
    }
}