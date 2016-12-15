<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/8/25
 * Time: 10:18
 */

namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller{
    public function index_left(){
        $User=M('member');
        print_r($_SESSION);
        $mem=$User->where('id='.$_SESSION['id']);
        $this->assign('result','asdfasdfsdf');
        $this->display();
    }
}