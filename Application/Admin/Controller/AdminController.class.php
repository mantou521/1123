<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/11/2
 * Time: 10:54
 */
namespace Admin\Controller;
use Think\Controller;
use Think\Page;
use Think\Verify;
class AdminController extends BaseController {
    public function admin_role(){
        $ro=M('admin_role')->select();
        $this->assign('list',$ro);
        $this->display();
    }
    public function admin_list(){
        $ro=M('admin_user')->join('__ADMIN_ROLE__ ON __ADMIN_ROLE__.role_id=__ADMIN_USER__.role_id' )->select();
        $this->assign('list',$ro);
        $this->display();
    }

    public function admin_role_add(){

        $this->display();

    }
}