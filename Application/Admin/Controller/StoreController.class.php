<?php
namespace Admin\Controller;

use Think\Controller;

class StoreController extends BaseController
{

    public function store_update()
    {
        $User = M('store');
        $mem = $User->table('think_storeup_record U')
            ->join('think_member M on U.user_id=M.id')
            ->join('think_store S on M.id=S.user_id')
            ->join('think_store_level L on S.st_level=L.slevel')
            ->field('S.*,L.*,U.*,M.username,M.nickname')
            ->where('U.pay_status=0')
            ->select();
        foreach ($mem as $key => $value) {
            $re = getStorebyID($value['tolevel']);
            $value['toname'] = $re['sname'];
            $data[] = $value;
        }
        $this->assign('res', $data);
        $this->display();
    }

    public function store_act()
    {
        $Re = M('storeup_record');
        $record = $Re->where('id=' . I('id'))->find();
        $Re->where('id=' . I('id'))->setField('pay_status', '1');
        M('store')->where('user_id=' . $record['user_id'])->setField('st_level', $record['tolevel']);

    }

    public function store_edit()
    {
        $goods = M('goods')->where('1 = 1')->order('goods_id')->select();

        $this->assign('user_id', I('user_id'));
        $this->assign('goods', $goods);
        $this->display();
    }

    public function store_puhuo()
    {
        $data = array_filter(I());
        unset($data['user_id']);
        $Ku = M('uukucun');
        foreach ($data as $key => $value) {
            $add['goods_sn'] = implode(',',array_filter(explode(',' ,$value)));
            $add['goods_id'] = $key;
            $add['time'] = time();
            $add['goods_num'] = count(array_filter(explode(',', $value)));
            $add['user_id'] = I('user_id');
            $exit=$Ku->where(array('user_id'=>$add['user_id'],'goods_id'=>$add['goods_id']))->find();
            if ($exit) {
                $add['goods_sn']=joinCoding($exit['goods_sn'],$add['goods_sn']);
                $add['goods_num']+=$exit['goods_num'];
                $result = $Ku->where('id='.$exit['id'])->save($add);
            } else {
                $result = $Ku->add($add);
            }
        }
        if ($result) {
            $this->success('添加成功',U('Admin/Mem/store_list'));
        }
    }

    //首期管理费
    public function manage_active()
    {
        $result = M('store')->where('id =' . I('post.id'))->setField('manage_active', '1');
        if ($result) {
            $this->ajaxSuccess('成功');
        } else {
            $this->ajaxError('失败');
        }
    }


}