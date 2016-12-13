<?php
namespace Admin\Controller;
use Think\Controller;
class StoreController extends Controller {
    public function store_update()
    {
        $User=M('store');
        $mem=$User->table('think_storeup_record U')
            ->join('think_member M on U.user_id=M.id')
            ->join('think_store S on M.id=S.user_id')
            ->join('think_store_level L on S.st_level=L.slevel')
            ->field('S.*,L.*,U.*,M.username,M.nickname')
            ->where('U.pay_status=0')
            ->select();
        foreach ($mem as $key => $value) {
            $re=getStorebyID($value['tolevel']);
            $value['toname']=$re['sname'];
            $data[]=$value;
        }
        $this->assign('res',$data);
        $this->display();
    }

    public function store_act()
    {
        $Re=M('storeup_record');
        $record=$Re->where('id='.I('id'))->find();
        $Re->where('id='.I('id'))->setField('pay_status','1');
        M('store')->where('user_id='.$record['user_id'])->setField('st_level',$record['tolevel']);

    }
}