<?php
namespace Home\Controller;
use Think\Controller;
class OrderController extends BaseController {

    public function order_pay($order_sn,$type) {

        //测试
        update_pay_status($order_sn,$type);
        exit();

        if ($type=='travel' || I('type')=='travel') {
            $M=M('travel_order');
            I('order_sn') && $order_sn=I('order_sn');
            $order =$M->where('order_sn='.$order_sn)->find();
            $this->assign('order',$order);
            $this->assign('order_id',$order['id']);
        }else{
            $M=M('order');
            I('order_sn') && $order_sn=I('order_sn');
            $order =$M->where('order_sn='.$order_sn)->find();
            $this->assign('order',$order);
            $this->assign('order_id',$order['order_id']);
        }

        $this->assign('type',$type);
        $this->display('Order/order_pay');
    }




}
