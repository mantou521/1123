<?php
namespace Admin\Controller;
use Think\Controller;
class BonusController extends BaseController {

    public function mem_update()
    {
        if (!empty(I('post.id'))) {
            $Mon=new \Common\Lib\Mon();
            $result = $Mon->mem_update();
            if ($result) {
            	$this->ajaxSuccess('成功');
            } else {
                $this->ajaxError('失败');
            }
        } else {
            $this->display();
        }
    }
}