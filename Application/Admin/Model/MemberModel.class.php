<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/20
 * Time: 14:55
 */
namespace Admin\Model;

use Think\Model;

class MemberModel extends Model
{

    /**
     * 会员列表
     * @return array
     */
    public function member_list()
    {
        $res = $this->where("id>0 and ispay=1")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->order('id asc')->select();
        foreach ($res as $key => $vo) {
            $vo['pdt'] = date('Y-m-d',$vo['rdt']);
            $reid = $this->where('id=' . $vo['reid'])->find();
            $vo['regonghao'] = $reid['nickname'];
            $vo['rename'] = $reid['username'];
            $da[] = $vo;
        }
        return $da;
    }


}