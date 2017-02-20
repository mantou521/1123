<?php
namespace Common\Lib;

class System
{
    public $Member;
    public $Ulevel;  //系统架构

    function __construct()
    {
        $this->Member = M('member');
    }

    /**
     * 个人发展奖
     * @param $id           个人id
     * @param $nickname     个人工号
     * @param $reid         推荐人id
     * @param $user_level   个人保单级别
     */
    public function bonus1($id, $nickname, $reid, $user_level)
    {
        $reus = getMemberbyID($reid);
        $b1 = ($user_level == 1) ? 300 : 3500;
        if ($b1 > 0) {
            $this->Member->where('id =' . $reid)->setInc('b1', $b1);
            $beizhu = "个人发展奖";
            $this->bonus_laiyuan($reus['id'], $reus['nickname'], $id, $nickname, 1, $b1, $beizhu);
        }
    }

    /**
     * 系统发展奖
     * @param $repath               结构
     * @param $rel                  结构层级
     * @param $ulvel                用户系统级别
     * @param $user_level           报单级别
     * @param $source_id            id
     * @param $reid                 推荐人id
     * @param $source_nickname      工号
     */
    public function bonus2($repath, $rel, $ulvel, $user_level, $source_id, $source_nickname, $reid)
    {
        $list = $this->Member->where('id in (0' . $repath . '0) and ' . $rel . '-relevel<=' . $rel . ' and ulevel > ' . $ulvel . ' and ispay = 1')->order('id desc')->select();
        $pas = $ulvel;
        $sum = 0;
        foreach ($list as $value) {
            if ($value['ulevel'] > $pas) {
                $b2 = $this->getBonusByUlevel($value['ulevel'], $user_level) - $sum;

                if ($b2 > 0) {
                    $this->Member->where('id =' . $value['id'])->setInc('b2', $b2);
                    $note = "系统发展奖";
                    $this->bonus_laiyuan($value['id'], $value['nickname'], $source_id, $source_nickname, 2, $b2, $note);
                }
                $pas = $value['ulevel'];
                $sum = $b2;
            }
        }
    }

    /**
     * 自身为主管以上，应拿系统发展奖
     * @param $ulevel   系统级别
     * @param $user_level   保单级别
     * @return mixed    奖金和
     */
    private function bonus2Self($ulevel, $user_level)
    {
        $map['ulevel'] = array('between', array('2', $ulevel));
        return M('ulevel')->where($map)->sum('yl' . $user_level);
    }

    /**
     * @param $ulevel       系统级别
     * @param $user_level   报单级别------yl
     * @return mixed        奖金/百分比
     */
    public function getBonusByUlevel($ulevel, $user_level)
    {
        $Ulevel = D('Admin/Ulevel');
        $info = $Ulevel->getByUlevel($ulevel);
        return $info['yl' . $user_level];
    }

    /**
     * 个人uu册销售提成
     *
     * @param $id
     * @param $amount
     */
    public function bonus3($id, $amount)
    {
        $user = M('member')->field('nickname, reid, isbd, bdlevel')->where('id =' . $id)->find();
        $reus_nickname = M('member')->where('id =' . $user['reid'])->getField('nickname');

        $b3 = $amount * 25 / 100;
        if ($b3 > 0) {
            $this->Member->where('id =' . $id)->setInc('b3', $b3);
            $beizhu = "游邮册销售提成";
            $this->bonus_laiyuan($id, $user['nickname'], $id, $user['nickname'], 3, $b3, $beizhu);
        }

        if ($user['isbd'] == 1) {
        	$b18 = 10;
            $this->Member->where('id =' . $id)->setInc('b18', $b18);
            $beizhu = "开店报单奖";
            $this->bonus_laiyuan($id, $user['nickname'], $id, $user['nickname'], 18, $b18, $beizhu);

            $b19 = M('store_level')->where('id =' . $user['bdlevel'])->getField('bonus1');
            $this->Member->where('id =' . $id)->setInc('b19', $b19);
            $beizhu = "开店级别奖";
            $this->bonus_laiyuan($id, $user['nickname'], $id, $user['nickname'], 19, $b19, $beizhu);
        }
    }

    /**
     * 游邮册推荐销售提成
     *
     * @param $id
     * @param $amount
     */
    public function bonus4($id, $amount)
    {
        $user = M('member')->field('nickname,reid')->where('id =' . $id)->find();
        $reus_nickname = M('member')->where('id =' . $user['reid'])->getField('nickname');
        $b4 = $amount * 10 / 100;
        if ($b4 > 0 && $reus_nickname) {
            $this->Member->where('id =' . $user['reid'])->setInc('b4', $b4);
            $beizhu = "游邮册推荐销售提成";
            $this->bonus_laiyuan($user['reid'], $reus_nickname, $id, $user['nickname'], 4, $b4, $beizhu);
        }
    }

    /**
     * UU册销售管理奖
     * @param $repath               结构
     * @param $rel                  结构层级
     * @param $ulvel                用户系统级别
     * @param $source_id            id
     * @param $source_nickname      工号
     * @param $reid                 推荐人id
     * @param $amount               UU册金额
     */
    public function bonus5($repath, $rel, $ulvel, $source_id, $source_nickname, $reid, $amount)
    {
        $list = $this->Member->where('(id in (0' . $repath . '0) or id = ' . $source_id . ') and ' . $rel . '-relevel<=' . $rel . ' and ulevel >=2 and ispay = 1')->order('id desc')->select();
        $pas = 1;
        $sum = 0;
        foreach ($list as $value) {
            if ($value['ulevel'] > $pas) {
                $rate = $this->getBonusByUlevel($value['ulevel'], 3) - $sum;
                $b5 = $amount * $rate / 100;

                if ($b5 > 0) {
                    $this->Member->where('id =' . $value['id'])->setInc('b5', $b5);
                    $note = "UU册销售管理奖";
                    $this->bonus_laiyuan($value['id'], $value['nickname'], $source_id, $source_nickname, 5, $b5, $note);
                }
                $pas = $value['ulevel'];
                $sum = $rate;
            }
        }
    }

    public function bonus21($repath, $rel, $source_id, $source_nickname)
    {
        $data = [
            '1' => '15',
            '2' => '10',
            '3' => '5'
        ];

        $list = $this->Member->where(' id in (0' . $repath . '0)  and ' . $rel . '-relevel<= 3  and ispay = 1')->order('id desc')->select();
        foreach ($list as $value) {
            $cha = $rel - $value['relevel'];
            if ($cha == 1) {
                $bonus = $data[$cha];
            } elseif ($cha > 1 && $value['isbd'] == 1) {
                $bonus = $data[$cha];
            }
            if ($bonus > 0) {
                $this->Member->where('id =' . $value['id'])->setInc('b21', $bonus);
                $note = $cha . "代开店报单奖";
                $this->bonus_laiyuan($value['id'], $value['nickname'], $source_id, $source_nickname, 21, $bonus, $note);
            }

        }
    }

    /**
     * 个人合作商业务提成
     * @param $id
     * @param $total
     * @param $num      人数
     */
    public function bonus6($id, $total, $num)
    {
        $nickname = $this->Member->where('id =' . $id)->getField('nickname');
        $b6 = ($total - 1000) * 8 / 100 * $num;
        if ($b6 > 0) {
            $this->Member->where('id =' . $id)->setInc('b6', $b6);
            $note = "合作商业务提成";
            $this->bonus_laiyuan($id, $nickname, $id, $nickname, 6, $b6, $note);
        }
    }

    /**
     * 合作商业务管理奖
     * @param $repath               结构
     * @param $rel                  结构层级
     * @param $ulvel                用户系统级别
     * @param $source_id            id
     * @param $source_nickname      工号
     * @param $reid                 推荐人id
     * @param $amount               UU册金额
     * @param $num                  人数
     */
    public function bonus7($repath, $rel, $ulvel, $source_id, $source_nickname, $reid, $amount, $num)
    {
        $list = $this->Member->where('(id in (0' . $repath . '0) or id = ' . $source_id . ') and ' . $rel . '-relevel<=' . $rel . ' and ulevel >=2 and ispay = 1')->order('id desc')->select();
        $pas = 1;
        $sum = 0;
        foreach ($list as $value) {
            if ($value['ulevel'] > $pas) {
                $rate = $this->getBonusByUlevel($value['ulevel'], 4) - $sum;
                $b5 = ($amount - 1000) * $rate / 100 * $num;

                if ($b5 > 0) {
                    $this->Member->where('id =' . $value['id'])->setInc('b6', $b5);
                    $note = "合作商业务管理奖";
                    $this->bonus_laiyuan($value['id'], $value['nickname'], $source_id, $source_nickname, 6, $b5, $note);
                }
                $pas = $value['ulevel'];
                $sum = $rate;
            }
        }
    }

    /**
     * 个人销售旅游提成
     * @param $id
     * @param $profit   利润
     * @param $num      人数
     */
    public function bonus8($id, $profit, $num)
    {
        $nickname = $this->Member->where('id =' . $id)->getField('nickname');
        $b6 = $profit * 35 / 100 * $num;
        if ($b6 > 0) {
            $this->Member->where('id =' . $id)->setInc('b8', $b6);
            $note = "个人旅游销售提成";
            $this->bonus_laiyuan($id, $nickname, $id, $nickname, 8, $b6, $note);
        }
    }

    /**
     * 销售旅游管理奖
     * @param $repath               结构
     * @param $rel                  结构层级
     * @param $ulvel                用户系统级别
     * @param $source_id            id
     * @param $source_nickname      工号
     * @param $reid                 推荐人id
     * @param $profit               单人利润
     * @param $num                  人数
     */
    public function bonus9($repath, $rel, $ulvel, $source_id, $source_nickname, $reid, $profit, $num)
    {
        $list = $this->Member->where('(id in (0' . $repath . '0) or id = ' . $source_id . ') and ' . $rel . '-relevel<=' . $rel . ' and ulevel >=2 and ispay = 1')->order('id desc')->select();
        $pas = 1;
        $sum = 0;
        foreach ($list as $value) {
            if ($value['ulevel'] > $pas) {
                $rate = $this->getBonusByUlevel($value['ulevel'], 5) - $sum;
                $b5 = $profit * $rate / 100 * $num;

                if ($b5 > 0) {
                    $this->Member->where('id =' . $value['id'])->setInc('b9', $b5);
                    $note = "销售旅游管理奖";
                    $this->bonus_laiyuan($value['id'], $value['nickname'], $source_id, $source_nickname, 9, $b5, $note);
                }
                $pas = $value['ulevel'];
                $sum = $rate;
            }
        }
    }

    /**
     * 个人达成奖
     *
     * 个人超额奖
     */
    public function bonus10()
    {
        $list = $this->Member->field('id, nickname, uu_num, travel_num, last_recount')->where('ispay = 1')->select();
        if ($list) {
            foreach ($list as $item) {
                $total = $item['uu_num'] + $item['travel_num'] + $item['last_recount'];
                if ($total >= 40) {
                    $bonus = 1000;
                    if ($bonus > 0) {
                        $this->Member->where('id =' . $item['id'])->setInc('b12', $bonus);
                        $note = "个人超额奖";
                        $this->bonus_laiyuan($item['id'], $item['nickname'], $item['id'], $item['nickname'], 12, $bonus, $note);
                    }
                }
                if ($total >= 20) {
                    $bonus = 500;
                    if ($bonus > 0) {
                        $this->Member->where('id =' . $item['id'])->setInc('b10', $bonus);
                        $note = "个人达成奖";
                        $this->bonus_laiyuan($item['id'], $item['nickname'], $item['id'], $item['nickname'], 10, $bonus, $note);
                    }
                }
            }
        }
    }

    /**
     * 系统达成奖
     *
     * 系统超额奖
     */
    public function bonus11()
    {
        $list = $this->Member->field('id, ulevel, nickname, sys_uu, sys_travel, sys_recount')->where(' ulevel > 1 and ispay = 1')->order('id')->select();
        if ($list) {
            foreach ($list as $item) {
                $num = $item['sys_uu'] + $item['sys_travel'] + $item['sys_recount'];

                if ($num >= 200) {
                    $ulevelList = M('ulevel')->field('ulevel, yl9, yl10, yl11')->where('ulevel > 1')->order('ulevel')->select();
                    foreach ($ulevelList as $value) {
                        if ($num >= $value['yl9'] && $item['ulevel'] >= $value['ulevel']) {
                            $bonus = $value['yl10'];
                            if ($bonus > 0) {
                                $this->Member->where('id =' . $item['id'])->setInc('b13', $bonus);
                                $note = "系统超额奖";
                                $this->bonus_laiyuan($item['id'], $item['nickname'], $item['id'], $item['nickname'], 13, $bonus, $note);
                            }
                        }
                    }
                }

                if ($num >= 100) {
                    $ulevelList = M('ulevel')->field('ulevel, yl6, yl7, yl8')->where('ulevel > 1')->order('ulevel')->select();
                    foreach ($ulevelList as $value) {
                        if ($num >= $value['yl6'] && $item['ulevel'] >= $value['ulevel']) {
                            $bonus = $value['yl7'];
                            if ($bonus > 0) {
                                $this->Member->where('id =' . $item['id'])->setInc('b11', $bonus);
                                $note = "系统达成奖";
                                $this->bonus_laiyuan($item['id'], $item['nickname'], $item['id'], $item['nickname'], 11, $bonus, $note);
                            }
                        }
                    }
                }
            }
        }
    }

    //平级育成绩效奖(uu)
    public function bonus14()
    {
        $uuList = M('order')->where('type = 4 and pay_status = 1 and is_use = 0  and  period_diff(date_format(now() , \'%Y%m\') , date_format(from_UNIXTIME(`pay_time`), \'%Y%m\')) =1')->order('pay_time')->select();
        foreach ($uuList as $item) {
            $user = $this->Member->field('repath, relevel, ulevel, id, nickname, reid')->where('ulevel >1 and id =' . $item['user_id'])->find();
            if ($user) {
                $userFather = $this->Member->field('ulevel, id, nickname')->where('id =' . $user['reid'])->find();
                if ($userFather && $userFather['ulevel'] == $user['ulevel']) {
                    $userList = $this->Member->where('id in (0' . $user['repath'] . '0) and ' . $user['relevel'] . '-relevel<= 3 and ulevel = ' . $user['ulevel'] . ' and ispay = 1')->order('id desc')->select();
                    if ($userList) {
                        $nowLevel = $user['ulevel'];
                        foreach ($userList as $value) {
                            if ($value['ulevel'] == $nowLevel) {
                                $cha = $user['relevel'] - $value['relevel'];
                                if ($cha == 3) {
                                    $bonus = 5;
                                } elseif ($cha == 2) {
                                    $bonus = 10;
                                } elseif ($cha == 1) {
                                    $bonus = 15;
                                }
                                $bonus = $bonus * $item['goods_num'];
                                if ($bonus > 0) {
                                    $this->Member->where('id =' . $value['id'])->setInc('b14', $bonus);
                                    $note = "A平级育成绩效奖";
                                    $this->bonus_laiyuan($value['id'], $value['nickname'], $user['id'], $user['nickname'], 14, $bonus, $note);

                                    M('order')->where('order_id =' . $item['order_id'])->setField('is_use', 1);
                                }
                                $nowLevel = $value['ulevel'];
                            }
                        }
                    }
                } elseif ($userFather && $userFather['ulevel'] < $user['ulevel']) {
                    $bonus = 10 * $item['goods_num'];
                    if ($bonus > 0) {
                        $this->Member->where('id =' . $userFather['id'])->setInc('b16', $bonus);
                        $note = "A超越育成绩效奖";
                        $this->bonus_laiyuan($userFather['id'], $userFather['nickname'], $user['id'], $user['nickname'], 16, $bonus, $note);

                        M('order')->where('order_id =' . $item['order_id'])->setField('is_use', 1);
                    }
                }
            }
        }
    }

    //平级B育成发展奖(uu)
    public function bonus15()
    {
        $memberUp = M('ulevelup')->where('status = 1 and is_use = 0 and  period_diff(date_format(now() , \'%Y%m\') , date_format(from_UNIXTIME(`datetime`), \'%Y%m\')) =1')->select();
        foreach ($memberUp as $item) {
            $user = $this->Member->field('repath, relevel, ulevel, id, nickname, reid')->where('ulevel > 1 and id =' . $item['userid'])->find();
            if ($user) {
                $userFather = $this->Member->field('ulevel, id, nickname')->where('id =' . $user['reid'])->find();
                if ($userFather && $userFather['ulevel'] == $user['ulevel']) {
                    $userList = $this->Member->field('ulevel, relevel, id, nickname')->where('id in (0' . $user['repath'] . '0) and ' . $user['relevel'] . '-relevel<= 3 and ispay = 1')->order('id desc')->select();
                    if ($userList) {
                        $nowLevel = $user['ulevel'];

                        foreach ($userList as $value) {
                            if ($value['ulevel'] == $nowLevel) {

                                $cha = $user['relevel'] - $value['relevel'];
                                if ($cha == 3) {
                                    $bonus = 5;
                                } elseif ($cha == 2) {
                                    $bonus = 10;
                                } elseif ($cha == 1) {
                                    $bonus = 15;
                                }
                                if ($bonus > 0) {
                                    $this->Member->where('id =' . $value['id'])->setInc('b15', $bonus);
                                    $note = "B平级育成发展奖";
                                    $this->bonus_laiyuan($value['id'], $value['nickname'], $user['id'], $user['nickname'], 15, $bonus, $note);

                                    M('ulevelup')->where('uid =' . $item['uid'])->setField('is_use', 1);
                                }
                                $nowLevel = $value['ulevel'];

                            }
                        }
                    }
                } elseif ($userFather && $userFather['ulevel'] < $user['ulevel']) {
                    $bonus = 10;
                    if ($bonus > 0) {
                        $this->Member->where('id =' . $userFather['id'])->setInc('b17', $bonus);
                        $note = "B超越育成发展奖";
                        $this->bonus_laiyuan($userFather['id'], $userFather['nickname'], $user['id'], $user['nickname'], 17, $bonus, $note);

                        M('ulevelup')->where('uid =' . $item['uid'])->setField('is_use', 1);
                    }
                }
            }
        }
    }

    public function bonus20($user_id, $store_level, $st_type)
    {
        $total = M('store_level')->where('id =' . $store_level)->getField('free');
        $user = M('member')->field('nickname, reid')->where('id =' . $user_id)->find();
        $userFather = M('member')->field('nickname, id')->where('id =' . $user['reid'])->find();
        $bai = [
            '1' => 1,
            '2' => 0.8
        ];
        $b20 = $total * $bai[$st_type] * 0.1;
        if ($b20 > 0) {
            $this->Member->where('id =' . $userFather['id'])->setInc('b20', $b20);
            $note = "开店推荐奖";
            $this->bonus_laiyuan($userFather['id'], $userFather['nickname'], $user_id, $user['nickname'], 20, $b20, $note);
        }
    }

    public function b22bonus($user_id, $bonus, $num)
    {
        $nickname = $this->Member->where('id =' . $user_id)->getField('nickname');
        $bonus = $bonus * $num;
        if ($bonus > 0) {
            $this->Member->where('id =' . $user_id)->setInc('b22', $bonus);
            $note = "店铺租金支持";
            $this->bonus_laiyuan($user_id, $nickname, $user_id, $nickname, 22, $bonus, $note);
            return true;
        }
    }

    public function b23manage($user_id, $manageFree)
    {
        $nickname = $this->Member->where('id =' . $user_id)->getField('nickname');
        if ($manageFree > 0) {
            $this->Member->where('id =' . $user_id)->setDec('store_bonus', $manageFree);
            $note = "管理费";
            $this->bonus_laiyuan($user_id, $nickname, $user_id, $nickname, 23, $manageFree, $note);
        }
    }


    public function b24bonus()
    {
        $list = $this->Member->field('id, nickname, uu_num, bdlevel')->where('ispay = 1 and isbd = 1')->select();
        if ($list) {
            foreach ($list as $item) {
                $total = $item['uu_num'];
                $storeLevel = M('store_level')->where('id =' . $item['bdlevel'])->find();
                if ($total >= $storeLevel['y3']) {
                    $bonus = $storeLevel['bonus3'];
                    if ($bonus > 0) {
                        $this->Member->where('id =' . $item['id'])->setInc('b24', $bonus);
                        $note = "UU册销售达成奖";
                        $this->bonus_laiyuan($item['id'], $item['nickname'], $item['id'], $item['nickname'], 24, $bonus, $note);
                    }
                }

                $more = $total - $storeLevel['y3'];
                if ($more > 0) {
                    $bonus = $more * $storeLevel['bonus4'];
                    if ($bonus > 0) {
                        $this->Member->where('id =' . $item['id'])->setInc('b25', $bonus);
                        $note = "UU册销售超额奖";
                        $this->bonus_laiyuan($item['id'], $item['nickname'], $item['id'], $item['nickname'], 25, $bonus, $note);
                    }
                }
            }
        }
    }

    /**
     * 封顶
     * @param $id
     * @param $num
     * @param $overflow
     * @param $bonus
     * @return mixed
     */
    public function overflow($id, $num, $overflow, $bonus)
    {
        $sumBonus = M('bonus')->where('user_id =' . $id)->sum($num);
        $mey = $overflow - $sumBonus;
        if ($bonus <= $mey) {
            if ($bonus > 0) {
                return $bonus;
            }
        } elseif ($bonus > $mey) {
            if ($mey >= 0) {
                return $mey;
            }
        }
    }

    /**
     * 自身为主管以上，应拿UU册销售管理奖
     * @param $ulevel   系统级别
     * @return mixed    奖金百分比
     */
    private function bonus5Self($ulevel)
    {
        $map['ulevel'] = array('between', array('2', $ulevel));
        return M('ulevel')->where($map)->sum('yl3');
    }

    /**
     * 添加奖金明细
     * @param $uid
     * @param $nickname
     * @param $source_id
     * @param $source_nickname
     * @param $lx
     * @param $jine
     * @param $notes
     */
    public function bonus_laiyuan($uid, $nickname, $source_id, $source_nickname, $lx, $jine, $notes)
    {
        $bonuslaiyuan = NULL;
        $bonuslaiyuan ['uid'] = $uid;
        $bonuslaiyuan ['nickname'] = $nickname;
        $bonuslaiyuan ['source_id'] = $source_id;
        $bonuslaiyuan ['source_nickname'] = $source_nickname;
        $bonuslaiyuan ['lx'] = $lx;
        $bonuslaiyuan ['jine'] = $jine;
        $bonuslaiyuan ['date'] = time();
        $bonuslaiyuan ['notes'] = $notes;
        M('bonus_log')->add($bonuslaiyuan);
    }

    /**
     * 奖金汇总
     */
    function b0bonus()
    {
        $bonus = $this->Member->where('b1>0 or b2>0 or b3>0 or b4>0 or b5>0 or b6>0 or b7>0 or b8>0 or b9>0 or b10>0 or b11>0 or b12>0 or b13>0 or b14>0 or b15>0 or b16>0 or b17>0 or b18>0 or b19>0 or b20>0 or b21>0 or b22>0 or b23>0 or b24>0 or b25>0')->select();
        foreach ($bonus as $row) {
            $b1 = $row['b1'];
            $b2 = $row['b2'];
            $b3 = $row['b3'];
            $b4 = $row['b4'];
            $b5 = $row['b5'];
            $b6 = $row['b6'];
            $b7 = $row['b7'];
            $b8 = $row['b8'];
            $b9 = $row['b9'];
            $b10 = $row['b10'];
            $b11 = $row['b11'];
            $b12 = $row['b12'];
            $b13 = $row['b13'];
            $b14 = $row['b14'];
            $b15 = $row['b15'];
            $b16 = $row['b16'];
            $b17 = $row['b17'];
            $b18 = $row['b18'];
            $b19 = $row['b19'];
            $b20 = $row['b20'];
            $b21 = $row['b21'];
            $b22 = $row['b22'];
            $b23 = $row['b23'];
            $b24 = $row['b24'];
            $b25 = $row['b25'];

            $b0 = $b1 + $b2 + $b3 + $b4 + $b5 + $b6 + $b7 + $b8 + $b9 + $b10 + $b11 + $b12 + $b13 + $b14 + $b15 + $b16 + $b17 ;
            $storeBonus =  $b18 + $b19 + $b20 + $b21 + $b22 + $b24 + $b25;

            $member_update['b0'] = 0;
            $member_update['b1'] = 0;
            $member_update['b2'] = 0;
            $member_update['b3'] = 0;
            $member_update['b4'] = 0;
            $member_update['b5'] = 0;
            $member_update['b6'] = 0;
            $member_update['b7'] = 0;
            $member_update['b8'] = 0;
            $member_update['b9'] = 0;
            $member_update['b10'] = 0;
            $member_update['b11'] = 0;
            $member_update['b12'] = 0;
            $member_update['b13'] = 0;
            $member_update['b14'] = 0;
            $member_update['b15'] = 0;
            $member_update['b16'] = 0;
            $member_update['b17'] = 0;
            $member_update['b18'] = 0;
            $member_update['b19'] = 0;
            $member_update['b20'] = 0;
            $member_update['b21'] = 0;
            $member_update['b22'] = 0;
            $member_update['b23'] = 0;
            $member_update['b24'] = 0;
            $member_update['b25'] = 0;
            $member_update['cfxf'] = $row['cfxf'] + $b23;
            $member_update['store_bonus'] = $row['store_bonus'] + $storeBonus;
            $member_update['max_store_bonus'] = $row['max_store_bonus'] + $storeBonus;
            $member_update['mey'] = $row['mey'] + $b0;
            $member_update['maxmey'] = $row['maxmey'] + $b0;
            $this->Member->where('id =' . $row['id'])->save($member_update);

            $bonus_update['user_id'] = $row['id'];
            $bonus_update['b0'] = $b0;
            $bonus_update['b1'] = $b1;
            $bonus_update['b2'] = $b2;
            $bonus_update['b3'] = $b3;
            $bonus_update['b4'] = $b4;
            $bonus_update['b5'] = $b5;
            $bonus_update['b6'] = $b6;
            $bonus_update['b7'] = $b7;
            $bonus_update['b8'] = $b8;
            $bonus_update['b9'] = $b9;
            $bonus_update['b10'] = $b10;
            $bonus_update['b11'] = $b11;
            $bonus_update['b12'] = $b12;
            $bonus_update['b13'] = $b13;
            $bonus_update['b14'] = $b14;
            $bonus_update['b15'] = $b15;
            $bonus_update['b16'] = $b16;
            $bonus_update['b17'] = $b17;
            $bonus_update['b18'] = $b18;
            $bonus_update['b19'] = $b19;
            $bonus_update['b20'] = $b20;
            $bonus_update['b21'] = $b21;
            $bonus_update['b22'] = $b22;
            $bonus_update['b23'] = $b23;
            $bonus_update['b24'] = $b24;
            $bonus_update['b25'] = $b25;
            $this->bonus_insert($bonus_update);
        }
//        $_systemyeji->yejitongji(0, 0, 0, $lj, 0, 0, 0);
    }

    /**
     * 奖金总表
     * @param $_bonus
     */
    function bonus_insert($_bonus)
    {
        $_bonus ['date'] = time();
        M('bonus')->add($_bonus);
    }


    function yejitongji($xzhy, $xzdan, $xzyj, $ff, $tx, $cz, $dd)
    {
        $y = date("Y");
        $m = date("m");
        $d = date("d");
        $sql = "SELECT * FROM `systemyeji` WHERE year(ydate)=" . $y . " and month(ydate)=" . $m . " and day(ydate)=" . $d . "";
        $query = mysql_query($sql);
        if ($_systemyeji = mysql_fetch_array($query)) {
            $systemyeji_update['xzhy'] = $_systemyeji['xzhy'] + $xzhy;
            $systemyeji_update['zhy'] = $_systemyeji['zhy'] + $xzhy;
            $systemyeji_update['xzdan'] = $_systemyeji['xzdan'] + $xzdan;
            $systemyeji_update['zdan'] = $_systemyeji['zdan'] + $xzdan;
            $systemyeji_update['xzyj'] = $_systemyeji['xzyj'] + $xzyj;
            $systemyeji_update['zyj'] = $_systemyeji['zyj'] + $xzyj;
            $systemyeji_update['ff'] = $_systemyeji['ff'] + $ff;
            $systemyeji_update['zff'] = $_systemyeji['zff'] + $ff;
            $systemyeji_update['tx'] = $_systemyeji['tx'] + $tx;
            $systemyeji_update['cz'] = $_systemyeji['cz'] + $cz;
            $systemyeji_update['dd'] = $_systemyeji['dd'] + $dd;
            edit_update_cl('systemyeji', $systemyeji_update, $_systemyeji['id']);
        } else {
            $sql = "SELECT * FROM `systemyeji`";
            $query = mysql_query($sql);
            if (mysql_num_rows($query) >= 1) {
                $sql1 = "SELECT sum(xzhy),sum(xzdan),sum(xzyj),sum(ff) FROM `systemyeji`";
                $query1 = mysql_query($sql1);
                $zzz = mysql_fetch_array($query1);
            } else {
                $zzz = array(0, 0, 0, 0);
            }
            $_systemyeji['ydate'] = now();
            $_systemyeji['xzhy'] = $xzhy;
            $_systemyeji['zhy'] = $xzhy + $zzz[0];
            $_systemyeji['xzdan'] = $xzdan;
            $_systemyeji['zdan'] = $xzdan + $zzz[1];
            $_systemyeji['xzyj'] = $xzyj;
            $_systemyeji['zyj'] = $xzyj + $zzz[2];
            $_systemyeji['ff'] = $ff;
            $_systemyeji['zff'] = $ff + $zzz[3];
            $_systemyeji['tx'] = $tx;
            $_systemyeji['cz'] = $cz;
            $_systemyeji['dd'] = $dd;
            add_insert_cl('systemyeji', $_systemyeji);
        }
    }


}