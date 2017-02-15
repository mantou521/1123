<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/17
 * Time: 14:24
 */
namespace Home\Controller;
use Think\Controller;
class UuceController extends BaseController{


/*列表*/
    public function uu_re(){
        $G=M('goods');
        $count        = $G->where('goods_id>0 and goods_num>0  ')->count();
        $Page         =new \Think\Page($count,9);
        $show         =$Page->show();
        $goods=$G->where('goods_id > 0 and goods_num > 0   ')->limit($Page->firstRow.','.$Page->listRows)->select();
        $yetotal=ceil($count/9);
        $this->assign('page',$show);
        $this->assign('yetotal',$yetotal);
        $this->assign('goods',$goods);
        $this->display();
    }

/*
 * uu订单列表
 *
*/
    public function uu_orders(){

        $M=M('order');
        $count        = $M->where('type=4 and user_id='.session('id'))->count();
        $Page         =new \Think\Page($count,10);
        $show         =$Page->show();
        $list=$M->where('type=4 and user_id='.session('id'))->limit($Page->firstRow.','.$Page->listRows)->order('order_id desc')->select();
        foreach ($list as $item) {
            $item['goods_name']=M('goods')->where('goods_id='.$item['goods_id'])->getField('goods_name');
            $item['add_time']=date('Y-m-d',$item['add_time']);
            $listn[]=$item;
        }

        $yetotal=ceil($count/10);
        $this->assign('page',$show);
        $this->assign('yetotal',$yetotal);
        $this->assign('list',$listn);
        $this->display();
    }

    /*详情*/
    public function uu_info(){
        $good=M('goods')->where('goods_id='.I('goods_id'))->find();
        $good['src']=json_decode($good['src'],ture);
//        $good['goods_sn']=explode(',',$good['goods_sn']);
        $this->assign('good',$good);
        $this->assign('img',$good['src']);
//        $this->assign('good_sn',$good['goods_sn']);
        $this->display();
    }
    /*生成订单*/
    public function uu_order(){
        $good  =  M('goods')->where('goods_id='.I('goods_id'))->find();
        $pur_num=I('goods_num');
//        if ($_POST['ch_sn']==2) {   //自动选择
//            $goods_sn=explode(',',$good['goods_sn']);
//            $sn=$goods_sn['0'];
//            for ($i=1; $i < (I('goods_num')); $i++) {
//                $sn.=','.$goods_sn[$i];
//            }
//        }elseif ($_POST['ch_sn']==1){
//            $User = D("Uurecord");
//            if (!$User->create(I())){
//                $this->error($User->getError());
//            }
//            $sn=$_POST['text'];
//            $sn=str_replace(';',',',$sn);
//            $sn = implode(',',array_unique(explode(',',rtrim($sn,','))));
//            $ar=array_unique(explode(',',rtrim($sn,',')));
//            $pur_num=count($ar);
//        }
        if ($good['goods_num']<$pur_num) {
            $this->error('库存不足');
        }
//        $good['goods_sn']=rtrim(str_replace($sn.',','',$good['goods_sn'].','),',');
        $save['goods_num'] = $pur_num;

        $total=$good['goods_price']*I('goods_num');
        $this->assign('total_amount',$total);
        $this->assign('goods_num',$pur_num);
//        $this->assign('result',$sn);
        $this->assign('goods_id',I('goods_id'));
        $this->display();
    }
/*
 * 生成uu册订单
 * 添加库存
*/
    public function uu_pay(){

        $data=null;
        $data=I();
        $data['address']=I('address').'/'.I('address1');
        //生成订单
        if (I('gd')) {
            $good_num = M('goods')->where('goods_id =' . I('gd'))->getField('goods_num');
            $data['goods_num']=I('goods_num');
            if ($good_num < I('goods_num')) {
                $this->error('库存不足');
            }
        }

        $data['goods_id']=I('gd');
        $data['order_sn']=build_order_no();
//        $data['goods_sn']=I('goods_sn');
        $data['add_time']=time();
        $data['user_id']=$_SESSION['id'];
        $data['type']=4;
        M('order')->add($data);
        //减去相应数量uu册编号
        $goods =M('goods')->where('goods_id='.I('gd'))->find();
//        $save['goods_sn']=orderdel($goods['goods_sn'],$data['goods_sn']);
        $save['goods_num'] = $good_num - I('goods_num');
        M('goods')->where('goods_id='.I('gd'))->save($save);
        //添加到库存,支付成功后
        $this->assign('total_amount',$data['total']);
        $Pay=A('Order');
        $Pay->order_pay($data['order_sn']);
    }
    /*uu库存*/
    public function uu_kucun(){
        $Uukucun=    M('uukucun');
        $count        = $Uukucun->table('think_uukucun K')
            ->join('think_goods G on G.goods_id=K.goods_id')
            ->field('K.*,G.thumb,goods_name')
            ->where('K.user_id='.session('id'))
            ->count();
        $Page         =new \Think\Page($count,10);
        $show         =$Page->show();
        $yetotal=ceil($count/10);
        $list=$Uukucun->table('think_uukucun K')
            ->join('think_goods G on G.goods_id=K.goods_id')
            ->field('K.*,G.thumb,goods_name')
            ->where('K.user_id='.session('id'))
            ->limit($Page->firstRow.','.$Page->listRows)
            ->select();
        foreach ($list as $key => $item) {
            $item['num']=count(array_filter(explode(',',$item['goods_sn'])));
            $data[]=$item;
        }
        $this->assign('list',$data);
        $this->assign('page',$show);
        $this->assign('yetotal',$yetotal);
        $this->display();
    }
    /*uu册转让产品页*/
    public function kucun_info(){
        $Uukucun=    M('uukucun');
        $list=$Uukucun->table('think_uukucun K')
            ->join('think_goods G on G.goods_id=K.goods_id')
            ->field('K.*,G.thumb,goods_name,goods_price')
            ->where('user_id='.session('id').' and K.goods_id='.I('goods_id'))
            ->find();
        $list['num'] = count(array_filter(explode(',',$list['goods_sn'])));
        $list['usable_uuce'] = usableUuce($list['goods_sn']);//筛选未使用uu册编号
        $this->assign('uuce',$list);
        //商品列表
        $goods=$Uukucun->table('think_uukucun K')
            ->join('think_goods G on G.goods_id=K.goods_id')
            ->field('K.*,G.thumb,goods_name')
            ->where('K.user_id ='.session('id').' and K.goods_id!='.I('goods_id'))
            ->limit('2')
            ->select();
        foreach ($goods as $key => $item) {
            $item['num']=count(array_filter(explode(',',$item['goods_sn'])));
            $data[]=$item;
        }
        $this->assign('goods',$data);

        $this->display();
    }
/*转让分类*/
    public function uu_sell(){

        if (I('type')==1) {
            $this->redirect('Uuce/sell_inner', array('cate_id' => 1,'goods_id'=>I('goods_id'),'goods_sn'=>I('goods_sn')), 0, '页面跳转中...');
        }elseif (I('type')==2){
            $this->redirect('Uuce/sell_out', array('cate_id' => 2,'goods_id'=>I('goods_id'),'goods_sn'=>I('goods_sn')), 0, '页面跳转中...');
        }
    }

    /*内部转让*/
    public function sell_inner()
    {
        $data = I();
        $data['goods_sn'] = uuSntoArr($data['goods_sn']);
        $goods = M('goods')->field('goods_name')->where('goods_id=' . I('goods_id'))->find();
        $data['goods_name'] = $goods['goods_name'];
        $this->assign('goods', $data);
        $this->assign('goods_sn', $data['goods_sn']);
        $this->display();
    }

    /*外部装让*/
    public function sell_out()
    {
        $data = I();
        $data['goods_sn'] = uuSntoArr($data['goods_sn']);
        $goods = M('goods')->field('goods_name')->where('goods_id=' . I('goods_id'))->find();
        $data['goods_name'] = $goods['goods_name'];
        $this->assign('goods', $data);
        $this->assign('goods_sn', $data['goods_sn']);
        $this->display();

    }

    /*转让提交*/
    public function sell_post(){
        $data=null;
        $data=I();
        $data['user_id']=session('id');
        $sn=str_replace(';',',',$data['goods_sn']);
        $data['goods_sn'] = uuSntoSt($sn);
        //判断uu册编号有无被使用
        if (!(bool) usableUuce($sn)) {
        	$this->error('uu册编号被使用');
        };
        $data['goods_num'] = count(uuSntoArr($data['goods_sn']));
        $data['goods_price'] = I('goods_price') ? I('goods_price'):M('goods')->where('goods_id='.I('goods_id'))->getField('goods_price');
        $total = $data['goods_price'] * count(uuSntoArr($data['goods_sn']));
        $data['address']=I('address').I('address1');
        $data['time']=time();
        $data['order_sn'] = build_order_no();
        $data['pay_status'] = 0;
        $User = D("Uurecord");
        if (!$User->create($data)){
            $this->error($User->getError());
        }else{
            //添加到转让记录，在库存中减去相应数量；如果是内部，则转到对应工号
                //检查编号
            $goods_sn=$data['goods_sn'];
            $Uukucun=M('uukucun');
            $result=$Uukucun->where("goods_id=".I('goods_id')." and user_id=".session('id') )->getField('goods_sn');
            if (!existUusn($result,$goods_sn)) {
               $this->error('库存不足');
            }
            $User->add();
            if (I('type') == 1) {
                $order['order_sn']=$data['order_sn'];
                $order['total']=$total;
                $order['add_time']=time();
                $order['goods_id']=I('goods_id');
                $order['user_id']=$_SESSION['id'];
                $order['type']=6;
                M('order')->add($order);
            }
            if (I('type') == 2) {
                $toid= I('user_num') ? M('member')->where('nickname='.I('user_num'))->getField('id'):null;
                $Uuce=new \Common\Lib\Uuce();
                $Uuce->uu_transfer(session('id'),$toid,I('goods_id'),$data['goods_sn'],I('type'));
                $this->success('转让成功');
            } else {
//                inner_order($order['order_sn'],session('id'),I('goods_id'));
                $Pay=A('Order');
                $Pay->order_pay($data['order_sn'],6);
            }
        }
    }
    
/*uu转让记录*/
    public function uu_record(){
        $Re=M('uurecord');
        $count        = $Re->where('user_id='.session('id'))->count();
        $Page         =new \Think\Page($count,10);
        $show         =$Page->show();
        $record = $Re->join('think_goods G on G.goods_id=think_uurecord.goods_id')->field('G.goods_name,think_uurecord.*')
            ->where('user_id='.session('id'))
            ->limit($Page->firstRow.','.$Page->listRows)
            ->order('id desc')
            ->select();
        foreach ($record as $value) {
            if ($value['type'] == 1) {
                $value['pay_status'] = M('order')->where('order_sn='.$value['order_sn'])->getField('pay_status');
            }
            if ($value['type'] == 2 || ($value['type'] == 1 && $value['pay_status'] == 1 )) {
                $new[]=$value;
            }
        }
        $yetotal=ceil($count/10);
        $this->assign('record',$new);
        $this->assign('page',$show);
        $this->assign('yetotal',$yetotal);
        $this->display();
    }


}
