<?php

/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/9/12
 * Time: 17:14
 */
namespace Common\Lib;
class Uuce{

/*转让uu册*/
    public function uu_transfer($id,$toid = NULL,$goods_id,$goods_sn,$type){
        //减去
        $Kucun=M('uukucun');
        $goods=M('uukucun')->where('goods_id='.$goods_id.' and user_id='.$id)->find();
        $tra_num=count(uuSntoArr($goods_sn));
        $save['goods_num']=$goods['goods_num']-$tra_num;
        $save['goods_sn']=orderdel($goods['goods_sn'],$goods_sn);
        M('uukucun')->where('goods_id='.$goods_id.' and user_id='.$id)->save($save);
        //转让
        if ($type==1) {
            $judge=$Kucun->where('goods_id='.$goods_id.' and user_id='.$toid)->find();
            if ($judge) {
                $data['goods_sn']=joinCoding($judge['goods_sn'],$goods_sn);
                $data['goods_num']=$tra_num+$judge['goods_num'];
                $Kucun->where('goods_id='.$goods_id.' and user_id='.$toid)->save($data);
            }else{
                $new['goods_sn']=$goods_sn;
                $new['goods_num']=$tra_num;
                $new['goods_id']=$goods_id;
                $new['user_id']=$toid;
                $new['time']=time();
                $Kucun->add($new);
            }
        }
    }
/*转让uu册外部*/
    public function transfer_out($id,$goods_id,$goods_sn){
        //减去
        $Kucun=M('uukucun');
        $goods=M('uukucun')->where('goods_id='.$goods_id.' and user_id='.$id)->find();
        $tra_num=count(explode(',',$goods_sn));
        $save['goods_num']=$goods['goods_num']-$tra_num;
        $save['goods_sn']=rtrim(str_replace($goods_sn.',','',$goods['goods_sn'].','),',');
        M('uukucun')->where('goods_id='.$goods_id.' and user_id='.$id)->save($save);
    }



}