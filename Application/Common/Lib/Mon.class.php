<?php

/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/9/12
 * Time: 17:14
 */
namespace Common\Lib;

use Common\Lib\System;

class Mon
{
    public $Sys;

    public function __construct()
    {
        $this->Sys = new \Common\Lib\System();
    }
    public function chek()
    {
        return 123;
    }

    public function memact($id)
    {
        $User = M('member');
        $user = getMemberbyID($id);
        $fas = getMemberbyID($user['reid']);
        $recount = $fas['recount'] + 1;
        $User->where('id=' . $fas['id'])->setField('recount', $recount);
        $data['ispay'] = 1;
        $data['pdt'] = time(); //激活时间
        $User->where('id=' . $id)->setField($data);

        updatelevel();  //升级级别
        department();   //生成部门号
        depart_down();  //获取上级部门号

        $Sys = new \Common\Lib\System();
        $Sys->bonus1($id,$user['nickname'], $fas['id'],$user['user_level']);
        $Sys->bonus2($user['repath'], $user['relevel'], $user['ulevel'], $user['user_level'], $id, $user['nickname'], $fas['id']);
        $Sys->b0bonus();
    }

    /**
     * 根据升级记录升级会员级别
     * @return bool
     */
    public function mem_update()
    {
        $record = M('ulevelup')->where('status = 0')->select();
        foreach ($record as $list) {
            $data = array();
            $data['ulevel'] = $list['tolevel'];
            $data['e_ulevel'] = M('ulevel')->where('ulevel =' . $list['tolevel'])->getField('dan');
            $result = M('member')->where('id=' . $list['userid'])->setField($data);

            $update = array();
            $update['datetime'] = time();
            $update['status'] = 1;
            $Up = M('ulevelup')->where('uid =' . $list['uid'])->save($update);
            if ($result && $Up) {
                return true;
            }
        }
    }

    public function store_act($id)
    {
        $Store = M('store');
        $result = $Store->where('id=' . $id)->setField('pay_status', '1');
    }

    //uu册销售奖
    public function uuSaleBonus($id, $total)
    {
        $user = M('member')->field('repath, relevel, ulevel, nickname, reid')->where('id =' . $id)->find();
        $this->Sys->bonus3($id,$total);
        $this->Sys->bonus4($id,$total);
        $this->Sys->bonus5($user['repath'], $user['relevel'], $user['ulevel'], $id, $user['nickname'],$user['reid'], $total);
        $this->Sys->b0bonus();
    }

    //合作商业务提成
    public function commission($id, $total, $num)
    {
        $user = M('member')->field('repath, relevel, ulevel, nickname, reid')->where('id =' . $id)->find();
        $this->Sys->bonus6($id, $total, $num);
        $this->Sys->bonus7($user['repath'], $user['relevel'], $user['ulevel'], $id, $user['nickname'],$user['reid'], $total, $num);
        $this->Sys->b0bonus();
    }

    //旅游销售提成
    public function sales_commissions($id, $profit, $num)
    {
        $user = M('member')->field('repath, relevel, ulevel, nickname, reid')->where('id =' . $id)->find();
        $this->Sys->bonus8($id, $profit, $num);
        $this->Sys->bonus9($user['repath'], $user['relevel'], $user['ulevel'], $id, $user['nickname'],$user['reid'], $profit, $num);
        $this->Sys->b0bonus();
    }
    
    //达成奖
    public function satisfy()
    {
        
    }

}