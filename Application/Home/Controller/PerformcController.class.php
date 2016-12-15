<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/8/25
 * Time: 11:59
 */
namespace Home\Controller;
use Think\Controller;
class PerformcController extends Controller {
    public function uu_pc(){
        $index=R("Index","hello");
        $Data     = M('Data');// 实例化Data数据模型
        $result     = $Data->find(1);
        $this->assign('result',$result);
        $this->display();
    }
    public function travel_pc(){
        $this->display();
    }
    public function recommend_pc(){
        $this->display();
    }


}