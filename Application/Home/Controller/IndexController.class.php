<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){

        session('id') && $tra=M('travel_order')->where('user_id='.session('id').' and reback=1 and pay_status=0')->find();
        $this->assign('tra',$tra);
        //        $index=R("Index","hello");
        $Data     = M('Member');// 实例化Data数据模型
        $us     = $Data->find(session('id'));
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
        $login=A("Index");
        $login->pri_login();



    }
    public function hello(){
        $User = M('data'); // 实例化User对象
        $count      = $User->where('id>=1')->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $User->where('id>=1')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display(); // 输出模板
    }
    public function pri_login(){
        if (session('id')) {
            $Mem = M('member');
            $re = $Mem->find(session('id'));
            $this->assign('re',$re);
            $this->display();
        }
        else{
            $this->redirect(U('Home/Index/login'));
        }
    }
    public function login(){
        session('id',null);
        session('nickname',null);
        if ($_POST['submit'] ) {
                if (checkLogin($_POST['username'],$_POST['pwd'])) {
                    if (checkIslock($_POST['username'],$_POST['pwd'])) {
                        $us=getMemberbyNickName($_POST['username']);
                        session('id',$us['id']);
                        session('nickname',$us['nickname']);
                        $this->success('登录成功',U('Home/Index/index'));
                    }else{
                        $this->success('账号被锁定，请联系管理员',U('Home/Index/login'));

                    }
//                 $this->redirect("Index/index");
                } else{
                $this->success('账号密码错误',U('Home/Index/login'));
            }
        }else{
            $this->display();

        }
    }
    public function kucun(){
        $this->display();

    }
    /**
     * webuploader 上传文件
     */
    public function ajax_upload(){
        // 根据自己的业务调整上传路径、允许的格式、文件大小
        ajax_upload('/upload/image/');
    }

    /**
     * webuploader 上传demo
     */
    public function webuploader(){
        // 如果是post提交则显示上传的文件 否则显示上传页面
        if(IS_POST){
            $_POST;die;
        }else{
            $this->display();
        }
    }
}