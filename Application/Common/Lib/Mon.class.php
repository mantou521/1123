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

    /**
     * 激活会员
     *
     * @param $id
     */
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
        $Sys->bonus1($id, $user['nickname'], $fas['id'], $user['user_level']);
        $Sys->bonus2($user['repath'], $user['relevel'], $user['ulevel'], $user['user_level'], $id, $user['nickname'], $fas['id']);
        $Sys->b0bonus();
    }

    /**
     * 升级达标会员
     *
     * 根据升级记录升级会员级别
     * @return bool
     */
    public function mem_update()
    {
        $record = M('ulevelup')->where('status = 0 and period_diff(date_format(now(), \'%Y%m\'), date_format(from_UNIXTIME(`wait_time`), \'%Y%m\')) = 1')->order('wait_time')->select();
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

    /**
     * 保护期
     *
     * 不达标降级
     */
    public function demotion()
    {
        $count = array(3 => 10, 4 => 50, 5 => 200, 6=>500);
        $users = M('member')->where('ulevel > 1 and ispay = 1')->select();
        foreach ($users as $user) {
            $protectTime = $user['ulevel'] + 1;
            if ($user['team_count'] < $count[$protectTime]) {
                $user_id = $user['id'];
            	$sameUser = M('member')->where('repath like \'%,'. $user_id .',%\' and ispay = 1 and ulevel =' . $user['ulevel'])->find();
                $sameUser && $ifPast = M('ulevelup')->where('userid ='.$sameUser['id'] . ' and status = 1 and tolevel = '. $sameUser['ulevel'] . ' and period_diff(date_format(now(), \'%Y%m\'), date_format(from_UNIXTIME(`datetime`), \'%Y%m\')) >='. $protectTime)->count();
                if ($ifPast > 0) {
                    $this->downLevel($user_id, $user['ulevel'], $user['ulevel']-1);
                }

            }
        }
    }

    /**
     * 降级
     *
     * @param $id
     * @param $ulevel
     * @param $tolevel
     */
    public function downLevel($id, $ulevel, $tolevel)
    {
        $save = array(
            'userid' => $id,
            'ulevel' => $ulevel,
            'tolevel' => $tolevel,
            'datetime' => time(),
            'is_drop' => 1,
            'status' => 1,
        );

        M('ulevelup')->add($save);

        exUserLevel($id, $tolevel);
    }


    //店铺激活
    public function store_act($id)
    {
        $Store = M('store');
        $data = [
            'pay_status' => '1',
            'pay_time' => time()
        ];
        $result = $Store->where('id=' . $id)->save($data);

        $userStore = M('store')->where('id=' . $id)->find();
        $save = [
            'isbd' => 1,
            'bdlevel' => $userStore['st_level']
        ];
        M('member')->where('id =' . $userStore['user_id'])->save($save);

        $this->Sys->bonus20($userStore['user_id'], $userStore['st_level'], $userStore['st_type']);
    }

    //uu册销售奖
    public function uuSaleBonus($id, $total)
    {
        $user = M('member')->field('repath, relevel, ulevel, nickname, reid, isbd')->where('id =' . $id)->find();
        $this->Sys->bonus3($id, $total);
        $this->Sys->bonus4($id, $total);
        $this->Sys->bonus5($user['repath'], $user['relevel'], $user['ulevel'], $id, $user['nickname'], $user['reid'], $total);
        if ($user['isbd'] == 1) {
            $this->Sys->bonus21($user['repath'], $user['relevel'], $id, $user['nickname']);
        }
        $this->Sys->b0bonus();
    }

    //合作商业务提成
    public function commission($id, $total, $num)
    {
        $user = M('member')->field('repath, relevel, ulevel, nickname, reid')->where('id =' . $id)->find();
        $this->Sys->bonus6($id, $total, $num);
        $this->Sys->bonus7($user['repath'], $user['relevel'], $user['ulevel'], $id, $user['nickname'], $user['reid'], $total, $num);
        $this->Sys->b0bonus();
    }

    //旅游销售提成
    public function sales_commissions($id, $profit, $num)
    {
        $user = M('member')->field('repath, relevel, ulevel, nickname, reid')->where('id =' . $id)->find();
        $this->Sys->bonus8($id, $profit, $num);
        $this->Sys->bonus9($user['repath'], $user['relevel'], $user['ulevel'], $id, $user['nickname'], $user['reid'], $profit, $num);
        $this->Sys->b0bonus();
    }

    //达成奖, 超额奖
    public function satisfyBonus()
    {
        $this->Sys->bonus10();
        $this->Sys->bonus11();
        $this->Sys->b0bonus();
    }

    //平级育成奖和超越育成奖
    public function pingjiChaoyue()
    {
        $this->Sys->bonus14();
        $this->Sys->bonus15();
        $this->Sys->b0bonus();
    }

    /**
     * 给上级增加业绩
     * @param $id
     * @param $uu       销售uu册
     * @param $travel   旅游人数
     */
    public function addArea($id, $uu, $travel)
    {
        if ($user = getMemberbyID($id)) {
            if ($fman = getMemberbyID($user['reid'])) {
                if ($uu > 0) {
                    M('member')->where('id =' . $fman['id'])->setInc('uu_num', $uu);
                }
                if ($travel > 0) {
                    M('member')->where('id =' . $fman['id'])->setInc('travel_num', $uu);
                }
                $this->addArea($fman['id'], $uu, $travel);
            }
        }
    }


    /**
     * 每人生成自己的个人销售uu册，旅游人数，直推人。  (上个月)
     *
     * 框架生成
     */
    public function person_add()
    {
        $set['uu_num'] = 0;
        $set['travel_num'] = 0;
        $set['last_recount'] = 0;
        $set['sys_uu'] = 0;
        $set['sys_travel'] = 0;
        $set['sys_recount'] = 0;
        M('member')->where('1=1')->save($set);

        $uu = M('order')->field('user_id, sum(goods_num) as num')->where('type = 4 and pay_status = 1  and  period_diff(date_format(now() , \'%Y%m\') , date_format(from_UNIXTIME(`pay_time`), \'%Y%m\')) =1 ')->group('user_id')->select();
        if ($uu) {
            foreach ($uu as $key => $item) {
                M('member')->where('id =' . $item['user_id'])->setField('uu_num', $item['num']);
            }
        }

        $travel = M('travel_order')->field('user_id, sum(y_num) as num')->where(' pay_status = 1 and  period_diff(date_format(now() , \'%Y%m\') , date_format(from_UNIXTIME(`pay_time`), \'%Y%m\')) =1')->group('user_id')->select();
        if ($travel) {
            foreach ($travel as $key => $item) {
                M('member')->where('id =' . $item['user_id'])->setField('travel_num', $item['num']);
            }
        }

        $member = M('member')->field('nickname,reid')->where(' ispay = 1 and  period_diff(date_format(now() , \'%Y%m\') , date_format(from_UNIXTIME(`pdt`), \'%Y%m\')) =1')->select();
        if ($member) {
            foreach ($member as $item) {
                M('member')->where('id =' . $item['reid'])->setInc('last_recount', 1);
            }
        }

        $member_list = M('member')->field('id, uu_num, travel_num, last_recount, repath, relevel, ulevel')->where('uu_num > 0 or travel_num > 0 or last_recount > 0')->order('id')->select();
        if ($member_list) {
            foreach ($member_list as $item) {
                $this->sysAdd($item['id'], $item['uu_num'], $item['travel_num'], $item['last_recount'], $item['repath'], $item['relevel']);
            }
        }
    }

    //框架生成uu册，旅游人数。直推人。
    public function sysAdd($source_id, $uu_num, $travel_num, $last_recount, $repath, $relevel)
    {
        $list = M('member')->field('id, ulevel')->where('(id in (0' . $repath . '0) or id = ' . $source_id . ') and ' . $relevel . '-relevel<=' . $relevel . ' and ulevel >=2 and ispay = 1')->order('id desc')->select();

        $pas = 1;
        foreach ($list as $value) {
            if ($value['ulevel'] > $pas) {
                $uu_num > 0 && M('member')->where('id =' . $value['id'])->setInc('sys_uu', $uu_num);
                $travel_num > 0 && M('member')->where('id =' . $value['id'])->setInc('sys_travel', $travel_num);
                $last_recount > 0 && M('member')->where('id =' . $value['id'])->setInc('sys_recount', $last_recount);
                $pas = $value['ulevel'];
            }
        }
    }

    //生成团队人力
    public function updateTeamCount()
    {
        $set['team_count'] = 0;

        M('member')->where('1=1')->save($set);

        $member_list = M('member')->field('id, repath, relevel, ulevel')->where('ispay > 0')->order('id')->select();
        if ($member_list) {
            foreach ($member_list as $item) {
                $this->sysAddTeamCount($item['repath'], $item['relevel'], $item['ulevel']);
            }
        }
    }

    public function sysAddTeamCount( $repath, $relevel, $ulevel)
    {
        $list = M('member')->field('id, ulevel')->where('id in (0' . $repath . '0)  and ' . $relevel . '-relevel<=' . $relevel . ' and ulevel >= '.$ulevel.' and ispay = 1')->order('id desc')->select();
        $pas = $ulevel;
        foreach ($list as $value) {
            if ($value['ulevel'] > $pas) {
                 M('member')->where('id =' . $value['id'])->setInc('team_count', 1);
                $pas = $value['ulevel'];
            }
        }
    }

    //个人下面的系统框架
    function downSys($id)
    {
        $result = array();

        $ulevel = M('member')->where('id = '.$id)->getField('ulevel');
        $users = M('member')->where('(repath like \'%,'. $id .',%\' or id = '.$id.') and ulevel <= '.$ulevel.' and ispay = 1')->order('id desc')->select();
        foreach ($users as $user) {
            $list = M('member')->field('id, ulevel')->where('(id in (0' . $user['repath'] . '0) or id = '.$id.')   and ' . $user['relevel'] . '-relevel <=' . $user['relevel'] . ' and ulevel >= '.$user['ulevel'].' and ispay = 1')->order('id desc')->select();
            $pas = 1;
            foreach ($list as $value) {

                if ($value['ulevel'] > $pas) {
                    if ($value['id'] == $id) {
                    	$result[] = $user;
                    }
                    $pas = $value['ulevel'];
                }
            }
        }

        return $result;
                
    }

    public function storeManageBonus()
    {

        $stores = M('store')->where('manage_active = 1 and pay_status = 1')->select();
        foreach ($stores as $store) {
            $store['last_time'] = $store['last_time'] == NUll ? $store['pay_time'] : $store['last_time'];
            $diff = timeDiff(strtotime(date('Y-m-d', $store['last_time'])), strtotime(date('Y-m-d')));
//            deductManage(strtotime(date('Y-m-d', $store['pay_time'])), $diff['day']);
            //扣除
            $num = 0;
            $cha = $diff['day'];
            if ($store['num'] < 12) {
            	$num = 12 - $store['num'];
                if ($diff['day'] <= $num) {
                	$cha = 0;
                } else {
                    $cha = $diff['day'] - $num;
                }
            }
            $storeLevel = M('store_level')->field('kou2, bonus2')->where('id =' . $store['st_level'])->find();
            $manageFree = $cha * $storeLevel['kou2'];
            $user = M('member')->field('store_bonus')->where('id =' . $store['user_id'])->find();
            if ($user['store_bonus'] >= $manageFree) {
                $cha > 0 && $this->Sys->b23manage($store['user_id'], $manageFree);
                //发奖
               $result = $this->Sys->b22bonus($store['user_id'], $storeLevel['bonus2'], $diff['day']);
                if ($result) {
                	M('store')->where('id =' . $store['id'])->setField('last_time', time());
                	M('store')->where('id =' . $store['id'])->setInc('num', 1);
                }
            }
        }
        $this->Sys->b0bonus();
        if ($result) {
            return true;
        }
    }

    public function storeUUsale()
    {
        $set['uu_num'] = 0;
        M('member')->where('isbd = 1')->save($set);

        $uu = M('order')->field('user_id, sum(goods_num) as num')->where('type = 4 and pay_status = 1  and  period_diff(date_format(now() , \'%Y%m\') , date_format(from_UNIXTIME(`pay_time`), \'%Y%m\')) =1 ')->group('user_id')->select();
        if ($uu) {
            foreach ($uu as $key => $item) {
                M('member')->where('id =' . $item['user_id'])->setField('uu_num', $item['num']);
            }
        }

        $this->Sys->b24bonus();
        $this->Sys->b0bonus();
    }


}