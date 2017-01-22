<?php
namespace Admin\Controller;
use Think\Controller;

class MemController extends BaseController {
    /*
     * 会员列表
    */
    public function member_list(){
        $member_list = D('Member')->member_list();
        $this->assign('res',$member_list);
        $this->display();
    }
    /*
     *未激活会员列表
    * */
    public function member_del(){
        $M=M('member');
        $res=$M->where("id>0 and ispay=0")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->order('id asc')->select();
        foreach ($res as $key => $vo) {
            $reid=$M->where('id='.$vo['reid'])->find();
            $vo['regonghao']=$reid['nickname'];
            $vo['rename']=$reid['username'];
            $da[]=$vo;
        }
        $this->assign('res',$da);
        $this->display();
    }

    /*
     * 会员信息修改
     * */
    public function member_edit()
    {
        if ($_POST['member_edit']) {
            $M = M('member');
            $res = $M->where("id=" . $_POST['userid'] . "")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->order('id asc')->find();
            $this->assign('res', $res);
            $this->display();
        } elseif ($_POST['submit_edit']) {
            $data['sex'] = $_POST['sex'];
            $data['username'] = $_POST['username'];
            $data['usertel'] = $_POST['mobile'];
            $data['usercard'] = $_POST['usercard'];
            $data['bankcard'] = $_POST['bankcard'];
            $data['useraddress'] = $_POST['useraddress'];
            $data['postcode'] = $_POST['postcode'];
            $data['beizhu'] = $_POST['beizhu'];
            $data['bankname'] = $_POST['bankname'];
            $data['contract_no'] = $_POST['contract_no'];
            $M = M('member');
            $M->where("id=" . $_POST['userid'] . "")->save($data);
            $this->success('修改成功', U('Admin/Mem/member_list'));
        }

    }

    /*
     * 激活会员
    */
    public function member_act()
    {
        $id=$_POST['id'];
        $Mon=new \Common\Lib\Mon();
        $Mon->memact($id);
    }

    public function export_excel()
    {
        $member_list = D('Member')->member_list();
        $Excel=new \Common\Lib\Excel();
        $Excel->export_member($member_list);
    }
    /*
     * 锁定解锁会员
    */
    public function member_lock()
    {
        $User = M('member');
        if ($_POST['lockid']) {
            echo $_POST['lockid'];
            $User-> where('id='.$_POST['lockid'])->setField('islock','1');
        }elseif ($_POST['islockid']){
            $User-> where('id='.$_POST['islockid'])->setField('islock','0');
        }
    }
    /*
 * 修改密码
 */
    public function change_password()
    {
        if (!empty(I('userid'))) {
            $username = M('member')->where('id='.I('userid'))->getField('nickname');
            $this->assign('test',$username);
            $this->assign('id',I('userid'));
            $this->display();
        } elseif (I('change_pas')) {
            if (I('newpassword') !=I('newpassword2')) {
                $this->ajaxError('两次密码输入不一致');
            }
            $result=M('member')->where('id='.I('id'))->setField('password1',md5(I('newpassword')));
            if ($result) {
                $this->ajaxSuccess('更新成功');
            }else{
                $this->ajaxError('失败');
            }
        }
    }
    /*
     * 删除会员
    */
    public function member_delete(){
        $User = M('member');
        $User->where('id='.$_POST['id'])->delete();
    }
/*
 * 店铺报单
 * */
    public function store(){
        $M=M('store');
        $re=$M->table('think_store S')
            ->join('think_member M on S.user_id=M.id')
            ->field('S.*,M.username,M.nickname')
            ->where('S.pay_status=0')
            ->order('S.id desc')
            ->limit('8')
            ->select();
        $this->assign('res',$re);
        $this->display();
    }
    /*
 * 店铺
 * */
    public function store_list(){
        $M=M('store');
        $re=$M->table('think_store S')
            ->join('think_member M on S.user_id=M.id')
            ->field('S.*,M.username,M.nickname')
            ->where('S.pay_status=1')
            ->order('S.id desc')
            ->limit('8')
            ->select();
        $this->assign('res',$re);
        $this->display();
    }
/*
 * 店铺激活
 * */
    public function store_act(){

        $id=$_POST['id'];
        $Mon=new \Common\Lib\Mon();
        $Mon->store_act($id);

    }






}