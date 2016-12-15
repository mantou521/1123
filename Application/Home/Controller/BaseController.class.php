<?php
namespace Home\Controller;
use Think\Controller;
class BaseController extends Controller {
    public $session_id;
    public $cateTrre = array();
    /*
     * 初始化操作
     */
    public function _initialize() {

    }

    protected function ajaxError($msg='', $fields=array())
    {
        header('Content-Type:application/json; charset=utf-8');
        $data = array('status'=>'error', 'msg'=>$msg, 'fields'=>$fields);
        echo json_encode($data);
        exit;
    }

    protected function ajaxSuccess($msg, $_data=array())
    {
        header('Content-Type:application/json; charset=utf-8');
        $data = array('status'=>'success', 'msg' => $msg ,'data'=>$_data);
        echo json_encode($data);
        exit;
    }


}