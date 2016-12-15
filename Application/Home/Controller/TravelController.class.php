<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/26
 * Time: 9:50
 */
namespace Home\Controller;

use Think\Controller;

class TravelController extends BaseController
{
    public function travel_list()
    {
        $list = M('travel')->select();
        $this->assign('list', $list);
        $this->display();
    }

    public function travel_info()
    {
        $list = M('travel')->where('tr_id=' . I('id'))->find();
        $st = explode(';', rtrim($list['keywords'], ';'));
        foreach ($st as $value) {
            $stp[] = explode('-', $value);
        }
        $this->assign('list', $list);
        $this->assign('stp', $stp);
        $this->display();
    }

    public function travel_apply()
    {
        $list = M('travel')->where('tr_id=' . I('tr_id'))->find();
        $this->assign('list', $list);
        $this->display();
    }

    public function apply_post()
    {

        $data = null;
        $data = array(
            'tr_id' => I('tr_id'),
            'user_id' => session('id'),
            'order_sn' => build_order_no(),
            'time' => strtotime(I('date')),
            'type' => I('type'),
            'pay_status' => 0,
            'status' => 0,
            'y_num' => count(I('name')),
            'c_num' => count(I('c_num')),
            'user' => implode(',', I('name'))
        );
        //添加出团人
        $cus['time'] = strtotime(I('date'));
        $cus['order_id'] = $data['order_sn'];
        for ($i = 0; $i < count(I('name')); $i++) {
            $cus['user_name'] = $_POST['name'][$i];
            $cus['sex'] = $_POST['sex'][$i];
            $cus['mobile'] = $_POST['mobile'][$i];
            $cus['usercard'] = $_POST['usercard'][$i];
            $cus['c_num'] = $_POST['c_num'][$i];
            $cus['card_thumb'] = upload_chutuan($_FILES['pic']['tmp_name'][$i], $i);
            $User = D("TravelUser");
            if (!$User->create($cus)) {
                $this->error($User->getError());
            } else {
                $User->add($cus);
            }
        }
        $Travel = D("TravelOrder");
        if (!$Travel->create($data)) {
            $this->error($Travel->getError());
        } else {
            $Travel->add($data);
            $this->assign("waitSecond", "5");
            $this->success('您已成功提交报团信息
                工作人员将在48小时内联系您', 'travel_list');
        }


    }

    public function travel_record()
    {
        $M = M('travel_order');
        $count = $M->where('user_id=' . session('id'))->count();
        $Page = new \Think\Page($count, 10);
        $show = $Page->show();
        $list = $M->join('think_travel T on T.tr_id=think_travel_order.tr_id')->where('user_id=' . session('id'))->field('T.tr_name,think_travel_order.*,FROM_UNIXTIME( `time` , \'%Y-%m-%d \' ) AS t')->limit($Page->firstRow . ',' . $Page->listRows)->order('id desc')->select();
        $yetotal = ceil($count / 10);
        $this->assign('page', $show);
        $this->assign('yetotal', $yetotal);
        $this->assign('list', $list);
        $this->display();
    }

    public function travel_feedback()
    {
        $M = M('travel_order');
        $list = $M->join('think_travel T on T.tr_id=think_travel_order.tr_id')->where('user_id=' . session('id') . '  and order_sn=' . I('order_sn'))->field('T.tr_name,think_travel_order.*,FROM_UNIXTIME( `time` , \'%Y-%m-%d \' ) AS t')->find();
        $users = M('travel_user')->where('order_id=' . I('order_sn'))->select();
        $this->assign('vo', $list);
        $this->assign('users', $users);
        $this->display();
    }

    /*
     * 图片显示
     * */
    public function img()
    {
        $this->assign('img', I('img'));
        $this->display();
    }

    /*取消订单*/
    public function cancel_order()
    {
        if (!empty(I('id'))) {
            $data = array(
                'cancel_reason' => I('cancel_reason'),
                'status' => '3'
            );
            $result = M('travel_order')->where('id=' . I('id'))->save($data);
            if ($result) {
                $this->ajaxSuccess('提交成功');
            } else {
                $this->ajaxSuccess('提交失败');
            }
        }
    }
}