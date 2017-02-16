<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/8/25
 * Time: 10:18
 */

namespace Home\Controller;

use Think\Controller;

class BonusController extends BaseController
{
    public function bill()
    {
//        my_scandir('D:\htdocs\uufx\Public\Home\images\upload'); //遍历当前目录

        $user = M('member')->field('mey, maxmey')->where('id =' . session('id'))->find();
        $count = M('bonus_log')->field('*, FROM_UNIXTIME( `date` , \'%Y-%m-%d %h:%i:%s\' ) AS t')->where('uid =' . session('id'))->order('id desc')->count();
        $Page = new \Think\Page($count, 10);
        $show = $Page->show();
        $bonusList = M('bonus_log')->field('*, FROM_UNIXTIME( `date` , \'%Y-%m-%d %h:%i:%s\' ) AS t')->where('uid =' . session('id'))->limit($Page->firstRow . ',' . $Page->listRows)->order('id desc')->select();
        $this->assign('user', $user);
        $this->assign('list', $bonusList);
        $this->assign('page', $show);
        $this->assign('yetotal', $count);
        $this->display();
    }

    public function storeBonus()
    {

        $this->display();
    }
}