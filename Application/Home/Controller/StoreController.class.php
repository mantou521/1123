<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/8/25
 * Time: 10:18
 */

namespace Home\Controller;
use Think\Controller;
class StoreController extends BaseController{

    public function store_info(){
        $User=M('member');
        $mem=$User->table('think_store S')
            ->join('think_member M on S.user_id=M.id')
            ->join('think_store_level L on S.st_level=L.slevel')
            ->field('S.*,L.*,M.username,M.nickname')
            ->where('M.id='.$_SESSION['id'])
            ->find();
        $this->assign('user',$mem);
        $St=M('store_level');
        $level=$St->field('slevel,sname,free')->select();
        $this->assign('level',$level);
        $this->display();
    }
/*
 * 店铺升级
 * */
    public function store_up()
    {
        $User=M('member');
        $mem=$User->table('think_store S')
            ->join('think_member M on S.user_id=M.id')
            ->join('think_store_level L on S.st_level=L.slevel')
            ->field('S.*,L.*,M.username,M.nickname')
            ->where('M.id='.I('userid'))
            ->find();
        $aim=getStorebyID(I('uplevel'));
        //更新店铺信息
        $store['st_level']=I('uplevel');
        
        //添加升级记录
        $select['user_id']=I('userid');
        $select['level']=$mem['slevel'];
        $select['tolevel']=I('uplevel');
        $select['pay_status']=0;
        $data['user_id']=I('userid');
        $data['level']=$mem['slevel'];
        $data['order_sn']=build_order_no();
        $data['tolevel']=I('uplevel');
        $data['date']=time();
        $data['cha']=$aim['free']-$mem['free'];
        $data['pay_type']=I('type');
        $data['pay_status']=0;
        $Storeup=M('storeup_record');
        $count=$Storeup->where($select)->count();
        if ($count>0) {
        	echo json_encode('false');
        }else{
            $Storeup->add($data);
            $order['order_sn']=$data['order_sn'];
            $order['total']=$data['cha'];
            $order['add_time']=$data['date'];
            $order['user_id']=$_SESSION['id'];
            $order['type']=5;
            M('order')->add($order);
            echo json_encode($data['order_sn']);
        }

    }
/*
 * 线下支付
 * */
    public function open_offline()
    {
        $M=M('storeup_record');
        $re_id=$M->field('id')->where('user_id='.session('id'))->order('id desc')->find();
        $this->assign('orderid',$re_id['id']);
        $this->display();
    }
/*
 *线下订单
 *  */
    public function offline_order()
    {
        if (I('type')=='update') {
        	$M=M('storeup_record');
            $re_id=$M->field('id')->where('user_id='.session('id'))->order('id desc')->limit('1')->find();
           $data['img']=upload_pingzheng_pic($_FILES["img"]["tmp_name"]);
            $M->where('id='.$re_id['id'])->save($data);

            $this->success('提交成功', U('Home/Store/store_info'));
        }else{
            $M=M('store');
            $re_id=$M->field('id')->where('user_id='.session('id'))->order('id desc')->find();
            $data['pay_img']=upload_pingzheng_pic($_FILES["img"]["tmp_name"]);
            $M->where('id='.$re_id['id'])->save($data);
            $this->success('提交成功', U('Home/Member/store'));
        }
    }

}