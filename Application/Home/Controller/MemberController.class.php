<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/8/25
 * Time: 10:18
 */

namespace Home\Controller;
use Think\Controller;
class MemberController extends Controller
{
    /*
     * 架构
     **/
    public function sys(){
        if ($_POST['submit']) {
            $userid=get_mid($_POST['nickname'],$_POST['username']);
        }else{
            $userid=session('id');
        }
        $Mem=M('member');
        $res = $Mem->where("id='$userid'")->find();
        $tree=tree($userid);
        $this->assign('tree',$tree);
        $this->assign('us',$res);
        $this->display();
    }
    /*
     * 人力
     */
    public function human()
    {
        if ($_POST['submit'] ) {
            $userid=get_mid($_POST['nickname'],$_POST['username']);
        }else{
            $userid=session('id');
        }
        if ($_POST['radio'] == 1) {
            session('se_nickname',$_POST['nickname']);
            session('se_username',$_POST['username']);
            $this->redirect("Member/mem_info");
        }else{
            $count      = downm_count($userid);// 查询满足要求的总记录数
            $Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
            $show       = $Page->show();// 分页显示输出
            $Mem=M('member');
            $mem = $Mem->where("(repath like '%\\,{$userid}\\,%' or id=$userid ) and ispay=1 ")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->limit($Page->firstRow.','.$Page->listRows)->order('id asc')->select();
            $yetotal=ceil($count/10);
            $this->assign('yetotal',$yetotal);
            $this->assign('mem',$mem);
            $this->assign('page',$show);
            $this->display();
        }

    }
    public function human_serch()
    {
        if ($_POST['submit'] ) {
            $userid=get_mid($_POST['nickname'],$_POST['username']);
            session('serchid',$userid);

        }else{
            $userid=session('serchid');
        }
        if ($_POST['radio'] == 1) {
            session('se_nickname',$_POST['nickname']);
            session('se_username',$_POST['username']);
            $this->redirect("Member/mem_info");
        }else{
            $count      = downm_count($userid);// 查询满足要求的总记录数
            $Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
            $show       = $Page->show();// 分页显示输出
            $Mem=M('member');
            $mem = $Mem->where("(repath like '%\\,{$userid}\\,%' or id=$userid ) and ispay=1 ")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->limit($Page->firstRow.','.$Page->listRows)->order('id asc')->select();
            $this->assign('mem',$mem);
            $this->assign('page',$show);
            $this->display('human');
        }

    }
    /*
     * 会员详情
     * */
    public function mem_info(){
        $se_nickname=session('se_nickname');
        $se_username=session('se_username');
        $us=get_mid_arr($se_nickname,$se_username);
        $end=getUplevelbyId($us['id']);
        $parent=getMemberbyID($us['reid']);
        $regtime=date("Y年m月d日",$us['rdt']);
        $endtime=date("Y年m月d日",$end['datetime']);
        $uppor=getUplevelprobyId($us['id']);
        $this->assign('end',$end);
        $this->assign('uppor',$uppor);
        $this->assign('user',$us);
        $this->assign('parent',$parent);
        $this->assign('regtime',$regtime);
        $this->assign('endtime',$endtime);
        $this->display();
    }
    /*
     * 报单
     * */

    public function travel_re()
    {
        $this->display();
    }
    public function conm_re()
    {
        if ($_POST['re_submit']) {
            $userid=session('id');
            $us=getMemberbyID($userid);
            $us_relevel=$us['relevel'];
//            $recount=$us['recount']+1;
            $img1=upload_pic($_FILES["img1"]["tmp_name"],1);
            $img2= upload_pic($_FILES["img2"]["tmp_name"],2);
            $img3=upload_pic($_FILES["img3"]["tmp_name"],3);
            $img4=upload_pic($_FILES["img4"]["tmp_name"],4);
            $name=$_POST['name'];
            $usercard=$_POST['idcard'];
            $usertel=$_POST['phone'];
            $useraddress=$_POST['addre1'].$_POST['addre2'];
            $useraddress=str_replace("/","",$useraddress);
            $hang=$_POST['hang'];
            $hao=$_POST['hao'];
            $sex=$_POST['xingbie'];
            $birth=$_POST['cs_time'];
            $pdt=$_POST['rz_time'];
            $jiaoyu=$_POST['jiaoyu'];
            $youbian=$_POST['youbian'];


            $reid=$userid;
            $repath=$us['repath'].$userid.",";
            $relevel=$us_relevel+1;
            $nikname=maxId();
            $pwd=md5('111111');
            $data['nickname'] = $nikname;
            $data['password1'] = $pwd;
            $data['reid']  = $reid;
            $data['rname']  = $us['username'];
            $data['repath']  = $repath;
            $data['relevel']  = $relevel;

            $data['username'] = $name;
            $data['usercard'] = $usercard;
            $data['usertel'] = $usertel;
            $data['useraddress'] = $useraddress;
            $data['bankname'] = $hang;
            $data['bankaddress'] = I('bankaddress');
            $data['bankcard'] = $hao;
            $data['sex'] = $sex;
            $data['birthday'] = $birth;
            $data['rdt'] = strtotime($pdt);
            $data['retime'] = time();
            $data['xueli'] = $jiaoyu;
            $data['postcode'] = $youbian;
            $data['img1'] = $img1;
            $data['img2'] = $img2;
            $data['img3'] = $img3;
            $data['img4'] = $img4;
            $data['ulevel']='1';
            $data['e_ulevel']='E';
//            $data['usernum']=$nikname.$youbian.$data['e_ulevel'];
            $data['departnum']=departnum($repath);
            $User = M('member');
            $User->data($data)->add();

            $mem=getMemberbyNickName($data['nickname']);
            $order['act_id']=$mem['id'];
            $order['user_id']=$_SESSION['id'];
            $order['add_time']=time();
            $order['order_sn']=build_order_no();
            $order['total']=0.01;
            $order['type']=1;
            $result=M('order')->add($order);
//            $User-> where('id='.$userid.'')->setField('recount',$recount);
//            updatelevel();
//            department();
//            depart_down();
            $Order=A('Order');
            $Order->order_pay($order['order_sn']);
//            $this->success('注册成功', '');

        }else{
            $this->display();

        }


    }
    public function userset()
    {
        $Mem = M('member');
        $re = $Mem->find(session('id'));
        $this->assign('re',$re);
        if ($_POST['re_submit']) {
            $user=getMemberbyID(session('id'));
            if (md5($_POST['pwd'])==$user['password1']) {
                $data=NULL;
                $data['password1']=md5($_POST['newpwd']);
                $Mem = M('member');
                $Mem-> where('id='.$user['id'].'')->setField($data);
                $this->success('修改成功', '');
            }else{
                $this->success('密码错误', '');
            }
        }else{
            $this->display();
        }
    }



/*
 * 开店报单
*/
    public function store()
    {
        $User=M('member');
        $mem=$User->table('think_store S')
            ->join('think_member M on S.user_id=M.id')
            ->join('think_store_level L on S.st_level=L.slevel')
            ->field('S.*,L.*,M.username,M.nickname')
            ->where('M.id='.$_SESSION['id'])
            ->count();
        if ($mem==0) {
            $this->display();
        }else{
            $this->display('Store/store_check');
        }
    }
/*
 * 提交开店信息
 * */
    public function store_post()
    {
        $data['user_id']=session('id');
        $data['img']=upload_store_pic($_FILES["img"]["tmp_name"]);
        $address=$_POST['address'].$_POST['address1'];
        $data['address']=str_replace('/','',$address);
        $data['st_level']=$_POST['st_level'];
        $data['st_type']=$_POST['st_type'];
        $data['pay_type']=$_POST['zhifu'];
        $data['pay_status']=0;
        $data['date']=time();
        $result=M('store')->add($data);
//        $order['act_id']=$mem['id'];
        $order['user_id']=$_SESSION['id'];
        $order['add_time']=time();
        $order['order_sn']=build_order_no();
        $order['total']=M('store_level')->where('id='.I('st_level'))->getField('free');
        $order['type']=2;
        $result=M('order')->add($order);
        if ($_POST['zhifu']==1) {
            $Pay=A('Order');
            $Pay->order_pay($order['order_sn'],2);
        }else{
            $this->success('提交成功',U('Store/open_offline'));
        }

    }
/*个人信息*/
    public function per_info()
    {
        $M=M('member');
        $us  = $M->table('think_member M')
            ->join('think_ulevel L on L.ulevel=M.ulevel')
            ->where('M.id='.session('id'))
            ->find();

        $end=getUplevelbyId($us['id']);
        $parent=getMemberbyID($us['reid']);
        $regtime=date("Y年m月d日",$us['rdt']);
        $endtime=date("Y年m月d日",$end['datetime']);
        $uppor=getUplevelprobyId($us['id']);
        $this->assign('end',$end);
        $this->assign('uppor',$uppor);
        $this->assign('user',$us);
        $this->assign('parent',$parent);
        $this->assign('regtime',$regtime);
        $this->assign('endtime',$endtime);
        //店铺
        $User=M('member');
        $mem=$User->table('think_store S')
            ->join('think_member M on S.user_id=M.id')
            ->join('think_store_level L on S.st_level=L.slevel')
            ->join('think_store_type T on T.type=S.st_type')
            ->field('S.*,L.*,M.username,M.nickname,T.type_name, FROM_UNIXTIME( `date` , \'%Y-%m-%d \' ) AS t')
            ->where('M.id='.$_SESSION['id'])
            ->find();
        $store_num=M('store')->where('user_id='.$_SESSION['id'].' and pay_status=1')->count();
        $this->assign('store_num',$store_num);
        $this->assign('store',$mem);
        $St=M('store_level');
        //店铺升级记录
        $Re=M('storeup_record');
        $result=$Re->table('think_storeup_record R')
                ->join('think_store_level L on L.slevel=R.level')
                ->field('L.*,R.*,FROM_UNIXTIME( `date` , \'%Y年%m月%d日 \' ) AS t')
                ->where('R.pay_status=1 and R.user_id='.session('id'))
                ->select();
        $this->assign('record',$result);
        $level=$St->field('slevel,sname,free')->select();
        $this->assign('level',$level);
        $this->display();
    }
/*信息修改*/
    public function per_edit()
    {
        $result=M('member')->field('bankname,bankcard,img3,useraddress,postcode')->where('id='.session('id'))->find();
        $this->assign('user',$result);
        //银行
        $bank=M('bank')->select();
        $this->assign('bank',$bank);
        $this->display();
    }
/*信息修改提交*/
    public function per_edit_post(){
        $data=null;
        $data=I();
        $data['img3']='';
        if ($_FILES["img3"]["error"]==0) {
            $data['img3']=upload_pic($_FILES["img3"]["tmp_name"],1);
        }
        $User = D("User");
        if (!$User->create($data)){
            $this->error($User->getError());
        }else{
            $User->where('id='.session('id'))->save($data);
            $this->success('修改成功','per_info');
        }
    }

}