<?php
namespace Admin\Controller;

use Think\Controller;

class UuOrdersController extends BaseController
{
    public function index()
    {
        $M = M('order');
        $list = $M->join('think_goods G on G.goods_id = think_order.goods_id')->field('G.goods_name,G.goods_id,think_order.*,FROM_UNIXTIME( `pay_time` , \'%Y-%m-%d \' ) AS t')->where('type = 4')->select();
        foreach ($list as $value) {
            $value['nickname'] = M('member')->where('id = ' . $value['user_id'])->getField('nickname');
            $orders[] = $value;
        }
        $this->assign('list', $orders);
        $this->assign('title', 'UU订单');
        $this->display();
    }

    public function edit()
    {
        $order = M('order')->where('order_sn =' . I('order_sn'))->find();
        $goods = M('goods')->where('goods_id =' . $order['goods_id'])->find();
        $this->assign('goods', $goods);
        $this->assign('order', $order);
        $this->display();
    }

    public function update()
    {
        $order = M('order')->where('order_sn =' . I('order_sn'))->find();

        $add['goods_sn'] = implode(',',array_filter(explode(',' ,I('goods_sn'))));
        $add['goods_id'] = $order['goods_id'];
        $add['time'] = time();
        $add['goods_num'] = count(array_filter(explode(',', I('goods_sn'))));
        $add['user_id'] = I('user_id');
        $exit=M('uukucun')->where(array('user_id'=>$add['user_id'],'goods_id'=>$add['goods_id']))->find();
        if ($exit) {
            $add['goods_sn']=joinCoding($exit['goods_sn'],$add['goods_sn']);
            $add['goods_num']+=$exit['goods_num'];
            $result = M('uukucun')->where('id='.$exit['id'])->save($add);
        } else {
            $result = M('uukucun')->add($add);
        }

        M('order')->where('order_sn =' . I('order_sn'))->setField('goods_sn', $add['goods_sn']);

        if ($result) {
            $this->success('添加成功',U('Admin/UuOrders/index'));
        }
    }
}