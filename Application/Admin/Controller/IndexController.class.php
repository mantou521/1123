<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends BaseController {


    public function index(){

        $login=A("Index");
        $login->pri_login();
    }
    public function pri_login(){
        if (session('admin_id')) {
            $Mem = M('admin_user');
            $re = $Mem->find(session('admin_id'));
            $this->assign('re',$re);
            $this->display();
        }
        else{
            $this->redirect("Index/login");
        }
    }
    public function login(){
        session('admin_id',null);
        if ($_POST['lo_submit'] ) {
            if (checkLoginA($_POST['ausername'],$_POST['apassword'])) {
                $us=getAdminbyusername($_POST['ausername']);
                $admin_info = M('admin_user')->join('__ADMIN_ROLE__ ON __ADMIN_USER__.role_id=__ADMIN_ROLE__.role_id')->where(array('user_name'=>$_POST['ausername']))->find();
                session('admin_id',$admin_info['user_id']);
                session('act_list',$admin_info['act_list']);
                $this->success('登录成功',U('Admin/Index/index'));
//                 $this->redirect("Index/index");
            }
            else{
                $this->success('账号密码错误',U('Admin/Index/login'));
            }
        }else{
            $this->display();

        }
    }


}