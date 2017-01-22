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
     * @param $id
     * @param $amount
     */
    public function bonus3($id, $amount)
    {
        $user = M('member')->field('nickname,reid')->where('id =' . $id)->find();
        $reus_nickname = M('member')->where('id =' . $user['reid'])->getField('nickname');

        $b3 = $amount * 25 / 100;
        if ($b3 > 0) {
            $this->Member->where('id =' . $id)->setInc('b3', $b3);
            $beizhu = "游邮册销售提成";
            $this->bonus_laiyuan($id, $user['nickname'], $id, $user['nickname'], 3, $b3, $beizhu);
        }
    }

    /**
     * 游邮册推荐销售提成
     * @param $id
     * @param $amount
     */
    public function bonus4($id, $amount)
    {
        $user = M('member')->field('nickname,reid')->where('id =' . $id)->find();
        $reus_nickname = M('member')->where('id =' . $user['reid'])->getField('nickname');
        $b4 = $amount * 10 / 100;
        if ($b4 > 0) {
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
        $list = $this->Member->where('id in (0' . $repath . '0) and ' . $rel . '-relevel<=' . $rel . ' and ulevel > ' . $ulvel . ' and ispay = 1')->order('id desc')->select();
        $pas = $ulvel;
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
        $list = $this->Member->where('id in (0' . $repath . '0) and ' . $rel . '-relevel<=' . $rel . ' and ulevel > ' . $ulvel . ' and ispay = 1')->order('id desc')->select();
        $pas = $ulvel;
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
        $list = $this->Member->where('id in (0' . $repath . '0) and ' . $rel . '-relevel<=' . $rel . ' and ulevel > ' . $ulvel . ' and ispay = 1')->order('id desc')->select();
        $pas = $ulvel;
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
        $bonus = $this->Member->where('b1>0 or b2>0 or b3>0 or b4>0 or b5>0 or b6>0')->select();
        foreach ($bonus as $row) {
            $b1 = $row['b1'];
            $b2 = $row['b2'];
            $b3 = $row['b3'];
            $b4 = $row['b4'];
            $b5 = $row['b5'];
            $b6 = $row['b6'];
            $b7 = $row['b7'];
            $b8 = $row['b8'];
            $b0 = $b1 + $b2 + $b3 + $b4 + $b5 + $b6 + $b7 + $b8;

            $member_update['b0'] = 0;
            $member_update['b1'] = 0;
            $member_update['b2'] = 0;
            $member_update['b3'] = 0;
            $member_update['b4'] = 0;
            $member_update['b5'] = 0;
            $member_update['b6'] = 0;
            $member_update['b7'] = 0;
            $member_update['b8'] = 0;
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