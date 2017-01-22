<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/26
 * Time: 11:04
 */
namespace Admin\Controller;

use Think\Controller;

class TravelController extends BaseController
{
    public function travel_list()
    {
        $G = M('travel');
        $goods = $G->where('tr_id>0')->select();
        $this->assign('goods', $goods);
        $this->assign('title', "旅游");
        $this->display();
    }

    /*添加商品*/
    public function travel_add()
    {
        $_SESSION['webupload'] = NULL;
        $this->display();
    }

    public function travel_add_post()
    {
        $data = I();
        $data['tr_content'] = htmlspecialchars_decode(I('travel_content'));
        $data['thumb'] = upload_travel($_FILES["pic"]["tmp_name"], 1);
        $Goods = M('travel');
        $Goods->add($data);
        $this->success('添加成功', U('Admin/Travel/travel_list'));
    }

    /*
     * 修改商品
    */
    public function travel_edit()
    {
        $good = M('travel')->where('tr_id=' . I('tr_id'))->find();
        $this->assign('good', $good);
        $this->display();
    }

    public function travel_edit_post()
    {
        $data = NULL;
        $data = I();
        $data['tr_content'] = htmlspecialchars_decode(I('travel_content'));
        $_FILES["pic"]["error"] == 0 && $data['thumb'] = upload_travel($_FILES["pic"]["tmp_name"], 1);
        $Goods = M('travel');
        $Goods->where('tr_id=' . I('tr_id'))->save($data);
        $this->success('修改成功', U('Admin/Travel/travel_list'));
    }

    /*
     * 删除商品
     * */
    public function product_delete()
    {
        M('travel')->where('tr_id=' . I('id'))->delete();
    }

    /*旅游报单*/
    public function travel_order()
    {
        $M = M('travel_order');
        $list = $M->join('think_travel T on T.tr_id=think_travel_order.tr_id')->field('T.tr_name,T.thumb,think_travel_order.*,FROM_UNIXTIME( `time` , \'%Y-%m-%d \' ) AS t')->select();
        $this->assign('list', $list);
        $this->display();
    }

    public function order_edit()
    {
        $M = M('travel_order');
        $list = $M->join('think_travel T on T.tr_id=think_travel_order.tr_id')->field('T.tr_name,T.thumb,think_travel_order.*,FROM_UNIXTIME( `time` , \'%Y-%m-%d \' ) AS t')->where('order_sn=' . I('order_sn'))->find();

        $this->assign('list', $list);
        $this->display();
    }

    public function order_post()
    {
        $save['total'] = I('total');
        $save['reback'] = 1;
        $save['time'] = strtotime(I('time'));
        $save['remark'] = htmlspecialchars_decode(I('content'));
        M('travel_order')->where('order_sn=' . I('order_sn'))->save($save);
        $this->success('修改成功', U('Admin/Travel/travel_order'));
    }

    /*报团人*/
    public function travel_user()
    {
        $M = M('travel_order');
        $users = M('travel_user')->where('order_id=' . I('order_sn'))->select();
        $this->assign('users', $users);
        $this->display();
    }

    /**
     * 合作商业务提成
     */
    public function commission()
    {
        $order =  M('travel_order')->where('id =' . I('id'))->find();
        if (I('cooperation_bonus')) {
            $Mon = new \Common\Lib\Mon();
            $Mon->commission($order['user_id'], I('post.average_spend'), $order['y_num']);
            $this->ajaxSuccess('发放成功');
        } else {
            $this->assign('order', $order);
            $this->display();
        }
    }

    /**
     * 旅游销售提成
     */
    public function sales_commissions()
    {
        $order =  M('travel_order')->where('id =' . I('id'))->find();
        if (I('profit')) {
            $Mon = new \Common\Lib\Mon();
            $Mon->sales_commissions($order['user_id'], I('post.profit'), $order['y_num']);
            $this->ajaxSuccess('发放成功');
        } else {
            $this->assign('order', $order);
            $this->display();
        }
    }
}