<?php
namespace Admin\Controller;
use Think\Controller;
use Common\Lib\Mon;

class BonusController extends BaseController {
    
    public $Mon;

    public function _initialize()
    {
        $this->Mon = new \Common\Lib\Mon();

    }

    public function bill()
    {
        $bonusList = M('bonus_log')->field('*, FROM_UNIXTIME( `date` , \'%Y-%m-%d %h:%i:%s\' ) AS t')->where('1 = 1')->order('id desc')->select();
        $this->assign('list', $bonusList);
        $this->display();
    }

    //手动升级，降级
    public function mem_update()
    {
        if (!empty(I('post.id'))) {
            $result = $this->Mon->mem_update();
            $result = $this->Mon->updateTeamCount();
            $result = $this->Mon->demotion();
            if ($result) {
                $this->ajaxSuccess('成功');
            } else {
                $this->ajaxError('失败');
            }
        } else {
            $this->display();
        }
    }

    //达成奖
    public function dacheng()
    {
        if (!empty(I('post.id'))) {
            $this->Mon->person_add();
            $result = $this->Mon->satisfyBonus();
            if ($result) {
                $this->ajaxSuccess('成功');
            } else {
                $this->ajaxError('失败');
            }
        } else {
            $this->display();
        }
    }
    
    public function pingjiChaoyue()
    {
        if (!empty(I('post.id'))) {
            $result = $this->Mon->pingjiChaoyue();
            if ($result) {
                $this->ajaxSuccess('成功');
            } else {
                $this->ajaxError('失败');
            }
        } else {
            $this->display();
        }
    }

    //店铺租金支持
    public function storeManageBonus()
    {
        if (!empty(I('post.id'))) {
            $result = $this->Mon->storeManageBonus();
            if ($result) {
                $this->ajaxSuccess('成功');
            } else {
                $this->ajaxError('失败');
            }
        } else {
            $this->assign('title', '店铺管理费和租金支持');
            $this->display();
        }
    }

    //店铺管UU销售和销售超额奖
    public function storeUUsale()
    {
        if (!empty(I('post.id'))) {
            $result = $this->Mon->storeUUsale();
            if ($result) {
                $this->ajaxSuccess('成功');
            } else {
                $this->ajaxError('失败');
            }
        } else {
            $this->assign('title', '店铺管UU销售和销售超额奖');
            $this->display();
        }
    }

}