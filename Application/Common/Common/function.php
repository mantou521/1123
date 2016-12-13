<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/8/26
 * Time: 10:32
 */
//function test01(){
//    return 123;
//}

/*uuce编号更新*/
function uuce_replace($sn,$tosn){

}
/*验证工号存在*/
function checkgonghao($user_num){
    $condition['nickname']="$user_num";
    $result=M('member')->where($condition)->find();
    if ($result) {
        return true;
    }else{
        return false;
    }
}
/*检查uu册库存*/
function checkkucun(){

}
/*
 * 订单编号生成
 * */
function build_order_no(){
    return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}

/**
 * 上传文件类型控制 此方法仅限ajax上传使用
 * @param  string   $path    字符串 保存文件路径示例： /Upload/image/
 * @param  string   $format  文件格式限制
 * @param  integer  $maxSize 允许的上传文件最大值 52428800
 * @return booler   返回ajax的json格式数据
 */
function ajax_upload($path='file',$format='empty',$maxSize='52428800'){
    ini_set('max_execution_time', '0');
    // 去除两边的/
    $path=trim($path,'/');
    // 添加Upload根目录
    $path=strtolower(substr($path, 0,6))==='upload' ? ucfirst($path) : 'Upload/'.$path;
    // 上传文件类型控制
    $ext_arr= array(
        'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
        'photo' => array('jpg', 'jpeg', 'png'),
        'flash' => array('swf', 'flv'),
        'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
        'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2','pdf')
    );
    if(!empty($_FILES)){
        // 上传文件配置
        $config=array(
            'maxSize'   =>  $maxSize,               // 上传文件最大为50M
            'rootPath'  =>  './',                   // 文件上传保存的根路径
            'savePath'  =>  './'.$path.'/',         // 文件上传的保存路径（相对于根路径）
            'saveName'  =>  array('uniqid',''),     // 上传文件的保存规则，支持数组和字符串方式定义
            'autoSub'   =>  true,                   // 自动使用子目录保存上传文件 默认为true
            'exts'      =>    isset($ext_arr[$format])?$ext_arr[$format]:'',
        );
        // 实例化上传
        $upload=new \Think\Upload($config);
        // 调用上传方法
        $info=$upload->upload();
        $data=array();
        if(!$info){
            // 返回错误信息
            $error=$upload->getError();
            $data['error_info']=$error;
            echo json_encode($data);
        }else{
            // 返回成功信息
            foreach($info as $file){
                $data['name']=trim($file['savepath'].$file['savename'],'.');
                echo json_encode($data);
            }
        }
    }
}
function get_mid($NickName,$username){
    $Mem=M('member');
    $user = $Mem->where(" username= '$username' or nickname= '$NickName' and ispay=1 ")->find();
    return $user['id'];
}
function get_mid_arr($NickName,$username){
    $Mem=M('member');
    $user = $Mem->where(" username= '$username' or nickname= '$NickName' and ispay=1 ")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->find();
    return $user;
}
/*
 * 最后晋级
 * */
function getUplevelbyId($id){
    $Up=M('ulevelup');
    $user = $Up->where(" userid= '$id'  ")->order('uid desc')->find();
    if ($user) {
        return $user;
    }else{
        return 0;
    }

}

function getUplevelprobyId($id){
    $Up=M('ulevelup');
    $num = $Up->where(" userid= '$id'  ")->count();
    $num-=1;
    $user = $Up->where(" userid= '$id'  ")->join('think_ulevel ON think_ulevelup.tolevel = think_ulevel.ulevel')->order('think_ulevelup.uid desc')->select();
    if ($user) {
        foreach ($user as $key => $item) {
                $arr['lvname']=$item['lvname'];
                $arr['datetime'] = date("Y年m月d日",$item['datetime']);
                $baar[]=$arr;
        }
        return $baar;
    }else{
        return 0;
    }

}
//会员登录验证
function checkLogin($NickName,$PassWord){
    $PassWord = md5($PassWord);
    $Mem=M('member');
    $userCount = $Mem->where("nickname= '$NickName' AND password1= '$PassWord' and ispay=1")->count();
    if($userCount >= 1){
        return true;
    }else{
        return false;
    }
}
//会员登录验证
function checkIslock($NickName,$PassWord){
    $PassWord = md5($PassWord);
    $Mem=M('member');
    $userCount = $Mem->where("nickname= '$NickName' AND password1= '$PassWord' and ispay=1 and islock=0")->count();
    if($userCount >= 1){
        return true;
    }else{
        return false;
    }
}
//根据账号获取会员信息
function getMemberbyNickName($NickName){
    $Mem=M('member');
    $res = $Mem->where("nickname='$NickName'")->find();
    return $res;
}
//根据id获取会员信息
function getMemberbyID($id){
    $Mem=M('member');
    $res = $Mem->where("id='$id'")->find();
    return $res;
}
//根据id获取会员信息
function getStorebyID($slevel){
    $Mem=M('store_level');
    $res = $Mem->where("slevel='$slevel'")->find();
    return $res;
}
/*
 * 下面团队
 * */
function downmenber($id){
    $Mem=M('member');
    $res = $Mem->where("repath like '%\\,{$id}\\,%' and ispay=1 ")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->select();
    return $res;
}
/*
 * 团队包括自己*/
function downm_count($id){
    $Mem=M('member');
    $res = $Mem->where("(repath like '%\\,{$id}\\,%' or id=$id ) and ispay=1 ")->join('think_ulevel ON think_ulevel.ulevel = think_member.ulevel')->count();
    return $res;
}

//获取最大ID
function maxId(){
    $Mem=M('member');
    $res = $Mem->max('id');
    if ($res) {

        if (strlen($res) == 1) {
        	$res="00".$res;
        }elseif (strlen($res) == 2){
            $res="0".$res;
        }
       return $res;
    }
}
/*
 * 推荐图
 * */
function tree($id){
    $shuchu = "<ul>";
    $Mem=M('member');
    $res = $Mem->where("reid='$id' and ispay=1")->order('id asc')->select();
    if ($res) {
        foreach ($res as $key => $re) {
            $shuchu.="<li>".$re['nickname']."--".$re['username']."--".$re['e_ulevel'];
            $shuchu.=tree($re['id']);
            $shuchu.="</li>";
        }
        $shuchu .= "</ul>";
    }else{
        $shuchu="";
    }
    return $shuchu;
}
/*
 * 上传图片
 * */
function upload_pic($pic,$num){
    $fn=$num.".jpg" ;
    $filename=date("ymdhis").$fn;
    move_uploaded_file($pic,
        "Public/Home/images/upload/" . $filename);
    $data=$filename;
    return $data;
}
/*
 * 上传出团人身份图片
 * */
function upload_chutuan($pic,$num){
    $fn=$num.".jpg" ;
    $filename=date("ymdhis").$fn;
    move_uploaded_file($pic,
        "Public/Uploads/chutuan/" . $filename);
    $data=$filename;
    return $data;
}
/*
 * 上传uu册图片
 * */
function upload_uuce($pic,$num){
    $fn=$num.".jpg" ;
    $filename=date("ymdhis").$fn;
    move_uploaded_file($pic,
        "Public/Uploads/uuce/" . $filename);
    $data=$filename;
    return $data;
}
/*
 * 上传旅游图片
 * */
function upload_travel($pic,$num){
    $fn=$num.".jpg" ;
    $filename=date("ymdhis").$fn;
    move_uploaded_file($pic,
        "Public/Uploads/travel/" . $filename);
    $data=$filename;
    return $data;
}
/*
 * 上传图片
 * */
function upload_store_pic($pic){
    $fn="1.jpg" ;
    $filename=date("ymdhis").$fn;
    move_uploaded_file($pic,
        "Public/Home/images/upload/store/" . $filename);
    $data=$filename;
    return $data;
}
/*
 * 上传线下交易凭证图片
 * */
function upload_pingzheng_pic($pic){
    $fn="1.jpg" ;
    $filename=date("ymdhis").$fn;
    move_uploaded_file($pic,
        "Public/Home/images/upload/pingzheng/" . $filename);
    $data=$filename;
    return $data;
}
/*
 * 下面团队成员
 * */
function downcount($id){
    $Mem=M('member');
    $res = $Mem->where("repath like '%\\,{$id}\\,%' and ispay=1 ")->count();
    return $res;
}
/*
 * 推荐同级别人数
 * */
function reclevel($id,$ulevel){
    $Mem=M('member');
    $res = $Mem->where("repath like '%\\,{$id}\\,%' and ulevel='$ulevel' and ispay=1 ")->count();
    return $res;
}
/*
 *升级级别
 * */

function updatelevel(){
    $Mem = M('member');
    $res = $Mem->where('id>1 and ispay=1')->order('id desc')->select();
    foreach ($res as $k => $re) {
        $teamnum = downcount($re['id']);
        $salevel = reclevel($re['id'], $re['ulevel']);
        $uplevel = $re['ulevel'];
        if ($re['ulevel'] <= 4 && $teamnum >= 500 && $salevel >= 2) {
            $touplevel = 5;
            $upele = 'A';
        } elseif ($re['ulevel'] <= 3 && $teamnum >= 200 && $salevel >= 3) {
            $touplevel = 4;
            $upele = 'B';
        } elseif ($re['ulevel'] <= 2 && $teamnum >= 50 && $salevel >= 4) {
            $touplevel = 3;
            $upele = 'C';
        } elseif ($re['ulevel'] == 1 && $teamnum >= 10) {
            $touplevel = 2;
            $upele = 'D';
        } else {
            $touplevel = 1;
            $upele = 'E';
        }
        if ($touplevel > $uplevel) {
            $update['userid'] = $re['id'];
            $update['ulevel'] = $re['ulevel'];
            $update['tolevel'] = $touplevel;
            $update['datetime'] = time();
            $Up = M('ulevelup');
            $Up->data($update)->add();
            $data = array('ulevel' => $touplevel, 'e_ulevel' => $upele);
            $Mem->where('id=' . $re['id'] . '')->setField($data);
        }
    }
}

/*
 * 部门号
 * 3级以上自己生成自己的部门号
 * 所有人
 * */
function department(){
    $Mem=M('member');
    $res = $Mem->where('id>0 and ispay=1 and ulevel>=3')->order('id desc')->select();
    foreach ($res as $k => $re) {
            if ($re['ulevel']>=3) {
                $departnum = $re['nickname'] . $re['postcode'];
                $data = array('departnum' => $departnum);
                $Mem->where('id=' . $re['id'] . '')->setField($data);
            }
    }
}
/*
 * 三级以下所有人获取上面部门号
 * */
function depart_down(){
    $Mem=M('member');
    $res = $Mem->where('id>1 and ispay=1')->order('id desc')->select();
    foreach ($res as $k => $re) {
        if ($re['ulevel']<3) {
            $departnum=departnum($re['repath']);
            $data = array('departnum' => $departnum);
            $Mem->where('id=' . $re['id'] . '')->setField($data);
        }
    }
}
/*
 * 部门号
 *单人生成接口
 * */
function departnum($repath){
    $Mem=M('member');
    $res = $Mem->where('id in(0'.$repath.'0)  and ulevel>=3 and departnum>0 and ispay=1')->order('id desc')->limit(1)->find();
    return $res['departnum'];
}

function update_pay_status($order_sn,$order_type){
    if ($order_type=='travel') {
        $M=M('travel_order');
    }else{
        $M=M('order');
    }
    $M->where('order_sn='.$order_sn)->setField('pay_status',1);
    $result=$M->where('order_sn='.$order_sn)->find();
    if ($result['type']==1 && !empty($result['act_id'])) {
        $Mon=new \Common\Lib\Mon();
        $Mon->memact($result['act_id']);
    }elseif($result['type']==2){
        M('store')->where('user_id='.session('id'))->setField('pay_status',1);
    }elseif($result['type']==4){
        uu_trasfer($result['order_sn']);
    }elseif($result['type']==5){
        store_act($order_sn);
    }
}
/*
 * 支付成功
 * 添加库存
*/
function uu_trasfer($order_sn){
    $Order=M('order');
    $Ku=M('uukucun');

    $goods=$Order->where('order_sn='.$order_sn)->find();
    $kucun['user_id']=session('id');
    $kucun['goods_id']=$goods['goods_id'];
    $kucun['goods_sn']=$goods['goods_sn'];
    $kucun['goods_num']=count(array_filter(explode(',',$goods['goods_sn'])));
    $kucun['time']=time();
    $kucun['type']=4;
    $exit=$Ku->where(array('user_id'=>$kucun['user_id'],'goods_id'=>$kucun['goods_id']))->find();
    if ($exit) {
        $kucun['goods_sn']=joinCoding($exit['goods_sn'],$kucun['goods_sn']);
        $kucun['goods_num']+=$exit['goods_num'];
        $Ku->where('id='.$exit['id'])->save($kucun);
    }else{
        $Ku->add($kucun);
    }
}

/*uu册未支付订单退回*/

function checkorderstatus(){

}

/*
 * a长字符串
 * b 是a中的零星包含字符串
*/
function orderdel($a,$b){
    if (!empty($b)) {
        $a=array_filter(explode(',',$a));
        $b=array_filter(explode(',',$b));
        foreach ($a as $key => $value){
            foreach ($b as $bva){
                if ($value==$bva) {
                    $value=null;
                }
                $newa[$key]=$value;
            }
        }
        $newa=array_filter($newa);
        $newa=implode(',',$newa);
        return $newa;
    }else{
        return $a;
    }
}

/*合并两个编码*/
function joinCoding($a,$b){
    if (!empty($b)) {
        $a=array_filter(explode(',',$a));
        $b=array_filter(explode(',',$b));
        foreach ($a as $key => $value){
            foreach ($b as $bva){
                $newa[]=$value;
                $newa[]=$bva;
            }
        }
        $newa=array_filter($newa);
        $newa=implode(',',$newa);
        return $newa;
    }else{
        return $a;
    }
}

/*
 * 店铺升级
 * order_sn
*/
function store_act($order_sn)
{
    $Re=M('storeup_record');
    $record=$Re->where('order_sn='.$order_sn)->find();
    $Re->where('order_sn='.$order_sn)->setField('pay_status','1');
    M('store')->where('user_id='.$record['user_id'])->setField('st_level',$record['tolevel']);
}


