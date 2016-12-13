<?php

/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/9/12
 * Time: 17:14
 */
namespace Common\Lib;
class Mon
{
    public function chek(){
        return 123;
    }
    public function memact($id){
        $User = M('member');
        $user=getMemberbyID($id);
        $fas=getMemberbyID($user['id']);
        $recount=$fas['recount']+1;
        $User-> where('id='.$fas['id'])->setField('recount',$recount);
        $data['ispay']=1;
        $data['istime']=time();
        $User-> where('id='.$id)->setField($data);

        updatelevel();
        department();
        depart_down();
    }
    public function store_act($id){
        $Store=M('store');
        $result=$Store->where('id='.$id)->setField('pay_status','1');
    }

}