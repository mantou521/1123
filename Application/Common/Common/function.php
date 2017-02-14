<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/8/26
 * Time: 10:32
 */

/**
 * 更改会员级别
 *
 * @param $id
 * @param $tolevel
 */
function exUserLevel($id,$tolevel)
{
    $data['ulevel'] = $tolevel;
    $data['e_ulevel'] = M('ulevel')->where('ulevel =' . $tolevel)->getField('dan');
    $result = M('member')->where('id=' . $id)->setField($data);
}

/**
 * 遍历文件夹
 * @param $dir
 * @return array
 */
function my_scandir($dir){

    // Open a known directory, and proceed to read its contents

    $files=array();
    if(is_dir($dir)){
        if($handle=opendir($dir)){
//            while (($file = $dir->read())!==false) {
            while(($file=readdir($handle))!==false){
                if($file!='.' && $file!=".."){
                    if(is_dir($dir."/".$file)){
                        $files[$file]=my_scandir($dir."/".$file);
                    }else{
                        $files[]=$dir."/".$file;
                    }
                }
            }
        }
    }
    foreach ($files as $va) {
        if (strstr($va,'.')) {
            $image = new \Think\Image();
            $image->open($va);
            $va = str_replace($dir.'/', '', $va);
            $va = str_replace('.jpg', '', $va);
//            echo $va;
//            if (!file_exists($dir.'\thumb\\')) {
//                mkdir($dir.'\thumb\\');
//            }
            // 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.jpg
            $image->thumb(150, 150)->save($dir.'\thumb\\'.$va.'.jpg');
        }
    }
    closedir($handle);

    return $files;
}

function listDir($dir)
{
    $dir .= substr($dir, -1) == '/' ? '' : '/';
    $dirInfo = array();
    foreach (glob($dir . '*') as $v) {
        $dirInfo[] = $v;
        if (is_dir($v)) {
            $dirInfo = array_merge($dirInfo, listDir($v));
        }
    }
    return $dirInfo;
}/**
 * 导出excel
 * @param $strTable	表格内容
 * @param $filename 文件名
 */
function downloadExcel($strTable,$filename)
{
    header("Content-type: application/vnd.ms-excel");
    header("Content-Type: application/force-download");
    header("Content-Disposition: attachment; filename=".$filename."_".date('Y-m-d').".xls");
    header('Expires:0');
    header('Pragma:public');
    echo '<html><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'.$strTable.'</html>';
}

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
/**
 * 检查用户uu册库存
 * @param $uu
 * @return bool
 */
function checkkucun($uu){
    $goods_id = M('out_uu')->where( array( 'uuce' => $uu ))->getField('goods_id');
    $Ku = M('uukucun');
    $uuce = $Ku->where(array('user_id' => session('id'), 'goods_id' => $goods_id))->find();

    $goods_sn = explode(',', $uuce['goods_sn']);
    if (in_array($uu, $goods_sn)) :  return checkIfUser($uu);
    else : return false;
    endif;
}

function checkUuceUse($string_sn){
    $arr = uuSntoArr($string_sn);
    foreach ($arr as $value){
        if (checkIfUser($value)) {
            return false;
        }
    }
}

/**
 * 检查uu册是否被使用
 * @param $uu  单个uuce编号
 * @return bool
 */
function checkIfUser($uu){
    $Uu = M('out_uu');
    $ex = $Uu->where(array( 'uuce' => $uu ))->getField('status');
    if ($ex == 2) {
    	return 0;
    } else {
        return true;
    }
}

/**
 * 返回未使用uu册编号
 * @param $uu
 * @return array
 */
function usableUuce($uu){
    $uu = uuSntoArr($uu);
    foreach ($uu as $value){
       if (checkIfUser($value)) {
       	    $arr[] = $value;
       }
    }
    $str = implode(',',$arr);
    return $str;
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
    $user = $Mem->where(" (username= '$username' or nickname= '$NickName') and ispay=1 ")->find();
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

function getUplevelprobyId($id)
{
    $Up = M('ulevelup');
    $num = $Up->where(" userid= '$id'  ")->count();
    $num -= 1;
    $user = $Up->where(" userid= '$id'  ")->join('think_ulevel ON think_ulevelup.tolevel = think_ulevel.ulevel')->order('think_ulevelup.uid desc')->select();
    if ($user) {
        foreach ($user as $key => $item) {
            $item['lvname'] = $item['lvname'];
            $item['datetime'] = date("Y年m月d日", $item['datetime']);
            $item['wait_time'] = date("Y年m月d日", $item['wait_time']);
            $baar[] = $item;
        }
        return $baar;
    } else {
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
//    if ($num == 1) {
//        $image = new \Think\Image();
//        $image->open('D:\htdocs\uufx\Public\Home\images\upload\\' . $filename);
//        // 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.jpg
//        $image->thumb(150, 150)->save('D:\htdocs\uufx\Public\Home\images\upload\thumb\\' . $filename);
//    }

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
 *升级级别达标记录，不升级
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
            $update['wait_time'] = time();
            $update['status'] = 0;
            $Up = M('ulevelup');
            $Up->data($update)->add();
            $data = array('ulevel' => $touplevel, 'e_ulevel' => $upele);
//            $Mem->where('id=' . $re['id'] . '')->setField($data);
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
    $res = $Mem->where('id in (0'.$repath.'0)  and ulevel>=3 and departnum>0 and ispay=1')->order('id desc')->limit(1)->find();
    return $res['departnum'];
}

function update_pay_status($order_sn, $order_type)
{
    if ($order_type == 'travel') {
        $M = M('travel_order');
    } else {
        $M = M('order');
    }
    $save['pay_time'] = time();
    $save['pay_status'] = 1;
    $M->where('order_sn=' . $order_sn)->save($save);
    $result = $M->where('order_sn=' . $order_sn)->find();
    if ($result['type'] == 1 && !empty($result['act_id'])) {
        $Mon = new \Common\Lib\Mon();
        $Mon->memact($result['act_id']);
    } elseif ($result['type'] == 2) {
        store_act(session('id'));
    }  elseif ($result['type'] == 4) {
        uu_trasfer($result['order_sn'], $result['total']);
    } elseif ($result['type'] == 5) {
        store_up($order_sn);
    } elseif ($result['type'] == 6) {
        inner_order($order_sn,$result['user_id'],$result['goods_id']);
    }
}

/*
 * 内部转让付款
 * */
function inner_order($order_sn,$user_id,$goods_id){
    $uurecord = M('uurecord')->where('order_sn='.$order_sn)->find();
    $touser = getMemberbyNickName($uurecord['user_num']);
    $toid = $touser['id'];
    $Uuce = new \Common\Lib\Uuce();
    $Uuce->uu_transfer($user_id, $toid, $goods_id, $uurecord['goods_sn'],1);
}

/**
 * uu册报单
 * 支付成功,添加库存,销售提成
 * 向上添加uu册个数
 * @param $order_sn
 * @param $total
 */
function uu_trasfer($order_sn, $total)
{
    $Order = M('order');
    $Ku = M('uukucun');
    $goods = $Order->where('order_sn=' . $order_sn)->find();

    $Mon = new \Common\Lib\Mon();
    $Mon->uuSaleBonus(session('id'), $total);   //销售提成

//    $Mon->addArea(session('id'), $goods['goods_num'] , 0);   //向上添加uu册个数
    $kucun['user_id'] = session('id');
    $kucun['goods_id'] = $goods['goods_id'];
    $kucun['goods_sn'] = $goods['goods_sn'];
    $kucun['goods_num'] = count(array_filter(explode(',', $goods['goods_sn'])));
    $kucun['time'] = time();
//    $kucun['type']=4;
    $exit = $Ku->where(array('user_id' => $kucun['user_id'], 'goods_id' => $kucun['goods_id']))->find();
    if ($exit) {
        $kucun['goods_sn'] = joinCoding($exit['goods_sn'], $kucun['goods_sn']);
        $kucun['goods_num'] += $exit['goods_num'];
        $Ku->where('id=' . $exit['id'])->save($kucun);
    } else {
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
/*
 * uu编号是否包含
 * a 大的
 * */
function existUusn($a,$b){
    $flag = true ;
    $a=array_filter(explode(',',$a));
    $b=array_filter(explode(',',$b));
    foreach($b as $v){
        if(!in_array($v,$a)){
            $flag=false;
            break;
        }
    }
    return $flag;
}


/**
 * 将数据库中uu册编号处理返回
 * @param $sn
 * @return array|ø
 */
function uuSntoArr($sn){
    $a = array_filter(explode(',', $sn));
    return $a;
}

/**
 * 处理uu册编号
 * @param $sn   uu册编号
 * @return string
 */
function uuSntoSt($sn){
    $a=array_filter(explode(',',$sn));
    $newa=implode(',',$a);
    return $newa;
}

/*合并两个编码*/
function joinCoding($a,$b){
    if (!empty($b)) {
        $a=array_filter(explode(',',$a));
        $b=array_filter(explode(',',$b));
        foreach ($a as $key => $value){
            $newa[]=$value;
        }
        foreach ($b as $bva){
            $newa[]=$bva;
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
function store_up($order_sn)
{
    $Re=M('storeup_record');
    $record=$Re->where('order_sn='.$order_sn)->find();
    $Re->where('order_sn='.$order_sn)->setField('pay_status','1');
    M('store')->where('user_id='.$record['user_id'])->setField('st_level',$record['tolevel']);
}

function store_act($user_id)
{
    $userStore = M('store')->where('user_id=' . $user_id)->find();
    $save = [
        'isbd' => 1,
        'bdlevel' => $userStore['st_level']
    ];

    M('member')->where('id =' . $user_id)->save($save);
    M('store')->where('user_id=' . $user_id)->setField('pay_status', 1);

}


