<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends BaseController {


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
        $this->display();
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